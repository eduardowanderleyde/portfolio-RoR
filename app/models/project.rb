class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :technologies, presence: true
  validates :github_link, presence: true
  validates :deploy_link, presence: true
end
