require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario 'User can add and view a food' do
    visit '/'

    click_on "Add a new food"

    fill_in "name", with: "Pizza"
    fill_in "ethnicity", with: "Italian"
    fill_in "year_eaten", with: "2014"

    click_on "Add Food"

    expect(page).to have_content "Pizza"
    expect(page).to have_content "Italian"
    expect(page).to have_content "2014"

  end
end