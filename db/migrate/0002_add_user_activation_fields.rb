class AddUserActivationFields < ActiveRecord::Migration
  def self.up
    add_column :users, :activation_token, :string
    add_column :users, :activation_expires_after, :datetime
  end

  def self.down
    remove_column :users, :activation_token
    remove_column :users, :activation_expires_after
  end
end