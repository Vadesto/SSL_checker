class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.integer :status, null: false

      t.timestamps
    end
    add_index :links, :name, unique: true
  end
end
