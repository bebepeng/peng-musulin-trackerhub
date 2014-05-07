require 'spec_helper'

feature "Welcome" do
  scenario "User sees welcome page" do
    visit '/'

    expect(page).to have_link "View projects"
  end
end