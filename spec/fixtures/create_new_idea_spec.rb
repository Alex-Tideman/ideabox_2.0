require './spec/rails_helper'

RSpec.describe "create new idea and edit existing idea", type: :feature do

  it 'view index page and create idea' do
    visit root_path

    expect(page).to have_content("List of Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")

    fill_in 'idea-title', :with => 'Great idea'
    fill_in 'idea-body', :with => 'testing'

    click_link_or_button 'Save'

    visit root_path

    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing")
    expect(page).to have_content("Swill")

  end

  it 'view index page and edit idea' do

    idea = Idea.create(title: "Great idea", body: "testing out")

    visit root_path

    expect(page).to have_content("List of Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("testing out")
    expect(page).to have_content("Swill")

    visit edit_idea_path(id: idea.id)

    expect(page).to have_content("Edit Idea")
    expect(page).to have_content("Edit Title")
    expect(page).to have_content("Edit Body")
    expect(page).to have_content("testing out")
    expect(page).not_to have_content("Swill")

    fill_in 'idea-body', :with => 'new idea, and its better.'

    click_link_or_button 'Save'

    expect(current_path).to eq root_path

    expect(page).to have_content("List of Ideas")
    expect(page).to have_content("New Idea")
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Great idea")
    expect(page).to have_content("new idea, and its better.")
    expect(page).to have_content("Swill")



  end

  end
