require 'rails_helper'

feature 'User edit companies' do
  scenario 'successfully' do
    category = create(:category)
    company1 = create(:company)
    create(:job, company: company1, category: category)

    visit root_path

    click_on company1.name

    click_on 'Editar'

    fill_in 'Nome', with: 'banana'
    fill_in 'Local', with: 'plantacao'

    click_on 'Salvar'

    expect(page).to have_content 'banana'
    expect(page).to have_content 'plantacao'
    expect(page).to have_content 'contato@campus.com.br'
  end
end
