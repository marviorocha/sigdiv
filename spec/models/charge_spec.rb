# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot'
RSpec.describe Charge, :type => :model do
   describe '#value' do
     before do
       @debt = create(:cef) 
      create(:withdraw_0515, :debt => @debt)
      create(:withdraw_0615, :debt => @debt)
      create(:withdraw_0715, :debt => @debt)
      create(:withdraw_0815, :debt => @debt)
      create(:withdraw_0915, :debt => @debt)
      create(:withdraw_1015, :debt => @debt)
      create(:withdraw_1115, :debt => @debt)
      create(:withdraw_1215, :debt => @debt)
      create(:withdraw_0316, :debt => @debt)
      create(:withdraw_0516, :debt => @debt)
      create(:withdraw_0616, :debt => @debt)
      create(:withdraw_0716, :debt => @debt)
      create(:withdraw_0816, :debt => @debt)
      create(:withdraw_0916, :debt => @debt)
      create(:withdraw_1016, :debt => @debt)
      create(:withdraw_1116, :debt => @debt)
      create(:withdraw_1216, :debt => @debt)
      create(:withdraw_0117, :debt => @debt)
      create(:withdraw_0217, :debt => @debt)
      create(:withdraw_0317, :debt => @debt)
      create(:withdraw_0617, :debt => @debt)
      create(:withdraw_0917, :debt => @debt)
      create(:withdraw_1117, :debt => @debt)        
      create(:payment_1217, :debt => @debt)
      create(:payment_0118, :debt => @debt)
      create(:withdraw_0218, :debt => @debt)    
      create(:payment_0218, :debt => @debt)
      create(:payment_0318, :debt => @debt)
      create(:payment_0418, :debt => @debt)
      create(:payment_0518, :debt => @debt)
      create(:payment_0618, :debt => @debt)
      create(:payment_0718, :debt => @debt)
      create(:payment_0818, :debt => @debt)
      create(:payment_0918, :debt => @debt)
      create(:payment_1018, :debt => @debt)
      create(:withdraw_1018, :debt => @debt)	    
     end

     context 'if #count_days is true' do
      #  let(:charge) { create(:adm_tax, :debt => @debt, :count_days => true) }

      #  it 'value is correct' do
      #    travel_to(Date.new(2018, 11, 15))
      #   expect(charge.value.round(5)).to eq(Decimal.new(21621.22921))
      # end
     end

     context 'if count_days is false' do
      #  before do
      #    create(:payment_1118, :debt => @debt)
      #    create(:payment_1218, :debt => @debt)
      #    @charge = create(:credit_risk, :debt => @debt)
      #  end

      # it 'value is correct' do
      #   expect(@charge.value.round(5)).to eq(Decimal.new(7596.57922))
      # end
    end
   end
end