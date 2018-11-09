class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
