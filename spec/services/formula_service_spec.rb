# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FormulaService, :type => :model do
   
   describe '.eval' do
     
     before do
       @debt = create :debt
       @debt_withdraw = create :debt_withdraw, :debt => @debt
       create :debt_amortization, :debt => @debt
     end

     it 'evaluates a simple formula correctly' do
       expect(FormulaService::eval('1 + 3', @debt)).to eq 4
     end

     it 'evaluates a variable' do
       expect(FormulaService::eval('[JUROS]', @debt)).to eq @debt.interest_rate
     end

     it 'evaluates a formula containing the same variable 2 times' do
       expect(FormulaService::eval('[JUROS] + [JUROS]', @debt)).to eq @debt.interest_rate * 2
     end

     it 'evaluates a formula containing different variables' do
       expect(FormulaService::eval('[JUROS] * [PARCELAS]', @debt)).to eq @debt.interest_rate * @debt.loan_term 
     end

     it 'evaluates a formula containing constants and variables' do
       expect(FormulaService::eval('(5 + [JUROS] / 2) * [PARCELAS] + 1', @debt)).to eq (5 + @debt.interest_rate / 2) * @debt.loan_term + 1
     end

     it 'evaluates a formula containing a summation function' do
       expect(FormulaService::eval('[SOMA(DiNi)]', @debt)).to eq (0)
     end

     context 'when there is a withdraw' do
       before do
         travel_to Date.new(2016, 1, 15)
         create :withdraw_20151215, :transaction_info => @debt_withdraw
       end

       it 'evaluates a formula containing a summation function' do 				
         expect(FormulaService::eval('[SOMA(DiNi)]', @debt)).to eq (BigDecimal('600000'))
       end	 		
     end

     context 'when there is many withdraws' do
       before do
         travel_to Date.new(2016, 1, 15)
         create :withdraw_20151215, :transaction_info => @debt_withdraw
         create :withdraw_20151221, :transaction_info => @debt_withdraw
       end

       it 'evaluates a formula containing a summation function' do 				
         expect(FormulaService::eval('[SOMA(DiNi)]', @debt)).to eq (BigDecimal('850000'))
       end

       it 'evaluates a formula containing a summation function plus constants' do 				
         expect(FormulaService::eval('30 * [SALDO] * [JUROS] - [JUROS] * [SOMA(DiNi)]', @debt)).to eq (BigDecimal('25000'))
       end
     end
   end

end