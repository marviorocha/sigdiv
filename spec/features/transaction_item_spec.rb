# frozen_string_literal: true

require 'rails_helper'

# RSpec.feature 'TransactionItemSpec.rbs', :type => :feature do
# include ActionView::Helpers::NumberHelper
# include ApplicationHelper

#   before(:each) do  
#       @debt = create(:debt, :transaction_infos => [create(:debt_withdraw), create(:debt_amortization)])
#       @debts = create_list(:debt, 30)
#       @transaction_item = create(:withdraw_20151221, :debt => @debt)
#   end

#   scenario 'Visit index page' do
#        visit(debts_path)
#        expect(page).to have_current_path(debts_path)
#   end

#   scenario 'Create the withdraw', :js => true do
#       visit(debts_path)
#       click_link("mostra-#{@debt.id}")
#       click_on('Movimentações')
#       expect(page).to have_content('Registrar desembolso')
#       click_on('Registrar desembolso')
#       fill_in('Valor (BRL) *', :with => '12.435.287,93')
#       fill_in('Taxa de conversão', :with => '21.52960135')
#       expect(find_field('Valor *').value).to eq('577.590,25482')
#       click_on('Salvar')
#   end

#   scenario 'Edit the withdraw', :js => true do
#       visit(debts_path)
#       click_link("mostra-#{@debt.id}")
#       click_on('Movimentações')
#       expect(page).to have_content('Registrar desembolso')
#       date_withdraw = '21-12-2015'
#       expect(find('.edit-transaction')).to have_content(date_withdraw)
#       page.find('.edit-transaction',:text => date_withdraw).click
#       expect(page).to have_content('Editar desembolso')
#       fill_in('Valor (BRL) *', :with => '6.417.561,70')
#       fill_in('Taxa de conversão', :with => '21.74035338')
#       expect(find_field('Valor *').value).to eq('295.191,23208')
#       click_on('Salvar')
#   end

#   scenario 'Blank data validation', :js => true do
#       visit(debts_path)
#       click_link("mostra-#{@debt.id}")
#       click_on('Movimentações')
#       expect(page).to have_content('Registrar desembolso')
#       click_on('Registrar desembolso')
#       click_on('Salvar')

#       expect(page).to have_content('Taxa de conversão não pode ficar em branco')
#       expect(page).to have_content('Valor não pode ficar em branco')
#   end
  

# end
