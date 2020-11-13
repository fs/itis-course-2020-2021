class Task < ApplicationRecord
  validates :title, presence: true

  has_many :comments

  scope :actual, -> { where('created_at > :date', date: Date.today - 1.month) }
  scope :super_actual, -> { where(updated_at: Date.today - 1.month) }
end
