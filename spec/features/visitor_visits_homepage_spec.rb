require 'rails_helper'

feature 'visitor visits homepage' do
  scenario 'and sees a list of properties' do

    property = Property.create( title: 'Casa de areia',
                                property_location: 'Santos - SP',
                                property_type: 'Casa na praia',
                                rooms: 2,
                                daily_rate: 100,
                                photo: '/areia.jpg')
    visit root_path

    expect(page).to have_css('h1', text: 'Aluguel de temporadas')

    expect(page).to have_css('h2', text: 'Casa de areia')
    expect(page).to have_css('div', text: '/areia.jpg')
    expect(page).to have_css('dt', text: 'Localização:')
    expect(page).to have_css('dd', text: 'Santos - SP')
    expect(page).to have_css('dt', text: 'Tipo:')
    expect(page).to have_css('dd', text: 'Casa na praia')
    expect(page).to have_css('dt', text: 'Quartos:')
    expect(page).to have_css('dd', text: '2')
    expect(page).to have_css('dt', text: 'Diária:')
    expect(page).to have_css('dd', text: 'R$ 100,00')

  end

  scenario 'and there are no properties to show' do
    visit root_path

    expect(page).to have_css('h1', text: 'Aluguel de temporadas')
    expect(page).to have_css('div.error', text: 'Ainda não existem imóveis para serem exibidos')

  end
end
