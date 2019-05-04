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

      #   expect(current_path).to eq(new_comedian_path)
      #
      #   fill_in "comedian[name]", with: "New Name!"
      #   fill_in "comedian[age]", with: "New Age!"
      #   fill_in "comedian[city]", with: "New City!"
      #   click_on "Create Comedian"
      #
      #   expect(page).to have_content("New Name!")
      #   expect(page).to have_content("New Age!")
      #   expect(page).to have_content("New City!")
      # end
    end
  end
end
