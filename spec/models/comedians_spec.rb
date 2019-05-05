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

  describe "it has helper methods" do
    it "has calculates average age, unique ages, and unique cities" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')
      Comedian.create(name: "Bill Burr", age: 20, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      Comedian.create(name: "Joe Rogan", age: 50, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")
      Comedian.create(name: "Joe Smith", age: 50, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      expect(Comedian.all.average_age).to eq(40)
      expect(Comedian.all.unique_cities.sort).to eq(["Canton, MA", "Newark, NJ"])
      expect(Comedian.all.unique_ages.sort).to eq([20, 50])
    end
  end
end
