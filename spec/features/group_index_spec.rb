require 'rails_helper'

RSpec.feature 'Groups Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @group = Group.create(user: @user, name: 'Amazon', icon: 'icon_url.png')
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'the user is logged in' do
    visit root_path
    expect(page).to have_current_path(groups_path)
  end

  it 'show the button of adding a group' do
    expect(page).to have_content 'Add a new category'
  end

  it 'shows the name of groups' do
    expect(page).to have_content @group.name
  end

  it 'show the total ammount of the group' do
    expect(page).to have_content '$0'
  end

  it 'Navigate to the transactions page of the group' do
    find_link("group_#{@group.id}").click
    expect(page).to have_current_path(activities_home_path(@group))
  end
end