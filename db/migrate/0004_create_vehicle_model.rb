class CreateVehicleModel < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.column :license_plate, :string
      t.column :colour, :string
      t.column :make, :string
      t.column :model, :string
      t.column :year, :string
      t.references :user
    end
  end

  def self.down
    drop_table :vehicles
  end
end