class AddDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :groups, :icon, from: nil, to: 'https://raw.githubusercontent.com/Daron976/portfolio/main/images/7479956-removebg.png'
  end
end
