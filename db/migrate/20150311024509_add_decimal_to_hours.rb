class AddDecimalToHours < ActiveRecord::Migration
  def change
    change_column :hours, :duration, :decimal, precision: 10, scale: 2
  end
end
