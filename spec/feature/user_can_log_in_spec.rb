require "rails_helper"

RSpec.describe "User Sessions", :type => :feature do
  it "can log in" do
    user = User.create(email: "therock@wwe.com",first_name: "lucy", admin: nil, password: "godfather")

    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button 'Sign In'
    expect(current_path).to eq(user_dashboard_path)
  end
end
