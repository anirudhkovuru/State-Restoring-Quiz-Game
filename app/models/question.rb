class Question < ApplicationRecord
  validates :question, presence: true, length: { maximum: 400 }, uniqueness: true
  validates :opt1, presence: true, length: { maximum: 100 }
  validates :opt2, presence: true, length: { maximum: 100 }
  validates :opt3, presence: true, length: { maximum: 100 }
  validates :opt4, presence: true, length: { maximum: 100 }
  validates :genre, presence: true, length: { maximum: 50 }
end
