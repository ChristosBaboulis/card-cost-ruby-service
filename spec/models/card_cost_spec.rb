require 'rails_helper'

RSpec.describe CardCost, type: :model do
  subject { described_class.new(country_code: "GR", cost: 10) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a country_code" do
    subject.country_code = nil
    expect(subject).not_to be_valid
  end

  it "is invalid without a cost" do
    subject.cost = nil
    expect(subject).not_to be_valid
  end

  it "is invalid if cost is negative" do
    subject.cost = -1
    expect(subject).not_to be_valid
  end

  it "is invalid if cost is not an integer" do
    subject.cost = 1.5
    expect(subject).not_to be_valid
  end
end
