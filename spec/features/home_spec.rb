require 'rails_helper'

describe 'Home', type: :feature do
  scenario "j'accède à la page home" do
    tutorial = create :tutorial, title: "Titre tutoriel"
    visit root_path
    expect(page).to have_content "Titre tutoriel"
  end
end