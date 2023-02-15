class AddForeignKeysToGroupDealing < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :group_dealings, :groups, column: :group_id, on_delete: :cascade
    add_foreign_key :group_dealings, :dealings, column: :dealing_id, on_delete: :cascade
  end
end
