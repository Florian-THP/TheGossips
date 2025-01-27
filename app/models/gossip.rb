class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments

  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
