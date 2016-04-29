require 'rails_helper'

describe 'Home', type: :feature do
  scenario "j'accède à la page home" do
    visit root_path
    expect(page).to have_http_status(200)
  end
end