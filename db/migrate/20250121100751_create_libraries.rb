class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :correct_word
      t.string :incorrect_word
      t.string :bpmf_category, index: true

      t.timestamps
    end
  end
end
