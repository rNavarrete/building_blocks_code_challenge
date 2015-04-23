require "rails_helper"

RSpec.describe "Admin", :type => :feature do
  it "can log in" do
    user = User.create(email: "therock@wwe.com",first_name: "lucy", admin: true, password: "godfather")
    
    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button 'Sign In'
    expect(current_path).to eq(admin_dashboard_path)
  end
end
