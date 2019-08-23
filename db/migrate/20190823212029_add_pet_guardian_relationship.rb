class AddPetGuardianRelationship < ActiveRecord::Migration[5.1]
  def change
    add_reference :pets, :guardian, foreign_key: true, index: true
  end
end
