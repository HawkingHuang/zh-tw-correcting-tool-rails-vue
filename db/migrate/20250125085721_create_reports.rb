class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :username
      t.string :correct_word
      t.string :incorrect_word
      t.text :response

      t.timestamps
    end
  end
end
