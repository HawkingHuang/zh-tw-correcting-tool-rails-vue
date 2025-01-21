class CreateCustoms < ActiveRecord::Migration[7.1]
  def change
    create_table :customs do |t|
      t.string :correct_word
      t.string :incorrect_word
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
