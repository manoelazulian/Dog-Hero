class CreateHeroes < ActiveRecord::Migration[5.1]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :mail
      t.string :phone
      t.string :address
      t.string :about
      t.timestamps
    end
  end
end
