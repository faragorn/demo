class CreatePersonModel < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :address, :string
      t.column :city, :string
      t.column :postal_code, :string
      t.column :phone_number, :string
      t.column :province, :string
      t.references :user
    end
  end

  def self.down
    drop_table :people
  end
end