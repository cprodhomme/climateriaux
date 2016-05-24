require 'rails_helper'

describe 'Tutorial', type: :feature do
  scenario "j'accède à la page index des tutoriels" do
  	tutorial = create :tutorial
    visit tutorials_path
    expect(page).to have_content "Titre Tutoriel"
  end

  scenario "j'accède à la page d'un tutoriel" do
  	tutorial = create :tutorial, slug: "tuto"
    visit tutorial_path(slug: "tuto")
    expect(page).to have_content "Titre Tutoriel"
  end
end
