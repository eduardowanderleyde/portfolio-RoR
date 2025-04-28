class Experience < ApplicationRecord
  belongs_to :user

  validates :company, presence: true
  validates :role, presence: true
  validates :start_date, presence: true
  validates :description, presence: true

  scope :ordered, -> { order(start_date: :desc) }
end 