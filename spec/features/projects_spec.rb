require 'spec_helper'

feature 'projects' do
  feature 'project index' do
    scenario 'User can see all projects' do
      visit '/'
      VCR.use_cassette('features/project_index/project') do
        click_on 'View projects'

        expect(page).to have_content "Peng and Musulin's TrackerHub"
        expect(page).to have_content 'Listen To'
      end
    end
  end

  feature 'stories for a project' do
    scenario 'User can see all stories for a project' do
      visit '/'
      VCR.use_cassette('features/stories_index/stories') do
        click_on 'View projects'
        click_on "Peng and Musulin's TrackerHub"

        expect(page).to have_content 'As a user, I can view all of my projects'
        expect(page).to have_content 'As a user, I can view all of the stories for a project'
      end
    end

    scenario 'Users can see all comments associtated with the projects' do
      visit '/'
      VCR.use_cassette('features/stories_index/comments') do
        click_on 'View projects'
        click_on "Peng and Musulin's TrackerHub"

        expect(page).to have_content 'This is a test comment on the first story'
        expect(page).to have_content 'This is a second test comment on the first story'
      end
    end

    scenario "Users can see github comments associated with the tracker project" do
      visit '/'
      VCR.use_cassette('features/stories_index/github_comments') do
        click_on 'View projects'
        click_on "Peng and Musulin's TrackerHub"

        expect(page).to have_content 'Mutating projects with the .map! method changes the contents of project.'
        expect(page).to have_content 'Please take some time to integrate VCR and make sure you can run your tests even when you wireless connection is turned off.'
      end
    end
  end
end