class Report < ApplicationRecord
  has_many :replies, class_name: 'ReportReply', dependent: :destroy
  
  validates :username, presence: true
  validates :correct_word, presence: true
  validates :incorrect_word, presence: true
  validates :response, presence: true
end
