class DropClientsTable < ActiveRecord::Migration
  def up
    drop_table :clients
  end

  def down
    # noop
  end
end
