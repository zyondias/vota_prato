class CreatePratoRestaurantesJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :pratos_restaurante, :id => false do |t|
  		t.integer :prato_id
  		t.integer :restaurante_id
  	end
  end

  def self.down
  	drop_table :pratos_restaurante
  end
end
