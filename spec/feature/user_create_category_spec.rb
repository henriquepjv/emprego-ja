require 'rails_helper'

feature 'User' do
  scenario 'Create Category' do
    #setup
    category = Category.new(name: 'TI')

    #activity
    visit new_category_path

    fill_in 'Nome',   with: category.name

    click_on 'Criar Categoria'

    #expectativa

    expect(page).to have_css('h1', text: category.name)
  end

  scenario 'validates text field' do
    #setup
    category = Category.new(name: 'TI')

    #activity
    visit new_category_path

    click_on 'Criar Categoria'

    #expect
    expect(page).to have_content('Preencha com uma categoria!')
  end
end
