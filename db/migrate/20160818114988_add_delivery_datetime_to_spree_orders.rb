class AddDeliveryDatetimeToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :delivery_datetime, :datetime
    add_index  :spree_orders, :delivery_datetime
  end
end
