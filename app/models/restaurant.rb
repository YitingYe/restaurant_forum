class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  belongs_to :category
  has_many :comments, dependent: :destroy
  default_scope { order(created_at: :desc) }

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
end
