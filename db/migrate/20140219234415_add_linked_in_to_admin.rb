class AddLinkedInToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :linked_in, :string
  end
end
