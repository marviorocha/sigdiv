# frozen_string_literal: true

require 'rails_helper'

describe FutureTransaction, :type => :model do
  before(:each) do
    @debt = create(:debt, :transaction_infos => [build(:debt_withdraw), build(:debt_amortization)])  	
  end

  describe '.list' do
    it 'has the correct number of amortization instalments' do
      expect(FutureTransaction.list(@debt).count).to eq 28
    end
  end
end