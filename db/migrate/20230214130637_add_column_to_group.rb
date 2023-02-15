class AddColumnToGroup < ActiveRecord::Migration[7.0]
  def change
    change_table :groups do |t|
      t.integer :total,              default: 0
    end
  end
end
