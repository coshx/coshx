class NullAdmin
  include Singleton

  def slug
    "not_found"
  end

  def github
    "not_found"
  end

  def twitter
    "not_found"
  end

  def name
    "Sorry, we couldn't find that person"
  end

  def nickname
    ''
  end

  def bio
    ''
  end

  def likes
    "Summer breezes, strolls on the beach, and Pho"
  end

  def dislikes
    "Not being missing, the thick outline around me, and being part of the astral plane"
  end
end
