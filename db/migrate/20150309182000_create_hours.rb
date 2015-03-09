class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :project_id
      t.integer :developer_id
      t.date :worked_on
      t.decimal :duration

      t.timestamps null: false
    end
  end
end
