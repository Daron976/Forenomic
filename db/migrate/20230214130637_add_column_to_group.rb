class AddColumnToGroup < ActiveRecord::Migration[7.0]
  def change
    change_table :groups do |t|
      t.integer :total,              null: false, default: 0
    end
  end
end
