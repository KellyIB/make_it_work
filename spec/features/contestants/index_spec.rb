require 'rails_helper'

describe "contestant index page" do
  describe "as a visitor" do
    before :each do
      @next_gen_designer = Challenge.create!(theme: "Looking Forward", project_budget: 1000)
      @looking_back = Challenge.create!(theme: "The Better Old Days", project_budget: 1500)
      @kicks = Challenge.create!(theme: "Fabulous Feet", project_budget: 4000)

      @retro_art = @looking_back.projects.create!(name: "Retro Art", material: "Records")
      @future_vision = @next_gen_designer.projects.create!(name: "Future Vision", material: "Goggles")
      @nerdy_feet = @kicks.projects.create!(name: "Nerdy Feet", material:"Crocs")

      @bob = Contestant.create!(name: "Bob Jones", age: "28", hometown: "Milwaukee", years_of_experience: "8")
      @tin = Contestant.create!(name: "Tin Lee", age: "31", hometown: "Phoenix", years_of_experience: "12")
      @janice = Contestant.create!(name: "Janice Cherin", age: "39", hometown: "Chicago", years_of_experience: "17")

      @nerdy_feet.contestants << @janice
      @retro_art.contestants << @bob
      @future_vision.contestants << @tin

    end


    it "it lists all contestants and the projects theyve worked on" do
      visit "/contestants"
      within "#contestant-#{@bob.id}" do
        expect(page).to have_content("Name: #{@bob.name}")
        expect(page).to have_content("Age: #{@bob.age}")
        expect(page).to have_content("Hometown: #{@bob.hometown}")
        expect(page).to have_content("Years of Experience: #{@bob.years_of_experience}")
        expect(page).to have_content("Projects: Retro Art")
      end

      within "#contestant-#{@tin.id}" do
        expect(page).to have_content("Name: #{@tin.name}")
        expect(page).to have_content("Age: #{@tin.age}")
        expect(page).to have_content("Hometown: #{@tin.hometown}")
        expect(page).to have_content("Years of Experience: #{@tin.years_of_experience}")
        expect(page).to have_content("Projects: Future Vision")
      end

      within "#contestant-#{@bob.id}" do
        expect(page).to have_content("Name: #{@janice.name}")
        expect(page).to have_content("Age: #{@janice.age}")
        expect(page).to have_content("Hometown: #{@janice.hometown}")
        expect(page).to have_content("Years of Experience: #{@janice.years_of_experience}")
        expect(page).to have_content("Projects: Nerdy Feet")
      end
    end
  end
end
