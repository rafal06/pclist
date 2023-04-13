class CreateMachines < ActiveRecord::Migration[7.0]
  def change
    create_table :machines do |t|
      t.string :name
      t.string :type
      t.string :brand
      t.string :model
      t.date :release_date
      t.date :production_date
      t.integer :condition
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
