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

      it "accepts input for new comedian features and displays on main page" do
        visit '/comedians/new'

        fill_in "comedian[name]", with: "Mitch Hedberg"
        fill_in "comedian[age]", with: "37"
        fill_in "comedian[birthplace]", with: "St Paul, MN"
        click_on "Create Comedian"

        comedian = Comedian.last

        expect(current_path).to eq("/comedians")


        #
        # expect(page).to have_content("New Name!")
        # expect(page).to have_content("New Age!")
        # expect(page).to have_content("New City!")
      end
    end
  end
end
