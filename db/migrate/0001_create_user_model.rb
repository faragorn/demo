class CreateUserModel < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
    end
  end

  def self.down
    drop_table :users
  end
end