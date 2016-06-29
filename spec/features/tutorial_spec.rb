require 'rails_helper'

describe 'tutorial', type: :feature do
  scenario "j'accède à la page index des tutoriels" do
  	tutorial = create :tutorial, title: "Titre tutoriel"
    visit tutorials_path
    expect(page).to have_http_status(200)
  end

  scenario "j'accède à la page d'un tutoriel" do
  	tutorial = create :tutorial, title: "Titre tutoriel", slug: "tuto"
    visit tutorial_path(slug: "tuto")
    expect(page).to have_content "Titre tutoriel"
  end
end
