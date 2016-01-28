class SorceryCore < ActiveRecord::Migration
  def change
  	add_column :shoppe_users, :email, :string,  :null => false, default: ""
  	add_column :shoppe_users, :crypted_password, :string
  	add_column :shoppe_users, :salt, :string

  end
end