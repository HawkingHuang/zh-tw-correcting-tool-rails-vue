class Report < ApplicationRecord
  validates :username, presence: true
  validates :correct_word, presence: true
  validates :incorrect_word, presence: true
  validates :response, presence: true
end
