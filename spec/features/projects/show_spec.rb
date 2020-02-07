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
    end

    it "when I visit a project show page I see the project name,
      and material. I also see the theme of the Challenge it belongs to" do
      visit "/projects/#{@retro_art.id}"
      expect(page).to have_content("Retro Art")
      expect(page).to have_content("Records")
      expect(page).to have_content("#{@looking_back.theme}")
    end
  end
end
