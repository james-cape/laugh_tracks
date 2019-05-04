require 'rails_helper'

describe Comedian, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:birthplace)}
  end

  describe "relationships" do
    it {should have_many :specials}
  end
end
