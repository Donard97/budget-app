require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  background do
    visit root_path
    click_link 'Sign up'
    fill_in 'Name', with: 'Test'
    fill_in 'Email', with: 'donard@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign up'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'show empty transaction alert message' do
    expect(page).to have_content('There is no category added!!!')
  end

  scenario 'add new category' do
    click_link 'Add a new category'
    fill_in 'Name', with: 'Test'
    fill_in 'Icon', with: 'https://i.pinimg.com/736x/aa/f7/05/aaf705e06726ce3881288ae4be3ac5fe.jpg'
    click_button 'Save'
    expect(page).to have_content('Test')
    expect(page).to have_button('Delete')
  end

  scenario 'go to created category' do
    click_link 'Add a new category'
    fill_in 'Name', with: 'Test'
    fill_in 'Icon', with: 'https://i.pinimg.com/736x/aa/f7/05/aaf705e06726ce3881288ae4be3ac5fe.jpg'
    click_button 'Save'
    click_link 'Test'
    expect(page).to have_content('Total Amount:')
  end

  scenario 'add new transaction' do
    click_link 'Add a new category'
    fill_in 'Name', with: 'Test'
    fill_in 'Icon', with: 'https://i.pinimg.com/736x/aa/f7/05/aaf705e06726ce3881288ae4be3ac5fe.jpg'
    click_button 'Save'
    click_link 'Test'
    click_link 'Add a new transaction'
    fill_in 'Name', with: 'Test'
    fill_in 'Amount', with: '100'
    select 'Test'
    click_button 'Save'
    expect(page).to have_content('Test')
  end
end
