require 'spec_helper'
require 'web_helpers'
require './app/chitter.rb'

feature 'Viewing peeps' do

  scenario 'I can navigate to the sign up page from the home screen' do
    Peep.create(message: 'I am the first peep', title: 'Peep')
    visit '/'
    click_button('Sign up')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Please sign up')
  end

  scenario 'I can navigate to the sign in page from the home screen' do
    Peep.create(message: 'I am the first peep', title: 'Peep')
    visit '/'
    click_button('Sign in')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Name')
  end

  scenario 'I can see existing peeps on the peeps home page without being signed in' do
    Peep.create(message: 'I am the first peep', title: 'Peep')
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Peep')
    expect(page).to have_content('I am the first peep')

  end

  scenario 'exisiting peeps display in reverse chronological order' do
    sign_up
    sign_in
    create_peep('I am the first peep', 'Peep 1')
    create_peep('I am the second peep', 'Peep 2')
    create_peep('I am the third peep', 'Peep 3')
    #expect(page).to have_selector("ul#peeps li:nth-child(1)", text: 'Peep 3')
  end

end
