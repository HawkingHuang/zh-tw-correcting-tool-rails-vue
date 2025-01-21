class Library < ApplicationRecord
  validates :correct_word, presence: true
  validates :incorrect_word, presence: true
  
  validates :bpmf_category, presence: true, inclusion: { 
    in: %w[bpmf1 bpmf2 bpmf3 bpmf4 bpmf5 bpmf6 bpmf7 bpmf8 bpmf9 bpmf10 bpmf11 bpmf12 bpmf13 bpmf14 bpmf15 bpmf16 bpmf17 bpmf18 bpmf19 bpmf20 bpmf21 bpmf22 bpmf23 bpmf24 bpmf25 bpmf26 bpmf27 bpmf28 bpmf29 bpmf30 bpmf31 bpmf32 bpmf33 bpmf34 bpmf35 bpmf36 bpmf37], 
    message: "%{value} is not a valid bpmf_category"
  }
end
