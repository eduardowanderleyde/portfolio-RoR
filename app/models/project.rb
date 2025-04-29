class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :technologies, presence: true
  validates :github_link, presence: true
  validates :deploy_link, presence: true

  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?

    unless image.blob.byte_size <= 5.megabyte
      errors.add(:image, "deve ser menor que 5MB")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "deve ser um JPEG ou PNG")
    end
  end
end
