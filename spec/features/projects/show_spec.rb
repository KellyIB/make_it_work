require 'rails_helper'

describe "project show page" do
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
      @nerdy_feet.contestants << @tin
      @retro_art.contestants << @janice
      @future_vision.contestants << @bob

    end

    it "when I visit a project show page I see the project name,
      and material, and number of contestants. I also see the theme of the Challenge it belongs to" do
      visit "/projects/#{@retro_art.id}"
      expect(page).to have_content("Retro Art")
      expect(page).to have_content("Records")
      expect(page).to have_content("#{@looking_back.theme}")
      expect(page).to have_content("Number of Contestants: 2")
      expect(page).to have_content("Average Years of Contestant Experience: 2")

    end

  end
end
