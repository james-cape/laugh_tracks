require 'rails_helper'

describe "user sees one comedian" do
  describe "they link from the article index" do
    it "shows information for one comedian" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 34, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      visit comedians_path

      click_link comedian_2.name

      expect(page).to_not have_content(comedian_1.name)
      expect(page).to_not have_content(comedian_1.age)
      expect(page).to have_content(comedian_2.name)
      expect(page).to have_content(comedian_2.age)
    end
  end
end
