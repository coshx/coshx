class AddedDeletedAtToAdmin < ActiveRecord::Migration
 def change
    add_column :admins, :deleted_at, :datetime
  end
end
