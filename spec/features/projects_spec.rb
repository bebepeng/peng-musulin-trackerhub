require 'spec_helper'

feature 'projects' do
  scenario 'User can see all projects' do
    visit '/'
    click_on 'View projects'

    expect(page).to have_content %Q{Peng and Musulin's TrackerHub}
    expect(page).to have_content 'Listen To'
  end

  scenario 'User can see all stories for a project' do
    visit '/'
    click_on 'View projects'
    click_on %Q{Peng and Musulin's TrackerHub}

    expect(page).to have_content 'As a user, I can view all of my projects'
    expect(page).to have_content 'As a user, I can view all of the stories for a project'
  end
end