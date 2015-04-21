require "rails_helper"

RSpec.describe "authenticated user", :type => :feature do
  it "can signup and select a desk from the three different choices" do
    visit "/signup"
    fill_in "user_email", with: "rolando.e.navarrete@gmail.com"
    fill_in "user_username", with: "ghostface"
    fill_in "user_password", with: "godfather"
    fill_in "user_password_confirmation", with: "godfather"
    fill_in "user_first_name", with: "rolando"
    fill_in "user_last_name", with: "navarrete"
    click_on "Create User"
    expect(page).to have_content("rolando")
    expect(page).to have_content("Choose your desk")
    choose("user___desk_preference____Basic__")
    click_on "Submit desk selection"
    expect(page).to have_content("Hey thanks for picking a desk, you selected the basic desk, remember Building Blocks loves you.")
  end
end
