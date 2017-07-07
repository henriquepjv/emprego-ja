require 'rails_helper'

feature 'Visitor view premium companies' do
  scenario 'successfully' do
    category = create(:category)

    company1 = create(:company)

    5.times do
      create(:job, company: company1, category: category)
    end

    visit root_path

    click_on company1.name

    expect(page).to have_css('h1', text: company1.name)
    expect(page).to have_xpath("//img[contains(@src,'estrela')]")
  end

  scenario 'not enought jobs to be premium' do
    category = create(:category)

    company1 = create(:company)

    create(:job, title: 'closure dev', company: company1, category: category)

    visit root_path

    click_on company1.name

    expect(page).to have_css('h1', text: company1.name)
    expect(page).not_to have_xpath("//img[contains(@src,'estrela')]")
  end
end

