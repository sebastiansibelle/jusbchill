class AddOrderToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :running_order, :integer
  end
end
