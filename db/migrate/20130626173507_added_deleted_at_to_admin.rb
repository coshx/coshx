class AddedDeletedAtToAdmin < ActiveRecord::Migration
 def change
    add_column :deleted_at, :datetime
  end
end
