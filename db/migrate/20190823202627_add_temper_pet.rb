class AddTemperPet < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :temper, :string
    add_column :pets, :castrated, :string
    add_column :pets, :about, :text

    remove_column :pets, :hair_length, :string
  end
end
