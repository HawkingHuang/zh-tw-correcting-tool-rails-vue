class ReportReply < ApplicationRecord
  belongs_to :report
  validates :response, presence: true
end
