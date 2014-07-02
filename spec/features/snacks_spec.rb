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

  scenario 'User can edit and update snacks in list' do
    visit '/'
    click_on 'Add snack'
    fill_in 'Name', with: 'ice cream'
    fill_in 'Quality', with: 'creamy delicious'
    click_on 'Create snack'
    expect(page).to have_content 'ice cream'
    expect(page).to have_content 'creamy delicious'
    click_on 'ice cream'
    expect(page).to have_content 'ice cream'
    expect(page).to have_content 'creamy delicious'
    click_on 'Edit'
    fill_in 'Name', with: 'popsicles'
    fill_in 'Quality', with: 'fruity delicious'
    click_on 'Update'
    expect(page).to have_no_content 'ice cream'
    expect(page).to have_no_content 'creamy delicious'
    expect(page).to have_content 'popsicles'
    expect(page).to have_content 'fruity delicious'
  end

  scenario 'User can delete snacks from a list' do
    visit '/'
    click_on 'Add snack'
    fill_in 'Name', with: 'ice cream'
    fill_in 'Quality', with: 'creamy delicious'
    click_on 'Create snack'
    expect(page).to have_content 'ice cream'
    expect(page).to have_content 'creamy delicious'
    click_on 'ice cream'
    expect(page).to have_content 'ice cream'
    expect(page).to have_content 'creamy delicious'
    click_on 'Delete'
    expect(page).to have_no_content 'ice cream'
    expect(page).to have_no_content 'creamy delicious'
  end
end