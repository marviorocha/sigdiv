# frozen_string_literal: true

require 'rails_helper'

describe TransactionSet, :type => :model do

  before do    
    create_list(:transaction_2019, 12)
    create(:transaction_2019, :date => Date.new(2019,12,31))
    create(:transaction_2018)
    FactoryBot.rewind_sequences
  end
  
  describe '.by_year' do  	
     it 'has the correct year keys' do
      expect(Transaction.by_year.keys).to eq([2019, 2018]) 
    end

    it 'has the correct month keys' do
      expect(Transaction.by_year[2019].keys).to eq((1..12).to_a)
    end

    it 'has the correct number of elements' do
      expect(Transaction.by_year[2019][12].count).to eq(2)
    end
  end

end