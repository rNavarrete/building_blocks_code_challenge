require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should have an admin attribute" do
    user = User.create(admin: true, password: "secret")
    expect(user).to be_valid
  end
end
