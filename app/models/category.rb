class Category < ApplicationRecord
  validates_presence_of :name
  has_many :restaurants
  default_scope { order(created_at: :desc) }
end
