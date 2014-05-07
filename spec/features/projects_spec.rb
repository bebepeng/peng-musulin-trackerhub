require 'spec_helper'

feature 'projects' do
  scenario 'User can see all projects' do
    visit '/'
    click_on 'View projects'

    expect(page).to have_content "Peng and Musulin's TrackerHub"
    expect(page).to have_content "Listen To"
  end
end