class CreateReportReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :report_replies do |t|
      t.references :report, null: false, foreign_key: true
      t.string :correct_word
      t.string :incorrect_word
      t.text :response
      t.string :username

      t.timestamps
    end
  end
end
