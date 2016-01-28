class AddNickNameToShoppeUser < ActiveRecord::Migration
  def change
    add_column :shoppe_users, :nickname, :string,  :null => false, default: ""
  end
end
