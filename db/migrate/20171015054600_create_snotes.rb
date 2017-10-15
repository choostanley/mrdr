class CreateSnotes < ActiveRecord::Migration[5.0]
  def change
    create_table :snotes do |t|
      t.string :title
      t.text :answer
      t.text :pnote
      t.integer :freq , default: 0
      t.references :user, foreign_key: true, index: true
      t.references :note, foreign_key: true, index: true

      t.timestamps
    end
  end
end
