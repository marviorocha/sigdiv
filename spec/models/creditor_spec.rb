# frozen_string_literal: true

require 'rails_helper'

describe Creditor, :type => :model do

  before do
    create(:creditor)
    create(:financial_agent)
  end
  
  describe '.financial_agents' do 
    
     it 'has just one bank' do
      expect(Creditor.financial_agents.count).to eq(1) 
    end
  end

end