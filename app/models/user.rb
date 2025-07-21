class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String
  field :role, type: String

  validates :username, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 50 }
end
