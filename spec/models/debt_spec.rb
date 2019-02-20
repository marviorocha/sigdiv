require 'rails_helper'

describe Debt, type: :model do
  before(:each) do  	
  	@debt = create(:cef, charges: [ build(:adm_tax), build(:credit_risk) ])
  	@debt.transactions << Withdraw.new(value: 12908113.30625, date: 3.months.ago, exchange_rate: 1)
  	@debts = create_list(:debt, 30)
	end

  it 'is valid' do
  	expect(@debt.valid?).to be true
  end

  describe '#reference_period' do
    context 'when payment day is 1' do
      before do
        @debt = create(:debt, payment_day: 1)
      end

      it 'period is one month' do
        expect(@debt.send(:reference_period).count).to be_between(30,31)
      end
    end

    context 'when payment day is 30' do
      before do
        @debt = create(:debt, payment_day: 28)
      end

      it 'period is one month' do
        expect(@debt.send(:reference_period).count).to be_between(30,31)
      end
    end
  end

  describe '#next_instalment' do
  	it 'next instalment is correct' do  		
  		expect(@debt.next_instalment.round 5).to eq(92477.73279)
  	end
  end

  describe '#amortization' do
  	it 'amortization value is correct' do
  		expect(@debt.amortization.round 5).to eq( 27937.16626)
  	end
  end

  describe '#interest' do
  	it 'interest value is correct' do
			expect(@debt.interest.round 5).to eq(64540.56653)
  	end    
  end

  context 'when there is a withdraw' do
    before(:each) do
      @debt = create(:cef)
      @debt.transactions << Withdraw.new(value: 12905242.14372, date: 3.month.ago, exchange_rate: 1)
      @debt.transactions << Withdraw.new(value: 208970.05587, date: Date.new(Date.today.year, Date.today.month, @debt.payment_day) - 15.days, exchange_rate: 1)
      @debt.transactions << Payment.new(value: 30023.97424, date: Date.yesterday, exchange_rate: 1)
    end
    
    describe '#interest' do
      it 'interest value is correct' do
        expect(@debt.interest.round 5).to eq(64863.68764)
      end
    end
    
    describe '#outstanding_balance' do 
      it 'Returns the correct value' do
        expect(@debt.send(:outstanding_balance)).to be_within(0.00001).of(13084188.22535)
      end
    end
  end 

  describe '#charges_total' do
  	it 'charges sum is correct'
  end

  describe '#status' do
  	context 'when debt is in grace period' do
  		before do 
  			@debt_in_grace_period = create(:debt, grace_period: Date.tomorrow)
  		end
  		it 'is not in amortization period' do
  			expect(@debt_in_grace_period.in_amortization_period?).to be false
  		end
  		it 'is not finished' do
  			expect(@debt_in_grace_period.finished?).to be false
  		end
  		it 'status returns grace period' do
  			expect(@debt_in_grace_period.status).to eq('Carência')
  		end
  	end

  	context 'when debt is in amortization period' do
  		it 'is not in grace period' do
  			expect(@debt.in_grace_period?).to be false
  		end
  		it 'is not finished' do
  			expect(@debt.finished?).to be false
  		end
  		it 'status returns amortization period' do
  			expect(@debt.status).to eq('Amortização')
  		end
  	end

  	context 'when debt is finished' do
  		# it 'is not in grace period' do
  		# 	expect(@debt.in_grace_period?).to be false
  		# end
  		# it 'is not is amortization period' do
  		# 	expect(@debt_in_grace_period.in_amortization_period?).to be false
  		# end
  		# it 'status returns finished' do
  		# 	expect(@debt.status).to eq('Finalizado')
  		# end
  	end
  end

  # self.search code_query, name_query, creditor_query, signature_year_query, status_query
  context 'when searching' do
  	context 'for a existing code' do
  		it 'returns the correct amount' do  			
  			expect(Debt.search(@debt.code.to_s).count).to eq(1)
  		end
  		it 'returns the correct record' do  			
  			expect(Debt.search(@debt.code.to_s).first.name).to eq('Transoceânica') 
  		end
  	end
  	context 'for a non existing code' do
  		it 'returns nothing' do
  			expect(Debt.search('-1').count).to eq(0)
  		end
  	end
  	context 'for a part of a name present in many debts' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, 'bank').count).to be >(0)
  		end
  	end

		context 'for a part of a name not present in any debt' do
  		it 'returns nothing' do
  			expect(Debt.search(nil, 'SADP').count).to eq(0)
  		end
  	end
  	context 'for debts in a specific year' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, nil, 2012).count).to be >(0)
  		end
  	end
  	context 'a year that has no debts' do
  		it 'returns nothing' do
  			expect(Debt.search(nil, nil, nil, 2000).count).to eq(0)
  		end
  	end
  	context 'for debts with a specific creditor' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, Creditor.first.id).count).to be >(0)
  		end
  	end
  	context 'a creditor that has no debts' do
  		it 'returns nothing' do
  			expect(Debt.search(nil, nil, create(:creditor, name: 'Itaú')).count).to eq(0)
  		end
  	end
  	context 'for debts in grace period' do
  		before do
  			create(:debt, grace_period: Date.tomorrow)
  		end
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, nil, nil, 'Carência').count).to be >(0)
  		end
		end
		context 'for debts in amortization period' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, nil, nil, 'Amortização').count).to be >(0)
  		end
		end
		context 'for finished debts' do
  		it 'returns the correct amount'
		end
  end
end
