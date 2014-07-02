require 'spec_helper'

feature 'User can Crud Snacks' do
  scenario 'User can create and view snacks in list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add snack'
    fill_in 'Name', with: 'ice cream'
    fill_in 'Quality', with: 'creamy delicious'
    click_on 'Create snack'
    expect(page).to have_content 'ice cream'
    expect(page).to have_content 'creamy delicious'
  end
end