class CardCost
  include Mongoid::Document
  include Mongoid::Timestamps

  field :country_code, type: String
  field :cost, type: Integer

  validates :country_code, presence: true
  validates :cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
