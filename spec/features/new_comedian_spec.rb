require 'rails_helper'

describe "user creates a new comedian" do
  describe "they link from the comedians index" do
    describe "they fill in a name, age, and city" do
      it "creates a new comedian" do
        visit '/comedians/new'

        expect(page).to have_content("Name")
        expect(page).to have_content("Age")
        expect(page).to have_content("Birthplace")
      end

      it "accepts input for new comedian and redirects to main page" do
        visit '/comedians/new'

        fill_in "comedian[name]", with: "Mitch Hedberg"
        fill_in "comedian[age]", with: "37"
        fill_in "comedian[birthplace]", with: "St Paul, MN"
        click_on "Create Comedian"

        expect(current_path).to eq("/comedians")
      end

      it "accepts input for new comedian, redirects to main page, displays new comedian" do
        visit '/comedians/new'

        fill_in "comedian[name]", with: "Mitch Hedberg"
        fill_in "comedian[age]", with: "37"
        fill_in "comedian[birthplace]", with: "St Paul, MN"
        click_on "Create Comedian"

        # comedian = Comedian.last
# require 'pry'; binding.pry
        # save_and_open_page
        # within "#comedian-#{comedian.id}" do
          expect(page).to have_content("Mitch Hedberg")
          expect(page).to have_content("37")
          expect(page).to have_content("St Paul, MN")
        # end
      end
    end
  end
end
