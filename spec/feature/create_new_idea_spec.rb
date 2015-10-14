require './spec/rails_helper'

RSpec.describe "create new idea and edit existing idea", type: :feature do

  xit 'view index page and create idea' do
    visit root_path

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")

    fill_in 'new-idea-title', :with => 'Great idea'
    fill_in 'new-idea-body', :with => 'testing'

    click_link_or_button 'Save'

    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing")
    expect(page).to have_content("Swill")

  end

  xit 'view index page and edit idea' do

    idea = Idea.create(title: "Great idea", body: "testing out")

    visit root_path

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing out")
    expect(page).to have_content("Swill")

    fill_in 'best_in_place_idea_1_body', :with => 'new idea, and its better.'

    click_link 'IdeaBox 2.0'

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("new idea, and its better.")
    expect(page).to have_content("Swill")


  end

  xit 'view index page and vote up idea' do

    idea = Idea.create(title: "Great idea", body: "testing out")

    visit root_path

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing out")
    expect(page).to have_content("Swill")

    click_button 'thumb_up'

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("new idea, and its better.")
    expect(page).to have_content("Plausible")

  end

  xit 'view index page and vote down idea' do

    idea = Idea.create(title: "Great idea", body: "testing out", quality: 3 )

    visit root_path

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing out")
    expect(page).to have_content("Genius")

    click_button 'thumb_down'

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("new idea, and its better.")
    expect(page).to have_content("Plausible")

  end

  xit 'view index page and delete idea' do

    idea = Idea.create(title: "Great idea", body: "testing out")

    visit root_path

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing out")
    expect(page).to have_content("Swill")

    click_button 'delete'

    expect(page).to have_content("Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).not_to have_content("Great idea")
    expect(page).not_to have_content("new idea, and its better.")
    expect(page).not_to have_content("Plausible")

  end


end
