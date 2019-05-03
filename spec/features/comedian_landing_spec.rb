require 'rails_helper'

describe "user sees all comedians" do

  describe "they visit /comedians" do
    it "displays all comedians" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')
      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      visit '/comedians'
        expect(page).to have_content(comedian_1.name)
        expect(page).to have_content(comedian_2.name)
    end

    it "displays comedian info in the specific comedian area" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')

      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      visit '/comedians'

      within '#comedian-1' do
        expect(page).to have_content("Bill Burr")
        expect(page).to have_content("50")
        expect(page).to have_content("Canton, MA")
      end

      within "#comedian-#{comedian_2.id}" do
        expect(page).to have_content("Joe Rogan")
        expect(page).to have_content("51")
        expect(page).to have_content("Newark, NJ")
      end
    end

    it "displays each comedian's TV specials" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')

      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      comedian_1.specials.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
      comedian_1.specials.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
      comedian_1.specials.create(name: "You People Are All The Same", runtime_mins: 69, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Strange Times", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNzc2Mzg5YmMtMzM1NC00NDgwLTljYWQtZDdkNzBmNjZkNmJhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg")
      comedian_2.specials.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg")

      visit '/comedians'

      expect(page).to have_content("Walk Your Way Out")
      expect(page).to have_content("I'm Sorry You Feel That Way")
      expect(page).to have_content("You People Are All The Same")
      expect(page).to have_content("Strange Times")
      expect(page).to have_content("Triggered")
      expect(page).to have_content("Rocky Mountain High")
    end

    it "displays each comedian's thumbnail" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')

      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      comedian_1.specials.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
      comedian_1.specials.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
      comedian_1.specials.create(name: "You People Are All The Same", runtime_mins: 69, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Strange Times", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNzc2Mzg5YmMtMzM1NC00NDgwLTljYWQtZDdkNzBmNjZkNmJhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg")
      comedian_2.specials.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg")

      visit '/comedians'

      expect(page).to have_xpath("//img[contains(@src,'https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg')]")
      expect(page).to have_xpath("//img[contains(@src,'https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg')]")
    end

    it "displays comedians according to age" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')

      comedian_1 = Comedian.create(name: "Bill Burr", age: 34, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      comedian_1.specials.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
      comedian_1.specials.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
      comedian_1.specials.create(name: "You People Are All The Same", runtime_mins: 69, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Strange Times", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNzc2Mzg5YmMtMzM1NC00NDgwLTljYWQtZDdkNzBmNjZkNmJhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg")
      comedian_2.specials.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg")

      visit '/comedians?age=34'

      expect(page).to have_content(comedian_1.name)
      expect(page).to_not have_content(comedian_2.name)
    end

    it "count of each comedians TV specials" do
      ActiveRecord::Base.connection.reset_pk_sequence!('comedians')

      comedian_1 = Comedian.create(name: "Bill Burr", age: 34, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC_400x400.jpeg")

      comedian_1.specials.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
      comedian_1.specials.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
      comedian_1.specials.create(name: "You People Are All The Same", runtime_mins: 69, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Strange Times", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNzc2Mzg5YmMtMzM1NC00NDgwLTljYWQtZDdkNzBmNjZkNmJhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      comedian_2.specials.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg")
      comedian_2.specials.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg")

      visit '/comedians'

      within "#comedian-#{comedian_2.id}" do
        expect(page).to have_content("3")
      end
    end


  end
end
