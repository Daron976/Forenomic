class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :dealings, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :groups, :users, column: :author_id, on_delete: :cascade
  end
end
