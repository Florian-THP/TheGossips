class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :Comments
  has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"
  has_many :likes, dependent: :destroy
  has_many :liked_gossips, through: :likes, source: :gossip
end
