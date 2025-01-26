class RemoveCorrectWordAndIncorrectWordFromReportReplies < ActiveRecord::Migration[7.1]
  def change
    remove_column :report_replies, :correct_word, :string
    remove_column :report_replies, :incorrect_word, :string
  end
end
