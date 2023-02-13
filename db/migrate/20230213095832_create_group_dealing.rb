class CreateGroupDealing < ActiveRecord::Migration[7.0]
  def change
    create_table :group_dealings do |t|
      t.integer :group_id
      t.integer :dealing_id

      t.timestamps
    end
  end
end
