class AddSalePercentageToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sale_percentage, :integer
  end
end
