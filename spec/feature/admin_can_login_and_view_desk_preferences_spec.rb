require "rails_helper"

RSpec.describe "Admin", :type => :feature do
  it "can log in" do
    user = User.create(first_name: "Lucy", admin: true, password: "godfather")
    
    visit "/"
    save_and_open_page
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button 'Sign In'
    current_path.should eq admin_dashboard_path
  end
end
