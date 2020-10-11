# frozen_string_literal: true

require 'rails_helper'

# Collection matchers
require 'rspec/collection_matchers'

RSpec.describe TransactionInfo, :type => :model do
  before do
    @debt = create :debt  
  end

  it { is_expected.to have_many :items }
  it { is_expected.to belong_to :debt }
  it { is_expected.to belong_to :type }

  context 'when creating with a new transaction_type' do
    before do  		
      @transaction_type_attributes = { :name => 'Taxa Adm', :operator => '-' }
      @transaction_info = TransactionInfo.create :debt => @debt, :formula => '0.5', :type_attributes => @transaction_type_attributes
    end

    it 'creates the new type' do
      expect(TransactionType.last).to have_attributes(@transaction_type_attributes)
    end
  end

  context 'when creating with no transaction_type' do
    before do  				
      @transaction_info = TransactionInfo.create :debt => @debt, :formula => '0.5', :type => TransactionType.new
    end

    it 'fails validation' do
      expect(@transaction_info).to have(1).error_on('type.name')
      expect(@transaction_info).to have(1).error_on('type.operator')
    end
  end

  context 'when creating with a persisted transaction_type' do
    before do
      @transaction_type = TransactionType.create :name => TransactionType::BASIC_TYPES[1], :operator => '+'
      @transaction_info = TransactionInfo.create :type => @transaction_type, :type_attributes => { :operator => '-', :id => @transaction_type.id }
    end

    it 'does not update type attributes' do
      expect(@transaction_type.reload.operator).to eq('+')
    end
  end
end