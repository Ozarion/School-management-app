class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
