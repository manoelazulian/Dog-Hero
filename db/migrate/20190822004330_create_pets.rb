class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :hair_length
      t.string :age
      t.string :size
      t.timestamps
    end
  end
end

