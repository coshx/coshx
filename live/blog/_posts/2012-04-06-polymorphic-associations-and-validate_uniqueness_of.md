---
layout: post
title: Polymorphic Associations and validate_uniqueness_of
author: ryan@coshx.com
---
One of my favorite helper libraries when testing is [thoughtbot's shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers). They do a great job making common situations easy to test in one line, but I recently ran into a gotcha with the `validate_uniqueness_of` matcher. Validating both uniqueness of a polymorphic association and another validation on the same association can cause some strange error messages regarding undefined classes due to the way scoping and validations are handled.

The Problem
-----------

For an example application, we have some classes that are related to each other with a polymorphic association. In this case, college students and courses. The uniqueness restriction comes in because we want to ensure that each student is only registered for the course once, but we want to make sure that an `UndergradStudent` and a `GraduateStudent` can both take the course at the same time even if they have the same `id`.

```ruby
# test
describe Enrollment do
  # valudate_uniqueness_of requires a previously created model
  before(:each) { Factory.create :enrollment }

  it { should validate_uniqueness_of(:course_id).scoped_to :enrollee_type, :enrollee_id }
end

# implementation
class Enrollment
  belongs_to :enrollee, :polymorphic => true
  belongs_to :course

  validates_uniqueness_of :course_id, :scope => [:enrollee_type, :enrollee_id]
  validates_presence_of :course
  validates_presence_of :enrollee
end

class UndergradStudent
  has_many :courses, :as => :enrollee
end

class GraduateStudent
  has_many :courses, :as => :enrollee
end

class Course
  has_many :enrollments
end
```

Perfect. Now we go ahead and run our uniqueness test and have a beer after a long day...

    Failures:

      1) Enrollment
         Failure/Error: it { should validate_uniqueness_of(:course_id).scoped_to :enrollee_type, :enrollee_id }
         NameError:
           uninitialized constant UndergradStudenu

Or not. UndergradStudenu? Where in the world did that come from?

The Source
----------

The source of this error is a combination of three things.

* How `ValidateUniquenessOfMatcher` changes the uniqueness scope.
* The fact that `AllowValueMatcher` calls `#valid?` on our model to see if the error message matches what is expected.
* The existence of `validates_presence_of :enrollee` in our code.

`ValidateUniquenessOfMatcher` generates a scope value that should not trigger a uniqueness error by using `#next`.

```ruby
next_value = if previous_value.respond_to?(:next)
  previous_value.next
else
  previous_value.to_s.next
end
```

`AllowValueMatcher` calls `#valid?` on our model.

```ruby
def errors_match?
  @instance.valid?
  @errors = errors_for_attribute(@instance, @attribute)
  @errors = [@errors] unless @errors.is_a?(Array)
  @expected_message ? (errors_match_regexp? || errors_match_string?) : (@errors.compact.any?)
end
```

The last piece of the puzzle is our `validates_presence_of :enrollee`. `@instance` from above is

```ruby
#<Enrollment id: nil, enrollee_id: 1, enrollee_type: "UndergradStudenu", course_id: 1>
```

Without the presence validation, we would never load the `enrollee` object and our test would pass. Without the full validation caused by calling `@instance.valid?` we would similarly never load the `enrollee` object and our test would pass. The combination means that the presence validator attempts to load the full enrollee object and cannot, because its type does not represent a real class.

The Workaround
--------------

Pleasing the matcher can be done by simply declaring `UndergradStudenu` as a class in the test file that inherits from one of the possible types of `enrollee`.

```ruby
describe Enrollment do
  # two lines to make the matcher happy
  class UndergradStudenu < GraduateStudent; end
  before(:each) { Factory.create :enrollment }

  it { should validate_uniqueness_of(:course_id).scoped_to :enrollee_type, :enrollee_id }
end
```

This allows the presence validation to continue without raising an error. And finally:

    1 example, 0 failures
