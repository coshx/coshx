class AddSortOrderToServices < ActiveRecord::Migration
  def change
    # since we have variable size 'display blocks' for the services, the order is important
    # this isn't a very elegant way to do this, but... DTSTTCPW
    add_column :services, :sort_order, :integer
  end
end
