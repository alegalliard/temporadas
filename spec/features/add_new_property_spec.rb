require 'rails_helper'

feature 'visitor adds a new property' do
  scenario 'succefully' do
    visit root_path

    click_on 'Anunciar um imóvel'

    fill_in 'Título', with: 'Casa na praia'
    fill_in 'Localização', with: 'Santos - SP'
    fill_in 'Tamanho (m²)', with: '200 m²'
    fill_in 'Tipo do Imóvel', with: 'Casa na praia'
    fill_in 'Quantidade de quartos', with: '4'
    fill_in 'Máximo de pessoas', with: '20'
    fill_in 'Mínimo de dias para locação', with: '2'
    fill_in 'Máximo de dias para locação', with: '15'
    fill_in 'Valor padrão da diária', with: '150'
    attach_file 'Foto', "#{Rails.root}/spec/image/casa-praia.jpg"
    fill_in 'Descrição', with: 'Essa é uma casa muito engraçada'
    fill_in 'Regras de uso', with: 'Pode trazer até dois cachorros'

    click_on 'Cadastrar'

    expect(page).to have_css('h1', text: 'Casa na praia')
    expect(page).to have_xpath("//img[contains(@src,'casa-praia.jpg')]")

    expect(page).to have_css('dt', text: 'Localização:')
    expect(page).to have_css('dd', text: 'Santos - SP')

    expect(page).to have_css('dt', text: 'Tamanho (m²)')
    expect(page).to have_css('dd', text: '200 m²')

    expect(page).to have_css('dt', text: 'Tipo do Imóvel')
    expect(page).to have_css('dd', text: 'Casa na praia')

    expect(page).to have_css('dt', text: 'Quantidade de quartos')
    expect(page).to have_css('dd', text: '4')

    expect(page).to have_css('dt', text: 'Máximo de pessoas')
    expect(page).to have_css('dd', text: '20')

    expect(page).to have_css('dt', text: 'Mínimo de dias para locação')
    expect(page).to have_css('dd', text: '2')

    expect(page).to have_css('dt', text: 'Máximo de dias para locação')
    expect(page).to have_css('dd', text: '15')

    expect(page).to have_css('dt', text: 'Valor padrão da diária')
    expect(page).to have_css('dd', text: 'R$ 150,00')

    expect(page).to have_css('dt', text: 'Descrição')
    expect(page).to have_css('dd', text: 'Essa é uma casa muito engraçada')

    expect(page).to have_css('dt', text: 'Regras de uso')
    expect(page).to have_css('dd', text: 'Pode trazer até dois cachorros')

    expect(page).to have_css('div.success', text:'Imóvel cadastrado com sucesso!')

    click_on 'Voltar'

  end

  scenario 'and validates fields' do
    visit root_path

    click_on 'Anunciar um imóvel'

    fill_in 'Título', with: ''
    fill_in 'Localização', with: ''
    fill_in 'Tamanho (m²)', with: ''
    fill_in 'Tipo do Imóvel', with: ''
    fill_in 'Quantidade de quartos', with: ''
    fill_in 'Máximo de pessoas', with: ''
    fill_in 'Mínimo de dias para locação', with: ''
    fill_in 'Máximo de dias para locação', with: ''
    fill_in 'Valor padrão da diária', with: ''
    #fill_in 'Foto', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Regras de uso', with: ''

    click_on 'Cadastrar'

    expect(page).to have_css('li.error', text: 'Preencha todos os campos corretamente')
  end
end
