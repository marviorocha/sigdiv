# frozen_string_literal: true

Creditor.destroy_all
Currency.destroy_all
TransactionInfo.destroy_all
TransactionItem.destroy_all
Debt.destroy_all

creditor1 = Creditor.create!(:name => 'CAIXA ECONÔMICA FEDERAL', :financial_agent => true)
creditor2 = Creditor.create!(:name => 'Corporação Andina de Fomento - CAF', :financial_agent => false)
creditor3 = Creditor.create!(:name => 'BNDES', :financial_agent => true)
creditor4 = Creditor.create!(:name => 'BANCO DO BRASIL', :financial_agent => true)
creditor5 = Creditor.create!(:name => 'BID', :financial_agent => false)

currency1 = Currency.create!(:name => 'BRL', :formula => '1')
currency2 = Currency.create!(:name => 'USD', :formula => '[BACEN1]')
currency3 = Currency.create!(:name => 'URTJLP', :formula => '[BNDES314]')

cef = Debt.create!( "code" => 123456,
              "contract_value" => 292320000,
              "signature_date" => Date.parse('19/11/2013'),
              "creditor_id" => creditor1.id,
              "grace_period" => Date.parse('19/11/2017'),
              "amortization_period" => Date.parse('19/11/2033'),
              "purpose" => "Programa destinado à Implantação do Corredor BRT TransOcênica - Charitas/Centro",
              "amortization_type" => 1,
              "name" => "Caixa Transoceânica",
              "category" => 0,
              "currency_id" => currency1.id,
              "interest_rate" => 0.005,
              "loan_term" => 240,
              "decimal_places" => 5,
              :start_amt_next_month_to_grace_period => true
              )

caf = Debt.create!( :code => 123789, 
              :contract_value => 0.1e9, 
              :signature_date => "2016-11-30", 
              :creditor_id => creditor2.id, 
              :grace_period => "2021-05-30", 
              :amortization_period => "2028-11-30", 
              :purpose => "Programa região oceânica sustentável",							
              :amortization_type => 0,
              :financial_agent_id => creditor1.id,
              :applicable_legislation => "",
              :legislation_level => nil,
              :name => "CAF", 
              :notes => "", 
              :category => 1, 
              :currency_id => currency2.id, 
              :loan_term => 16, 
              :interest_rate => 1.95,
              "decimal_places" => 2,
              :start_amt_next_month_to_grace_period => false)

bid = Debt.create!( :code => 123799, 
              :contract_value => 26470000, 
              :signature_date => "2016-11-30", 
              :creditor_id => creditor5.id, 
              :grace_period => "2019-04-15", 
              :amortization_period => "2038-10-15", 
              :purpose => "ProCidades - Programa de Desenvolvimento Urbano e Inclusão Social de Niterói",							
              :amortization_type => 0,
              :financial_agent_id => creditor4.id,
              :applicable_legislation => "",
              :legislation_level => nil,
              :name => "BID", 
              :notes => "", 
              :category => 1, 
              :currency_id => currency2.id, 
              :loan_term => 40, 
              :interest_rate => 2.75,
              "decimal_places" => 2,
              :start_amt_next_month_to_grace_period => false)

bnds_sub_a = Debt.create!( :code => 212345, 
              :contract_value => 6242000, 
              :signature_date => "2014-12-22", 
              :creditor_id => creditor3.id, 
              :grace_period => "2017-02-15", 
              :amortization_period => "2023-11-15",
              :purpose => "Programa de Modernização da Administração Tributária e da Gestão dos Setores Sociais Básicos - PMAT",							
              :amortization_type => 0,
              :financial_agent_id => creditor3.id,
              :applicable_legislation => "",
              :legislation_level => nil,
              :name => "PMAT  - BNDES - SubC. A",
              :notes => "", 
              :category => 0,
              :currency_id => currency1.id, 
              :loan_term => 72, 
              :interest_rate => 2.20,
              "decimal_places" => 4,
              :start_amt_next_month_to_grace_period => false)

bnds_sub_b = Debt.create!( :code => 212346, 
              :contract_value => 21847000, 
              :signature_date => "2014-12-22", 
              :creditor_id => creditor3.id, 
              :grace_period => "2017-02-15", 
              :amortization_period => "2023-11-15",
              :purpose => "Programa de Modernização da Administração Tributária e da Gestão dos Setores Sociais Básicos - PMAT",							
              :amortization_type => 0,
              :financial_agent_id => creditor3.id,
              :applicable_legislation => "",
              :legislation_level => nil,
              :name => "PMAT  - BNDES - SubC. B",
              :notes => "", 
              :category => 0,
              :currency_id => currency1.id, 
              :loan_term => 72, 
              :interest_rate => 2.20,
              "decimal_places" => 6,
              :start_amt_next_month_to_grace_period => false)

#Charge.create!(name: 'Taxa administrativa', base: 2, debt: cef, count_days: true)
#Charge.create!(name: 'Taxa de risco de crédito', base: 0.7, debt: cef, count_days: false)

withdraw = TransactionInfo.create!(:category_number => 1, :debt => cef, :payment_day => '15', :formula => "", :slug => 'D')
amortization = TransactionInfo.create!(:category_number => 2, :debt => cef, :payment_day => '15', :formula => "[PGTO] - [SALDO] * [JUROS]", :slug => 'A', :frequency => 1)
interest = TransactionInfo.create!(:category_number => 3, :debt => cef, :payment_day => '15', :formula => "[SALDO] * [JUROS]", :slug => 'J', :frequency => 1)
charges_adm = TransactionInfo.create!(:category_number => 4, :debt => cef, :payment_day => '15', :base => 2, :description => 'Taxa Adm', :formula => "[SALDO] * (0.02 / 12)", :slug => 'TA', :frequency => 1)
charges_risc = TransactionInfo.create!(:category_number => 4, :debt => cef, :payment_day => '15', :base => 0.7, :description => 'Taxa Risco', :formula => "[SALDO] * (0.007 / 12)", :slug => 'TR', :frequency => 1)
ec = TransactionInfo.create!(:category_number => 5, :debt => cef, :slug => 'EE')

withdraw_caf = TransactionInfo.create!(:category_number => 1, :debt => caf, :payment_day => '30', :formula => "", :slug => 'D')
amortization_caf = TransactionInfo.create!(:category_number => 2, :debt => caf, :payment_day => '30', :formula => "[SALDO] / ([PARCELAS] - [N_PARCELA])", :slug => 'A', :frequency => 6)
interest_caf = TransactionInfo.create!(:category_number => 3, :debt => caf, :payment_day => '30', :formula => "[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])", :slug => 'J', :frequency => 6)
charges_cc_caf = TransactionInfo.create!(:category_number => 4, :debt => caf, :payment_day => '30', :base => 0.35, :description => 'Comissão de crédito', :formula => "([VALOR_CONTRATO] - [SALDO]) * ((0.35 / 100 / 360) * [DELTA_DATA])", :slug => 'CC', :frequency => 6, :bind_withdraw => true)
ec_caf = TransactionInfo.create!(:category_number => 5, :debt => caf, :slug => 'EE')

withdraw_bid = TransactionInfo.create!(:category_number => 1, :debt => bid, :payment_day => '15', :formula => "", :slug => 'D')
amortization_bid = TransactionInfo.create!(:category_number => 2, :debt => bid, :payment_day => '15', :formula => "[SALDO] / ([PARCELAS] - [N_PARCELA])", :slug => 'A', :frequency => 6)
interest_bid = TransactionInfo.create!(:category_number => 3, :debt => bid, :payment_day => '15', :formula => "[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])", :slug => 'J', :frequency => 6)
charges_bid = TransactionInfo.create!(:category_number => 4, :debt => bid, :payment_day => '15', :base => 0.35, :description => 'Comissão de crédito', :formula => "([VALOR_CONTRATO] - [SALDO]) * ((0.35 / 100 / 360) * [DELTA_DATA])", :slug => 'CC', :frequency => 6, :bind_withdraw => true)
# ec_bid = TransactionInfo.create!(category_number: 5, debt: cef_bid, slug: 'EE')

withdraw_bnds_sub_a = TransactionInfo.create!(:category_number => 1, :debt => bnds_sub_a, :payment_day => '15', :formula => "", :slug => 'D')
amortization_bnds_sub_a = TransactionInfo.create!(:category_number => 2, :debt => bnds_sub_a, :payment_day => '15', :formula => "[SALDO] / ([PARCELAS] - [N_PARCELA])", :slug => 'A', :frequency => 1)
interest_bnds_sub_a = TransactionInfo.create!(:category_number => 3, :debt => bnds_sub_a, :payment_day => '15', :formula => "[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])", :slug => 'J', :frequency => 1)
ec_bnds_sub_a = TransactionInfo.create!(:category_number => 5, :debt => bnds_sub_a, :slug => 'EE')

withdraw_bnds_sub_b = TransactionInfo.create!(:category_number => 1, :debt => bnds_sub_b, :payment_day => '15', :formula => "", :slug => 'D')
amortization_bnds_sub_b = TransactionInfo.create!(:category_number => 2, :debt => bnds_sub_b, :payment_day => '15', :formula => "[SALDO] / ([PARCELAS] - [N_PARCELA])", :slug => 'A', :frequency => 1)
interest_bnds_sub_b = TransactionInfo.create!(:category_number => 3, :debt => bnds_sub_b, :payment_day => '15', :formula => "[SALDO] * ((1.95 / 100 / 360) * [DELTA_DATA])", :slug => 'J', :frequency => 1)
ec_bnds_sub_b = TransactionInfo.create!(:category_number => 5, :debt => bnds_sub_b, :slug => 'EE')

puts Date.new(2015, 5, 8)

TransactionItem.create!(				
  :value => BigDecimal('38267.1771676987'),
  :date => Date.new(2015, 5, 8),
  :value_brl => BigDecimal('800224.90'),
  :exchange_rate => BigDecimal('20.91152155'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('0'),
  :confirmed => true
) 

puts Date.new(2015, 6, 19)

TransactionItem.create!(
  :value => BigDecimal('100178.304001591'),
  :date => Date.new(2015, 6, 19),
  :value_brl => BigDecimal('2099165.37'),
  :exchange_rate => BigDecimal('20.95429136'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 7, 24)

TransactionItem.create!(
  :value => BigDecimal('269454.113840257'),
  :date => Date.new(2015, 7, 24),
  :value_brl => BigDecimal('5659740.67'),
  :exchange_rate => BigDecimal('21.00446933'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('138445.48117'),
  :confirmed => true
)

puts Date.new(2015, 8 ,21)

TransactionItem.create!(
  :value => BigDecimal('172811.612402003'),
  :date => Date.new(2015, 8 ,21),
  :value_brl => BigDecimal('3636516.20'),
  :exchange_rate => BigDecimal('21.04323980'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('407899.59501'),
  :confirmed => true
)

puts Date.new(2015, 9, 22)

TransactionItem.create!(
  :value => BigDecimal('388238.148837079'),
  :date => Date.new(2015, 9, 22),
  :value_brl => BigDecimal('8185330.12'),
  :exchange_rate => BigDecimal('21.08327104'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('580711.20741'),
  :confirmed => true
)

puts Date.new(2015, 10, 22)

TransactionItem.create!(
  :value => BigDecimal('180241.335471127'),
  :date => Date.new(2015, 10, 22),
  :value_brl => BigDecimal('3807043.73'),
  :exchange_rate => BigDecimal('21.12192367'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('968949.35625'),
  :confirmed => true
)

puts Date.new(2015, 11, 23)
  
TransactionItem.create!(
  :value => BigDecimal('776149.536786542'),
  :date => Date.new(2015, 11, 23),
  :value_brl => BigDecimal('16418436.94'),
  :exchange_rate => BigDecimal('21.15370320'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('1149190.69172'),
  :confirmed => true
)

puts Date.new(2015, 12, 17)

TransactionItem.create!(
  :value => BigDecimal('2027839.19399659'),
  :date => Date.new(2015, 12, 17),
  :value_brl => BigDecimal('42965630.86'),
    :exchange_rate => BigDecimal('21.18788856'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('1925340.22851'),
  :confirmed => true
)

puts Date.new(2016, 3, 15)

TransactionItem.create!(
  :value => BigDecimal('1480367.51522129'),
  :date => Date.new(2016, 3, 15),
  :value_brl => BigDecimal('31500447.14'),
  :exchange_rate => BigDecimal('21.27880193'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true

)

puts Date.new(2016, 5, 6) 
  
TransactionItem.create!(
  :value => BigDecimal('1986775.5527745'),
  :date => Date.new(2016, 5, 6),
  :value_brl => BigDecimal('42393733.38'),
  :exchange_rate => BigDecimal('21.33795804'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true

)

puts Date.new(2016, 6, 27)

TransactionItem.create!(
  :value => BigDecimal('383515.163323288'),
  :date => Date.new(2016, 6, 27),
  :value_brl => BigDecimal('8207278.03'),
  :exchange_rate => BigDecimal('21.40013959'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('7420322.49050'),
  :confirmed => true
)

puts Date.new(2016, 7, 29)

TransactionItem.create!(
  :value => BigDecimal('611973.657811069'),
  :date => Date.new(2016, 7, 29),
  :value_brl => BigDecimal('13121407.28'),
  :exchange_rate => BigDecimal('21.44113086'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('7803837.65382'),
  :confirmed => true
)

puts Date.new(2016, 8, 30)

TransactionItem.create!(
  :value => BigDecimal('573211.706951141'),
  :date => Date.new(2016, 8, 30),
  :value_brl => BigDecimal('12319813.16'),
  :exchange_rate => BigDecimal('21.49260563'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('8415811.31163'),
  :confirmed => true
)

puts Date.new(2016, 9, 30)

TransactionItem.create!(
  :value => BigDecimal('577590.254823738'),
  :date => Date.new(2016, 9, 30),
  :value_brl => BigDecimal('12435287.93'),
  :exchange_rate => BigDecimal('21.52960135'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('8989023.01858'),
  :confirmed => true
)

puts Date.new(2016, 10, 28)
 
TransactionItem.create!(
  :value => BigDecimal('508924.2218972'),
  :date => Date.new(2016, 10, 28),
  :value_brl => BigDecimal('10973544.54'),
  :exchange_rate => BigDecimal('21.56223671'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('9566613.27341'),
  :confirmed => true
)

puts Date.new(2016, 11, 30)

TransactionItem.create!(
  :value => BigDecimal('715325.306302176'),
  :date => Date.new(2016, 11, 30),
  :value_brl => BigDecimal('15447408.00'),
  :exchange_rate => BigDecimal('21.59494130'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('10075537.49531'),
  :confirmed => true
)

puts Date.new(2016, 12, 22)

TransactionItem.create!(
  :value => BigDecimal('550758.880241646'),
  :date => Date.new(2016, 12, 22),
  :value_brl => BigDecimal('11909445.03'),
  :exchange_rate => BigDecimal('21.62370042'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('10790862.80161'),
  :confirmed => true
)

puts Date.new(2017, 1, 31)

TransactionItem.create!(
  :value => BigDecimal('270839.770669423'),
  :date => Date.new(2017, 1, 31),
  :value_brl => BigDecimal('5869510.23'),
  :exchange_rate => BigDecimal('21.67152267'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('11341621.68185'),
  :confirmed => true
)

puts Date.new(2017, 3, 2)
  
TransactionItem.create!(
  :value => BigDecimal('286313.741213063'),
  :date => Date.new(2017, 3, 2),
  :value_brl => BigDecimal('6207267.82'),
  :exchange_rate => BigDecimal('21.67995079'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('11612461.45252'),
  :confirmed => true
)

puts Date.new(2017, 5, 2)

TransactionItem.create!(
  :value => BigDecimal('109984.5161992'),
  :date => Date.new(2017, 5, 2),
  :value_brl => BigDecimal('2388057.81'),
  :exchange_rate => BigDecimal('21.71267277'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('11898775.19373'),
  :confirmed => true
)

puts Date.new(2017, 6, 30)

TransactionItem.create!(
  :value => BigDecimal('295191.232075548'),
  :date => Date.new(2017, 6, 30),
  :value_brl => BigDecimal('6417561.70'),
  :exchange_rate => BigDecimal('21.74035338'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 9, 18)

TransactionItem.create!(
  :value => BigDecimal('351624.161135471'),
  :date => Date.new(2017, 9, 18),
  :value_brl => BigDecimal('7653284.73'),
  :exchange_rate => BigDecimal('21.76552574'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 11, 13)

TransactionItem.create!(
  :value => BigDecimal('252538.2031043'),
  :date => Date.new(2017, 11, 13),
  :value_brl => BigDecimal('5496626.76'),
  :exchange_rate => BigDecimal('21.76552574'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2018, 2, 15)

TransactionItem.create!(
  :value => BigDecimal('288019.18248541'),
  :date => Date.new(2018, 2, 15),
  :value_brl => BigDecimal('5496626.76'),
  :exchange_rate => BigDecimal('1'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('12852099.28790'),
  :confirmed => true
)

puts Date.new(2018, 10, 31)

TransactionItem.create!(
  :value => BigDecimal('208970.05587'),
  :date => Date.new(2018, 10, 31),
  :value_brl => BigDecimal('5496626.76'),
  :exchange_rate => BigDecimal('1'),
  :transaction_info => withdraw,
  :start_balance => BigDecimal('12905242.14372'),
  :confirmed => true
)

puts "Juros"
puts Date.new(2015, 05, 15)

exchange_rate = BigDecimal('20.91754670')
value = BigDecimal('191.33589')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 06, 15)

value = BigDecimal('692.22741')
exchange_rate = BigDecimal('20.94706294')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 07, 15)

value = BigDecimal('2039.49798')
exchange_rate = BigDecimal('20.98975635')

TransactionItem.create!(
  :value => BigDecimal('2039.49798'),
  :date => Date.new(2015, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('138445.48117'),
  :confirmed => true
)

puts Date.new(2015, 8, 15)

value = BigDecimal('2903.55604')
exchange_rate = BigDecimal('21.03576472')

TransactionItem.create!(
  :value => BigDecimal('2903.55604'),
  :date => Date.new(2015, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('407899.59501'),
  :confirmed => true
)

puts Date.new(2015, 9, 15)

value = BigDecimal('4844.74678')
exchange_rate = BigDecimal('21.07364441')

TransactionItem.create!(
  :value => BigDecimal('4844.74678'),
  :date => Date.new(2015, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('580711.20741'),
  :confirmed => true
)

puts Date.new(2015, 10, 15)

value = BigDecimal('5745.95346')
exchange_rate = BigDecimal('21.11293167')

TransactionItem.create!(
  :value => BigDecimal('5745.95346'),
  :date => Date.new(2015, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('968949.35625'),
  :confirmed => true
)

puts Date.new(2015, 11, 15)

value = BigDecimal('9626.70114')
exchange_rate = BigDecimal('21.14684967')

TransactionItem.create!(
  :value => BigDecimal('9626.70114'),
  :date => Date.new(2015, 11, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('1149190.69172'),
  :confirmed => true
)

puts Date.new(2015, 12, 15)

value = BigDecimal('19765.89711')
exchange_rate = BigDecimal('21.18355999')

TransactionItem.create!(
  :value => BigDecimal('19765.89711'),
  :date => Date.new(2015, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('1925340.22851'),
  :confirmed => true
)

puts Date.new(2016, 01, 15)

value = BigDecimal('19765.89711')
exchange_rate = BigDecimal('21.22213861')

TransactionItem.create!(
  :value => BigDecimal('19765.89711'),
  :date => Date.new(2016, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 02, 15)

value = BigDecimal('19765.89711')
exchange_rate = BigDecimal('21.24609655')

TransactionItem.create!(
  :value => BigDecimal('19765.89711'),
  :date => Date.new(2016, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 03, 15)

value = BigDecimal('19765.89711')
exchange_rate = BigDecimal('21.27880193')

TransactionItem.create!(
  :value => BigDecimal('19765.89711'),
  :date => Date.new(2016, 3, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 04, 15)

value = BigDecimal('27167.73469')
exchange_rate = BigDecimal('21.31783834')

TransactionItem.create!(
  :value => BigDecimal('27167.73469'),
  :date => Date.new(2016, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true
)

puts Date.new(2016, 05, 15)

value = BigDecimal('27167.73469')
exchange_rate = BigDecimal('21.34729896')

TransactionItem.create!(
  :value => BigDecimal('27167.73469'),
  :date => Date.new(2016, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true
)

puts Date.new(2016, 06, 15)

value = BigDecimal('37101.61245')
exchange_rate = BigDecimal('21.38426334')

TransactionItem.create!(
  :value => BigDecimal('37101.61245'),
  :date => Date.new(2016, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('7420322.49050'),
  :confirmed => true
)

puts Date.new(2016, 07, 15)

value = BigDecimal('39019.18827')
exchange_rate = BigDecimal('21.42460012')

TransactionItem.create!(
  :value => BigDecimal('39019.18827'),
  :date => Date.new(2016, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('7803837.65382'),
  :confirmed => true
)

puts Date.new(2016, 8, 15)

value = BigDecimal('42079.05656')
exchange_rate = BigDecimal('21.46649449')

TransactionItem.create!(
  :value => BigDecimal('42079.05656'),
  :date => Date.new(2016, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('8415811.31163'),
  :confirmed => true
)

puts Date.new(2016, 9, 15)

value = BigDecimal('44945.11509')
exchange_rate = BigDecimal('21.51186071')

TransactionItem.create!(
  :value => BigDecimal('44945.11509'),
  :date => Date.new(2016, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('8989023.01858'),
  :confirmed => true
)

puts Date.new(2016, 10, 15)

value = BigDecimal('47833.06637')
exchange_rate = BigDecimal('21.54672020')

TransactionItem.create!(
  :value => BigDecimal('47833.06637'),
  :date => Date.new(2016, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('9566613.27341'),
  :confirmed => true
)

puts Date.new(2016, 11, 15)

value = BigDecimal('50377.68748')
exchange_rate = BigDecimal('21.57953900')

TransactionItem.create!(
  :value => BigDecimal('50377.68748'),
  :date => Date.new(2016, 11, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('10075537.49531'),
  :confirmed => true
)

puts Date.new(2016, 12, 15)

value = BigDecimal('53954.31401')
exchange_rate = BigDecimal('21.61462385')

TransactionItem.create!(
  :value => BigDecimal('53954.31401'),
  :date => Date.new(2016, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('10790862.80161'),
  :confirmed => true
)

puts Date.new(2017, 01, 15)

value = BigDecimal('56708.10841')
exchange_rate = BigDecimal('21.65312533')

TransactionItem.create!(
  :value => BigDecimal('56708.10841'),
  :date => Date.new(2017, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('11341621.68185'),
  :confirmed => true
)

puts Date.new(2017, 02, 15)

value = BigDecimal('58062.30726')
exchange_rate = BigDecimal('21.67683197')

TransactionItem.create!(
  :value => BigDecimal('58062.30726'),
  :date => Date.new(2017, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('11612461.45252'),
  :confirmed => true
)

puts Date.new(2017, 03, 15)

value = BigDecimal('59493.87597')
exchange_rate = BigDecimal('21.69405315')

TransactionItem.create!(
  :value => BigDecimal('59493.87597'),
  :date => Date.new(2017, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('11898775.19373'),
  :confirmed => true
)

puts Date.new(2017, 04, 15)

value = BigDecimal('60043.79855')
exchange_rate = BigDecimal('21.71267277')

TransactionItem.create!(
  :value => BigDecimal('60043.79855'),
  :date => Date.new(2017, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 05, 15)

value = BigDecimal('60043.79855')
exchange_rate = BigDecimal('21.71945744')

TransactionItem.create!(
  :value => BigDecimal('60043.79855'),
  :date => Date.new(2017, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 06, 15)

value = BigDecimal('60043.79855')
exchange_rate = BigDecimal('21.73480661')

TransactionItem.create!(
  :value => BigDecimal('60043.79855'),
  :date => Date.new(2017, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 07, 17)

value = BigDecimal('61519.75471')
exchange_rate = BigDecimal('21.74735688')

TransactionItem.create!(
  :value => BigDecimal('61519.75471'),
  :date => Date.new(2017, 07, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 8, 15)

value = BigDecimal('61519.75471')
exchange_rate = BigDecimal('21.75926638')

TransactionItem.create!(
  :value => BigDecimal('61519.75471'),
  :date => Date.new(2017, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 9, 15)

value = BigDecimal('61519.75471')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('61519.75471'),
  :date => Date.new(2017, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 10, 16)

value = BigDecimal('63277.87552')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('63277.87552'),
  :date => Date.new(2017, 10, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2017, 11, 16)

value = BigDecimal('63277.87552')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('63277.87552'),
  :date => Date.new(2017, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2017, 12, 15)

value = BigDecimal('64540.566531229700')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64540.566531229700'),
  :date => Date.new(2017, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12908113.30625'),
  :confirmed => true
)

puts Date.new(2018, 01, 15)

value = BigDecimal('64400.88069993820')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64400.88069993820'),
  :date => Date.new(2018, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12880176.13999'),
  :confirmed => true
)

puts Date.new(2018, 02, 15)

value = BigDecimal('64740.52841028160')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64740.52841028160'),
  :date => Date.new(2018, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12852099.28790'),
  :confirmed => true
)

puts Date.new(2018, 03, 15)

value = BigDecimal('65556.34438890120')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('65556.34438890120'),
  :date => Date.new(2018, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13111268.87778'),
  :confirmed => true
)

puts Date.new(2018, 04, 15)

value = BigDecimal('65411.37518607240')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('65411.37518607240'),
  :date => Date.new(2018, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13082275.03721'),
  :confirmed => true
)

puts Date.new(2018, 05, 15)

value = BigDecimal('65265.68113722940')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('65265.68113722940'),
  :date => Date.new(2018, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13053136.22745'),
  :confirmed => true
)

puts Date.new(2018, 06, 15)

value = BigDecimal('65119.25861814230')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('65119.25861814230'),
  :date => Date.new(2018, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13023851.72363'),
  :confirmed => true
)

puts Date.new(2018, 07, 16)

value = BigDecimal('64972.10399')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64972.10399'),
  :date => Date.new(2018, 07, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12994420.79729'),
  :confirmed => true
)

puts Date.new(2018, 8, 15)

value = BigDecimal('64824.21358')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64824.21358'),
  :date => Date.new(2018, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12964842.71632'),
  :confirmed => true
)

puts Date.new(2018, 9, 17)

value = BigDecimal('64675.58372')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64675.58372'),
  :date => Date.new(2018, 9, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12935116.74495'),
  :confirmed => true
)

puts Date.new(2018, 10, 15)

value = BigDecimal('64526.21072')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64526.21072'),
  :date => Date.new(2018, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12905242.14372'),
  :confirmed => true
)

puts Date.new(2018, 11, 16)

value = BigDecimal('64863.68764')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64863.68764'),
  :date => Date.new(2018, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13084188.22536'),
  :confirmed => true
)

puts Date.new(2018, 12, 15)

value = BigDecimal('65267.62197')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('65267.62197'),
  :date => Date.new(2018, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13053524.39336'),
  :confirmed => true
)

puts Date.new(2019, 01, 15)

value = BigDecimal('65113.53621')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('65113.53621'),
  :date => Date.new(2019, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('13022707.24221'),
  :confirmed => true
)

puts Date.new(2019, 02, 15)

value = BigDecimal('64958.68003')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64958.68003'),
  :date => Date.new(2019, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12991736.00530'),
  :confirmed => true
)

puts Date.new(2019, 03, 15)

value = BigDecimal('64803.04956')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64803.04956'),
  :date => Date.new(2019, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12960609.91221'),
  :confirmed => true
)

puts Date.new(2019, 04, 15)

value = BigDecimal('64646.64094')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64646.64094'),
  :date => Date.new(2019, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12929328.18865'),
  :confirmed => true
)

puts Date.new(2019, 05, 15)

value = BigDecimal('64489.45028')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64489.45028'),
  :date => Date.new(2019, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12897890.05647'),
  :confirmed => true
)

puts Date.new(2019, 06, 15)

value = BigDecimal('64331.47367')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64331.47367'),
  :date => Date.new(2019, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12866294.73363'),
  :confirmed => true
)

puts Date.new(2019, 07, 15)

value = BigDecimal('64172.70717')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('64172.70717'),
  :date => Date.new(2019, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest,
  :start_balance => BigDecimal('12834541.43418'),
  :confirmed => true
)

puts "Taxa Administrativa"
puts Date.new(2015, 05, 15)

value = BigDecimal('63.77863')
exchange_rate = BigDecimal('20.91754670')

TransactionItem.create!(
  :value => BigDecimal('63.77863'),
  :date => Date.new(2015, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 06, 15)

value = BigDecimal('230.74247')
exchange_rate = BigDecimal('20.94706294')

TransactionItem.create!(
  :value => BigDecimal('230.74247'),
  :date => Date.new(2015, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 07, 15)

value = BigDecimal('679.83266')
exchange_rate = BigDecimal('20.98975635')

TransactionItem.create!(
  :value => BigDecimal('679.83266'),
  :date => Date.new(2015, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('138445.48117'),
  :confirmed => true
)

puts Date.new(2015, 8, 15)

value = BigDecimal('967.85201')
exchange_rate = BigDecimal('21.03576472')

TransactionItem.create!(
  :value => BigDecimal('967.85201'),
  :date => Date.new(2015, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('407899.59501'),
  :confirmed => true
)

puts Date.new(2015, 9, 15)

value = BigDecimal('1614.91559')
exchange_rate = BigDecimal('21.07364441')

TransactionItem.create!(
  :value => BigDecimal('1614.91559'),
  :date => Date.new(2015, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('580711.20741'),
  :confirmed => true
)

puts Date.new(2015, 10, 15)

value = BigDecimal('1915.31782')
exchange_rate = BigDecimal('21.11293167')

TransactionItem.create!(
  :value => BigDecimal('1915.31782'),
  :date => Date.new(2015, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('968949.35625'),
  :confirmed => true
)

puts Date.new(2015, 11, 15)

value = BigDecimal('3208.90038')
exchange_rate = BigDecimal('21.14684967')

TransactionItem.create!(
  :value => BigDecimal('3208.90038'),
  :date => Date.new(2015, 11, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('1149190.69172'),
  :confirmed => true
)

puts Date.new(2015, 12, 15)

value = BigDecimal('6588.63237')
exchange_rate = BigDecimal('21.18355999')

TransactionItem.create!(
  :value => BigDecimal('6588.63237'),
  :date => Date.new(2015, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('1925340.22851'),
  :confirmed => true
)

puts Date.new(2016, 01, 15)

value = BigDecimal('6588.63237')
exchange_rate = BigDecimal('21.22213861')

TransactionItem.create!(
  :value => BigDecimal('6588.63237'),
  :date => Date.new(2016, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 02, 15)

value = BigDecimal('6588.63237')
exchange_rate = BigDecimal('21.24609655')

TransactionItem.create!(
  :value => BigDecimal('6588.63237'),
  :date => Date.new(2016, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 03, 15)

value = BigDecimal('6588.63237')
exchange_rate = BigDecimal('21.27880193')

TransactionItem.create!(
  :value => BigDecimal('6588.63237'),
  :date => Date.new(2016, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 04, 15)

value = BigDecimal('9055.91156')
exchange_rate = BigDecimal('21.31783834')

TransactionItem.create!(
  :value => BigDecimal('9055.91156'),
  :date => Date.new(2016, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true
)

puts Date.new(2016, 05, 15)

value = BigDecimal('9055.91156')
exchange_rate = BigDecimal('21.34729896')

TransactionItem.create!(
  :value => BigDecimal('9055.91156'),
  :date => Date.new(2016, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true
)

puts Date.new(2016, 06, 15)

value = BigDecimal('12367.20415')
exchange_rate = BigDecimal('21.38426334')

TransactionItem.create!(
  :value => BigDecimal('12367.20415'),
  :date => Date.new(2016, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('7420322.49050'),
  :confirmed => true
)

puts Date.new(2016, 07, 15)

value = BigDecimal('13006.39609')
exchange_rate = BigDecimal('21.42460012')

TransactionItem.create!(
  :value => BigDecimal('13006.39609'),
  :date => Date.new(2016, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('7803837.65382'),
  :confirmed => true
)

puts Date.new(2016, 8, 15)

value = BigDecimal('14026.35219')
exchange_rate = BigDecimal('21.46649449')

TransactionItem.create!(
  :value => BigDecimal('14026.35219'),
  :date => Date.new(2016, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('8415811.31163'),
  :confirmed => true
)

puts Date.new(2016, 9, 15)

value = BigDecimal('14981.70503')
exchange_rate = BigDecimal('21.51186071')

TransactionItem.create!(
  :value => BigDecimal('14981.70503'),
  :date => Date.new(2016, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('8989023.01858'),
  :confirmed => true
)

puts Date.new(2016, 10, 15)

value = BigDecimal('15944.35546')
exchange_rate = BigDecimal('21.54672020')

TransactionItem.create!(
  :value => BigDecimal('15944.35546'),
  :date => Date.new(2016, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('9566613.27341'),
  :confirmed => true
)

puts Date.new(2016, 11, 15)

value = BigDecimal('16792.56249')
exchange_rate = BigDecimal('21.57953900')

TransactionItem.create!(
  :value => BigDecimal('16792.56249'),
  :date => Date.new(2016, 11, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('10075537.49531'),
  :confirmed => true
)

puts Date.new(2016, 12, 15)

value = BigDecimal('17984.77134')
exchange_rate = BigDecimal('21.61462385')

TransactionItem.create!(
  :value => BigDecimal('17984.77134'),
  :date => Date.new(2016, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('10790862.80161'),
  :confirmed => true
)

puts Date.new(2017, 01, 15)

value = BigDecimal('18902.70280')
exchange_rate = BigDecimal('21.65312533')

TransactionItem.create!(
  :value => BigDecimal('18902.70280'),
  :date => Date.new(2017, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('11341621.68185'),
  :confirmed => true
)

puts Date.new(2017, 02, 15)

value = BigDecimal('19354.10242')
exchange_rate = BigDecimal('21.67683197')

TransactionItem.create!(
  :value => BigDecimal('19354.10242'),
  :date => Date.new(2017, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('11612461.45252'),
  :confirmed => true
)

puts Date.new(2017, 03, 15)

value = BigDecimal('19831.29199')
exchange_rate = BigDecimal('21.69405315')

TransactionItem.create!(
  :value => BigDecimal('19831.29199'),
  :date => Date.new(2017, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('11898775.19373'),
  :confirmed => true
)

puts Date.new(2017, 04, 15)

value = BigDecimal('20014.59952')
exchange_rate = BigDecimal('21.71267277')

TransactionItem.create!(
  :value => BigDecimal('20014.59952'),
  :date => Date.new(2017, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 05, 15)

value = BigDecimal('20014.59952')
exchange_rate = BigDecimal('21.71945744')

TransactionItem.create!(
  :value => BigDecimal('20014.59952'),
  :date => Date.new(2017, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 06, 15)

value = BigDecimal('20014.59952')
exchange_rate = BigDecimal('21.73480661')

TransactionItem.create!(
  :value => BigDecimal('20014.59952'),
  :date => Date.new(2017, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 07, 17)

value = BigDecimal('20506.58490')
exchange_rate = BigDecimal('21.74735688')

TransactionItem.create!(
  :value => BigDecimal('20506.58490'),
  :date => Date.new(2017, 07, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 8, 15)

value = BigDecimal('20506.58490')
exchange_rate = BigDecimal('21.75926638')

TransactionItem.create!(
  :value => BigDecimal('20506.58490'),
  :date => Date.new(2017, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 9, 15)

value = BigDecimal('20506.58490')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('20506.58490'),
  :date => Date.new(2017, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 10, 16)

value = BigDecimal('21092.62517')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21092.62517'),
  :date => Date.new(2017, 10, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2017, 11, 16)

value = BigDecimal('21092.62517')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21092.62517'),
  :date => Date.new(2017, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2017, 12, 15)

value = BigDecimal('21513.52218')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21513.52218'),
  :date => Date.new(2017, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12908113.30625'),
  :confirmed => true
)

puts Date.new(2018, 01, 15)

value = BigDecimal('21466.96023')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21466.96023'),
  :date => Date.new(2018, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12880176.13999'),
  :confirmed => true
)

puts Date.new(2018, 02, 15)

value = BigDecimal('21580.17614')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21580.17614'),
  :date => Date.new(2018, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12852099.28790'),
  :confirmed => true
)

puts Date.new(2018, 03, 15)

value = BigDecimal('21852.11480')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21852.11480'),
  :date => Date.new(2018, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13111268.87778'),
  :confirmed => true
)

puts Date.new(2018, 04, 15)

value = BigDecimal('21803.79173')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21803.79173'),
  :date => Date.new(2018, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13082275.03721'),
  :confirmed => true
)

puts Date.new(2018, 05, 15)

value = BigDecimal('21755.22705')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21755.22705'),
  :date => Date.new(2018, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13053136.22745'),
  :confirmed => true
)

puts Date.new(2018, 06, 15)

value = BigDecimal('21706.41954')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21706.41954'),
  :date => Date.new(2018, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13023851.72363'),
  :confirmed => true
)

puts Date.new(2018, 07, 16)

value = BigDecimal('21657.36800')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21657.36800'),
  :date => Date.new(2018, 07, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12994420.79729'),
  :confirmed => true
)

puts Date.new(2018, 8, 15)

value = BigDecimal('21608.07119')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21608.07119'),
  :date => Date.new(2018, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12964842.71632'),
  :confirmed => true
)

puts Date.new(2018, 9, 17)

value = BigDecimal('21558.52791')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21558.52791'),
  :date => Date.new(2018, 9, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12935116.74495'),
  :confirmed => true
)

puts Date.new(2018, 10, 15)

value = BigDecimal('21508.73691')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21508.73691'),
  :date => Date.new(2018, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12905242.14372'),
  :confirmed => true
)

puts Date.new(2018, 11, 16)

value = BigDecimal('21621.22921')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21621.22921'),
  :date => Date.new(2018, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13084188.22536'),
  :confirmed => true
)

puts Date.new(2018, 12, 15)

value = BigDecimal('21755.87399')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21755.87399'),
  :date => Date.new(2018, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13053524.39336'),
  :confirmed => true
)

puts Date.new(2019, 01, 15)

value = BigDecimal('21704.51207')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21704.51207'),
  :date => Date.new(2019, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('13022707.24221'),
  :confirmed => true
)

puts Date.new(2019, 02, 15)

value = BigDecimal('21652.89334')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21652.89334'),
  :date => Date.new(2019, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12991736.00530'),
  :confirmed => true
)

puts Date.new(2019, 03, 15)

value = BigDecimal('21601.01652')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21601.01652'),
  :date => Date.new(2019, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12960609.91221'),
  :confirmed => true
)

puts Date.new(2019, 04, 15)

value = BigDecimal('21548.88031')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21548.88031'),
  :date => Date.new(2019, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12929328.18865'),
  :confirmed => true
)

puts Date.new(2019, 05, 15)

value = BigDecimal('21496.48343')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21496.48343'),
  :date => Date.new(2019, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12897890.05647'),
  :confirmed => true
)

puts Date.new(2019, 06, 15)

value = BigDecimal('21443.82456')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21443.82456'),
  :date => Date.new(2019, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12866294.73363'),
  :confirmed => true
)

puts Date.new(2019, 07, 15)

value = BigDecimal('21390.90239')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('21390.90239'),
  :date => Date.new(2019, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_adm,
  :start_balance => BigDecimal('12834541.43418'),
  :confirmed => true
)


puts "Taxa de Risco"
puts Date.new(2015, 05, 15)

value = BigDecimal('22.32252')
exchange_rate = BigDecimal('20.91754670')

TransactionItem.create!(
  :value => BigDecimal('22.32252'),
  :date => Date.new(2015, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 06, 15)

value = BigDecimal('80.75986')
exchange_rate = BigDecimal('20.94706294')

TransactionItem.create!(
  :value => BigDecimal('80.75986'),
  :date => Date.new(2015, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('38267.17717'),
  :confirmed => true
)

puts Date.new(2015, 07, 15)

value = BigDecimal('237.94143')
exchange_rate = BigDecimal('20.98975635')

TransactionItem.create!(
  :value => BigDecimal('237.94143'),
  :date => Date.new(2015, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('138445.48117'),
  :confirmed => true
)

puts Date.new(2015, 8, 15)

value = BigDecimal('338.74820')
exchange_rate = BigDecimal('21.03576472')

TransactionItem.create!(
  :value => BigDecimal('338.74820'),
  :date => Date.new(2015, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('407899.59501'),
  :confirmed => true
)

puts Date.new(2015, 9, 15)

value = BigDecimal('565.22046')
exchange_rate = BigDecimal('21.07364441')

TransactionItem.create!(
  :value => BigDecimal('565.22046'),
  :date => Date.new(2015, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('580711.20741'),
  :confirmed => true
)

puts Date.new(2015, 10, 15)

value = BigDecimal('670.36124')
exchange_rate = BigDecimal('21.11293167')

TransactionItem.create!(
  :value => BigDecimal('670.36124'),
  :date => Date.new(2015, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('968949.35625'),
  :confirmed => true
)

puts Date.new(2015, 11, 15)

value = BigDecimal('1123.11513')
exchange_rate = BigDecimal('21.14684967')

TransactionItem.create!(
  :value => BigDecimal('1123.11513'),
  :date => Date.new(2015, 11, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('1149190.69172'),
  :confirmed => true
)

puts Date.new(2015, 12, 15)

value = BigDecimal('2306.02133')
exchange_rate = BigDecimal('21.18355999')

TransactionItem.create!(
  :value => BigDecimal('2306.02133'),
  :date => Date.new(2015, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('1925340.22851'),
  :confirmed => true
)

puts Date.new(2016, 01, 15)

value = BigDecimal('2306.02133')
exchange_rate = BigDecimal('21.22213861')

TransactionItem.create!(
  :value => BigDecimal('2306.02133'),
  :date => Date.new(2016, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 02, 15)

value = BigDecimal('2306.02133')
exchange_rate = BigDecimal('21.24609655')

TransactionItem.create!(
  :value => BigDecimal('2306.02133'),
  :date => Date.new(2016, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 03, 15)

value = BigDecimal('2306.02133')
exchange_rate = BigDecimal('21.27880193')

TransactionItem.create!(
  :value => BigDecimal('2306.02133'),
  :date => Date.new(2016, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('3953179.42250'),
  :confirmed => true
)

puts Date.new(2016, 04, 15)

value = BigDecimal('3169.56905')
exchange_rate = BigDecimal('21.31783834')

TransactionItem.create!(
  :value => BigDecimal('3169.56905'),
  :date => Date.new(2016, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true
)

puts Date.new(2016, 05, 15)

value = BigDecimal('3169.56905')
exchange_rate = BigDecimal('21.34729896')

TransactionItem.create!(
  :value => BigDecimal('3169.56905'),
  :date => Date.new(2016, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('5433546.93772'),
  :confirmed => true
)

puts Date.new(2016, 06, 15)

value = BigDecimal('4328.52145')
exchange_rate = BigDecimal('21.38426334')

TransactionItem.create!(
  :value => BigDecimal('4328.52145'),
  :date => Date.new(2016, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('7420322.49050'),
  :confirmed => true
)

puts Date.new(2016, 07, 15)

value = BigDecimal('4552.23863')
exchange_rate = BigDecimal('21.42460012')

TransactionItem.create!(
  :value => BigDecimal('4552.23863'),
  :date => Date.new(2016, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('7803837.65382'),
  :confirmed => true
)

puts Date.new(2016, 8, 15)

value = BigDecimal('4909.22327')
exchange_rate = BigDecimal('21.46649449')

TransactionItem.create!(
  :value => BigDecimal('4909.22327'),
  :date => Date.new(2016, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('8415811.31163'),
  :confirmed => true
)

puts Date.new(2016, 9, 15)

value = BigDecimal('5243.59676')
exchange_rate = BigDecimal('21.51186071')

TransactionItem.create!(
  :value => BigDecimal('5243.59676'),
  :date => Date.new(2016, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('8989023.01858'),
  :confirmed => true
)

puts Date.new(2016, 10, 15)

value = BigDecimal('5580.52441')
exchange_rate = BigDecimal('21.54672020')

TransactionItem.create!(
  :value => BigDecimal('5580.52441'),
  :date => Date.new(2016, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('9566613.27341'),
  :confirmed => true
)

puts Date.new(2016, 11, 15)

value = BigDecimal('5877.39687')
exchange_rate = BigDecimal('21.57953900')

TransactionItem.create!(
  :value => BigDecimal('5877.39687'),
  :date => Date.new(2016, 11, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('10075537.49531'),
  :confirmed => true
)

puts Date.new(2016, 12, 15)

value = BigDecimal('6294.66997')
exchange_rate = BigDecimal('21.61462385')

TransactionItem.create!(
  :value => BigDecimal('6294.66997'),
  :date => Date.new(2016, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('10790862.80161'),
  :confirmed => true
)

puts Date.new(2017, 01, 15)

value = BigDecimal('6615.94598')
exchange_rate = BigDecimal('21.65312533')

TransactionItem.create!(
  :value => BigDecimal('6615.94598'),
  :date => Date.new(2017, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('11341621.68185'),
  :confirmed => true
)

puts Date.new(2017, 02, 15)

value = BigDecimal('6773.93585')
exchange_rate = BigDecimal('21.67683197')

TransactionItem.create!(
  :value => BigDecimal('6773.93585'),
  :date => Date.new(2017, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('11612461.45252'),
  :confirmed => true
)

puts Date.new(2017, 03, 15)

value = BigDecimal('6940.95220')
exchange_rate = BigDecimal('21.69405315')

TransactionItem.create!(
  :value => BigDecimal('6940.95220'),
  :date => Date.new(2017, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('11898775.19373'),
  :confirmed => true
)

puts Date.new(2017, 04, 15)

value = BigDecimal('7005.10983')
exchange_rate = BigDecimal('21.71267277')

TransactionItem.create!(
  :value => BigDecimal('7005.10983'),
  :date => Date.new(2017, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 05, 15)

value = BigDecimal('7005.10983')
exchange_rate = BigDecimal('21.71945744')

TransactionItem.create!(
  :value => BigDecimal('7005.10983'),
  :date => Date.new(2017, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 06, 15)

value = BigDecimal('7005.10983')
exchange_rate = BigDecimal('21.73480661')

TransactionItem.create!(
  :value => BigDecimal('7005.10983'),
  :date => Date.new(2017, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12008759.70993'),
  :confirmed => true
)

puts Date.new(2017, 07, 17)

value = BigDecimal('7177.30472')
exchange_rate = BigDecimal('21.74735688')

TransactionItem.create!(
  :value => BigDecimal('7177.30472'),
  :date => Date.new(2017, 07, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 8, 15)

value = BigDecimal('7177.30472')
exchange_rate = BigDecimal('21.75926638')

TransactionItem.create!(
  :value => BigDecimal('7177.30472'),
  :date => Date.new(2017, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 9, 15)

value = BigDecimal('7177.30472')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7177.30472'),
  :date => Date.new(2017, 9, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12303950.94201'),
  :confirmed => true
)

puts Date.new(2017, 10, 16)

value = BigDecimal('7382.41881')
exchange_rate = BigDecimal('21.54672020')

TransactionItem.create!(
  :value => BigDecimal('7382.41881'),
  :date => Date.new(2017, 10, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2017, 11, 16)

value = BigDecimal('7382.41881')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7382.41881'),
  :date => Date.new(2017, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12655575.10314'),
  :confirmed => true
)

puts Date.new(2017, 12, 15)

value = BigDecimal('7529.73276')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7529.73276'),
  :date => Date.new(2017, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12908113.30625'),
  :confirmed => true
)

puts Date.new(2018, 01, 15)

value = BigDecimal('7513.43608')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7513.43608'),
  :date => Date.new(2018, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12880176.13999'),
  :confirmed => true
)

puts Date.new(2018, 02, 15)

value = BigDecimal('7665.06911')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7665.06911'),
  :date => Date.new(2018, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12852099.28790'),
  :confirmed => true
)

puts Date.new(2018, 03, 15)

value = BigDecimal('7648.24018')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7648.24018'),
  :date => Date.new(2018, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13111268.87778'),
  :confirmed => true
)

puts Date.new(2018, 04, 15)

value = BigDecimal('7631.32711')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7631.32711'),
  :date => Date.new(2018, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13082275.03721'),
  :confirmed => true
)

puts Date.new(2018, 05, 15)

value = BigDecimal('7614.32947')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7614.32947'),
  :date => Date.new(2018, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13053136.22745'),
  :confirmed => true
)

puts Date.new(2018, 06, 15)

value = BigDecimal('7597.24684')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7597.24684'),
  :date => Date.new(2018, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13023851.72363'),
  :confirmed => true
)

puts Date.new(2018, 07, 16)

value = BigDecimal('7580.07880')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7580.07880'),
  :date => Date.new(2018, 07, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12994420.79729'),
  :confirmed => true
)

puts Date.new(2018, 8, 15)

value = BigDecimal('7562.82492')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7562.82492'),
  :date => Date.new(2018, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12964842.71632'),
  :confirmed => true
)

puts Date.new(2018, 9, 17)

value = BigDecimal('7545.48477')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7545.48477'),
  :date => Date.new(2018, 9, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12935116.74495'),
  :confirmed => true
)

puts Date.new(2018, 10, 15)

value = BigDecimal('7528.05792')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7528.05792'),
  :date => Date.new(2018, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12905242.14372'),
  :confirmed => true
)

puts Date.new(2018, 11, 16)

value = BigDecimal('7632.44313')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7632.44313'),
  :date => Date.new(2018, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13084188.22536'),
  :confirmed => true
)

puts Date.new(2018, 12, 15)

value = BigDecimal('7614.55590')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7614.55590'),
  :date => Date.new(2018, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13053524.39336'),
  :confirmed => true
)

puts Date.new(2019, 01, 15)

value = BigDecimal('7596.57922')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7596.57922'),
  :date => Date.new(2019, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('13022707.24221'),
  :confirmed => true
)

puts Date.new(2019, 02, 15)

value = BigDecimal('7578.51267')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7578.51267'),
  :date => Date.new(2019, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12991736.00530'),
  :confirmed => true
)

puts Date.new(2019, 03, 15)

value = BigDecimal('7560.35578')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7560.35578'),
  :date => Date.new(2019, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12960609.91221'),
  :confirmed => true
)

puts Date.new(2019, 04, 15)

value = BigDecimal('7542.10811')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7542.10811'),
  :date => Date.new(2019, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12929328.18865'),
  :confirmed => true
)

puts Date.new(2019, 05, 15)

value = BigDecimal('7523.76920')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7523.76920'),
  :date => Date.new(2019, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12897890.05647'),
  :confirmed => true
)

puts Date.new(2019, 06, 15)

value = BigDecimal('7505.33859')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7505.33859'),
  :date => Date.new(2019, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12866294.73363'),
  :confirmed => true
)

puts Date.new(2019, 07, 15)

value = BigDecimal('7486.81584')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('7486.81584'),
  :date => Date.new(2019, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_risc,
  :start_balance => BigDecimal('12834541.43418'),
  :confirmed => true
)

puts "Amortização"

puts Date.new(2017, 12, 15)

value = BigDecimal('27937.166258268900')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('27937.166258268900'),
  :date => Date.new(2017, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12908113.30625'),
  :confirmed => true
)

puts Date.new(2018, 01, 15)

value = BigDecimal('28076.85209006160')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('28076.85209006160'),
  :date => Date.new(2018, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12880176.13999'),
  :confirmed => true
)

puts Date.new(2018, 02, 15)

value = BigDecimal('28849.59260274620')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('28849.59260274620'),
  :date => Date.new(2018, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12852099.28790'),
  :confirmed => true
)

puts Date.new(2018, 03, 15)

value = BigDecimal('28993.84056575990')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('28993.84056575990'),
  :date => Date.new(2018, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13111268.87778'),
  :confirmed => true
)

puts Date.new(2018, 04, 15)

value = BigDecimal('29138.80976858870')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('29138.80976858870'),
  :date => Date.new(2018, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13082275.03721'),
  :confirmed => true
)

puts Date.new(2018, 05, 15)

value = BigDecimal('29284.50381743160')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('29284.50381743160'),
  :date => Date.new(2018, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13053136.22745'),
  :confirmed => true
)

puts Date.new(2018, 06, 15)

value = BigDecimal('29430.92633651880')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('29430.92633651880'),
  :date => Date.new(2018, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13023851.72363'),
  :confirmed => true
)

puts Date.new(2018, 07, 16)

value = BigDecimal('29578.08097')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('29578.08097'),
  :date => Date.new(2018, 07, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12994420.79729'),
  :confirmed => true
)

puts Date.new(2018, 8, 15)

value = BigDecimal('29725.97137')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('29725.97137'),
  :date => Date.new(2018, 8, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12964842.71632'),
  :confirmed => true
)

puts Date.new(2018, 9, 17)

value = BigDecimal('29874.60123')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('29874.60123'),
  :date => Date.new(2018, 9, 17),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12935116.74495'),
  :confirmed => true
)

puts Date.new(2018, 10, 15)

value = BigDecimal('30023.97424')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('30023.97424'),
  :date => Date.new(2018, 10, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12905242.14372'),
  :confirmed => true
)

puts Date.new(2018, 11, 16)

value = BigDecimal('30663.83199')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('30663.83199'),
  :date => Date.new(2018, 11, 16),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13084188.22536'),
  :confirmed => true
)

puts Date.new(2018, 12, 15)

value = BigDecimal('30817.15115')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('30817.15115'),
  :date => Date.new(2018, 12, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13053524.39336'),
  :confirmed => true
)

puts Date.new(2019, 01, 15)

value = BigDecimal('30971.236912')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('30971.236912'),
  :date => Date.new(2019, 01, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('13022707.24221'),
  :confirmed => true
)

puts Date.new(2019, 02, 15)

value = BigDecimal('31126.09309')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('31126.09309'),
  :date => Date.new(2019, 02, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12991736.00530'),
  :confirmed => true
)

puts Date.new(2019, 03, 15)

value = BigDecimal('31281.72356')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('31281.72356'),
  :date => Date.new(2019, 03, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12960609.91221'),
  :confirmed => true
)

puts Date.new(2019, 04, 15)

value = BigDecimal('31438.13218')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('31438.13218'),
  :date => Date.new(2019, 04, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12929328.18865'),
  :confirmed => true
)

puts Date.new(2019, 05, 15)

value = BigDecimal('31595.32284')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('31595.32284'),
  :date => Date.new(2019, 05, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12897890.05647'),
  :confirmed => true
)

puts Date.new(2019, 06, 15)

value = BigDecimal('31753.29945')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('31753.29945'),
  :date => Date.new(2019, 06, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12866294.73363'),
  :confirmed => true
)

puts Date.new(2019, 07, 15)

value = BigDecimal('31912.06595')
exchange_rate = BigDecimal('21.76552574')

TransactionItem.create!(
  :value => BigDecimal('31912.06595'),
  :date => Date.new(2019, 07, 15),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => amortization,
  :start_balance => BigDecimal('12834541.43418'),
  :confirmed => true
)

puts '>>>>>>>>>>>>>>>>>>>>>>>>>> CAF'
value = BigDecimal('2408990.48')
exchange_rate = BigDecimal('3.2530')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 05, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('0'),
  :confirmed => true
)

value = BigDecimal('11015060.44')
exchange_rate = BigDecimal('3.2810')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 06, 05),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('2408990.48'),
  :confirmed => true
)

value = BigDecimal('4029385.92')
exchange_rate = BigDecimal('3.2465')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 10, 20),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('13424050.92'),
  :confirmed => true
)

value = BigDecimal('2581628.50')
exchange_rate = BigDecimal('3.2080')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 11, 22),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('17453436.84'),
  :confirmed => true
)

value = BigDecimal('4685650.71')
exchange_rate = BigDecimal('3.3120')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 12, 20),
  :internalization_date => Date.new(2017, 12, 22),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('20035065.34'),
  :confirmed => true
)

value = BigDecimal('1380706.92')
exchange_rate = BigDecimal('3.5930')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 05, 04),
  :internalization_date => Date.new(2018, 05, 9),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('24720716.05'),
  :confirmed => true
)

value = BigDecimal('3987951.00')
exchange_rate = BigDecimal('3.8625')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 07, 05),
  :internalization_date => Date.new(2018, 07, 11),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('26101422.97'),
  :confirmed => true
)

value = BigDecimal('6500000.00')
exchange_rate = BigDecimal('3.6895')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 10, 26),
  :internalization_date => Date.new(2018, 10, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('30089373.97'),
  :confirmed => true
)

value = BigDecimal('3350000.00')
exchange_rate = BigDecimal('3.8300')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 03, 12),
  :internalization_date => Date.new(2018, 03, 18),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_caf,
  :start_balance => BigDecimal('36589373.97'),
  :confirmed => true
)

value = BigDecimal('215629.57')
exchange_rate = BigDecimal('3.2330')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 11, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest_caf,
  :start_balance => BigDecimal('17453436.84'),
  :confirmed => true
)

value = BigDecimal('434329.90')
exchange_rate = BigDecimal('3.7230')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 05, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest_caf,
  :start_balance => BigDecimal('24720716.05'),
  :confirmed => true
)

value = BigDecimal('638654.30')
exchange_rate = BigDecimal('3.8705')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 11, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest_caf,
  :start_balance => BigDecimal('36589373.97'),
  :confirmed => true
)

value = BigDecimal('914022.69')
exchange_rate = BigDecimal('4.0370')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 05, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest_caf,
  :start_balance => BigDecimal('39939373.97'),
  :confirmed => true
)

value = BigDecimal('987323.42')
exchange_rate = BigDecimal('4.0370')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 11, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => interest_caf,
  :start_balance => BigDecimal('39939373.97'),
  :confirmed => true
)

value = BigDecimal('155517.30')
exchange_rate = BigDecimal('3.2330')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 11, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_cc_caf,
  :start_balance => BigDecimal('17453436.84'),
  :confirmed => true
)

value = BigDecimal('131574.78')
exchange_rate = BigDecimal('3.7230')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 05, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_cc_caf,
  :start_balance => BigDecimal('24720716.05'),
  :confirmed => true
)

value = BigDecimal('126109.11')
exchange_rate = BigDecimal('3.8705')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 11, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_cc_caf,
  :start_balance => BigDecimal('36589373.97'),
  :confirmed => true
)

value = BigDecimal('106800.29')
exchange_rate = BigDecimal('4.0370')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 05, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_cc_caf,
  :start_balance => BigDecimal('39939373.97'),
  :confirmed => true
)

value = BigDecimal('107441.79')
exchange_rate = BigDecimal('4.0370')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 11, 30),
  :value_brl => value * exchange_rate,
  :exchange_rate => exchange_rate,
  :transaction_info => charges_cc_caf,
  :start_balance => BigDecimal('39939373.97'),
  :confirmed => true
)

#BID
value = BigDecimal('12030000')
exchange_rate = BigDecimal('0.400112931')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2014, 11, 14),
  :value_brl => BigDecimal('3006657.90'),
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_bid,
  :start_balance => BigDecimal('0'),
  :confirmed => true
)

value = BigDecimal('9943227.53')
exchange_rate = BigDecimal('0.2898550720')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 05, 31),
  :value_brl => BigDecimal('34304134.98'),
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_bid,
  :start_balance => BigDecimal('1203000.00'),
  :confirmed => true
)

value = BigDecimal('7591386.98')
exchange_rate = BigDecimal('0.3124511795')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 12, 22),
  :value_brl => BigDecimal('24296234.03'),
  :internalization_date => Date.new(2018,1,19),
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_bid,
  :start_balance => BigDecimal('11146227.53'),
  :confirmed => true
)

value = BigDecimal('5051688.40')
exchange_rate = BigDecimal('0.260960334')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 6, 21),
  :internalization_date => Date.new(2019,6,26),
  :value_brl => BigDecimal('3006657.90'),
  :exchange_rate => exchange_rate,
  :transaction_info => withdraw_bid,
  :start_balance => BigDecimal('23320862.55'),
  :confirmed => true
)

value = BigDecimal('5713.75')
value_brl = BigDecimal('17426.92')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('1203000.00')
)

value = BigDecimal('7165.93')
value_brl = BigDecimal('28240.93')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('1203000.00')
)

value = BigDecimal('11414.32')
value_brl = BigDecimal('40264.01')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('1203000.00')
)

value = BigDecimal('82242.95')
value_brl = BigDecimal('260874.64')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('11146227.53')
)

value = BigDecimal('114972.74')
value_brl = BigDecimal('356530.47')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('11146227.53')
)

value = BigDecimal('122525.90')
value_brl = BigDecimal('390122.47')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('11146227.53')
)

value = BigDecimal('202229.90')
value_brl = BigDecimal('686853.63')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('309632.66')
value_brl = BigDecimal('1164373.62')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('341394.19')
value_brl = BigDecimal('1316928.09')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('358098.87')
value_brl = BigDecimal('1466056.77')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => interest_bid,
  :start_balance => BigDecimal('23320862.55')
)

#BID-ENCARGO

value = BigDecimal('30639.93')
value_brl = BigDecimal('74455.03')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2014, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('0')
)

value = BigDecimal('31772.41')
value_brl = BigDecimal('96905.85')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('1203000.00')
)

value = BigDecimal('31670.28')
value_brl = BigDecimal('124812.57')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('1203000.00')
)

value = BigDecimal('81585.81')
value_brl = BigDecimal('287793.94')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('1203000.00')
)

value = BigDecimal('44557.91')
value_brl = BigDecimal('141337.69')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('11146227.53')
)

value = BigDecimal('38159.74')
value_brl = BigDecimal('118333.35')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('11146227.53')
)

value = BigDecimal('38414.39')
value_brl = BigDecimal('122311.42')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('11146227.53')
)

value = BigDecimal('26349.43')
value_brl = BigDecimal('89493.20')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('19383.93')
value_brl = BigDecimal('72893.27')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2018, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('19278.00')
value_brl = BigDecimal('74364.89')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('11356.59')
value_brl = BigDecimal('46493.88')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => charges_bid,
  :start_balance => BigDecimal('23320862.55')
)

value = BigDecimal('468440.36')
value_brl = BigDecimal('1807008.69')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => amortization_bid,
  :start_balance => BigDecimal('18737614.51')
)

value = BigDecimal('597970.87')
value_brl = BigDecimal('2448092.74')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2019, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => value / value_brl,
  :transaction_info => amortization_bid,
  :start_balance => BigDecimal('23320862.55')
)

#BNDES

value = BigDecimal('125371.278')
value_brl = BigDecimal('175000')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 01, 29),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.3958540'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('0'),
  :confirmed => true
)

value = BigDecimal('206385.6910')
value_brl = BigDecimal('290189.22')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 02, 24),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.4060530'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('125371.278'),
  :confirmed => true
)

value = BigDecimal('624784.5539')
value_brl = BigDecimal('896391.52')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 04, 28),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.4347210'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('331756.96900'),
  :confirmed => true
)

value = BigDecimal('522952.5584')
value_brl = BigDecimal('799858.03')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 10, 26),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.5295040'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('956541.52290'),
  :confirmed => true
)

value = BigDecimal('858739.6504')
value_brl = BigDecimal('1371244.92')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 02, 24),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.5968110'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('1479494.08130'),
  :confirmed => true
)

value = BigDecimal('548930.0373')
value_brl = BigDecimal('884398.20')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 03, 18),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.6111310'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('2338233.73170'),
  :confirmed => true
)

value = BigDecimal('1094681.3614')
value_brl = BigDecimal('1824918.12')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 6, 22),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.6670770'),
  :transaction_info => withdraw_bnds_sub_a,
  :start_balance => BigDecimal('2887163.76900'),
  :confirmed => true
)

#Sub A interests

value = BigDecimal('1178.1416')
value_brl = BigDecimal('5678.8467')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.12459645'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('331756.96900')
)

value = BigDecimal('4701.1907')
value_brl = BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 7, 15),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.12459645'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('956541.52290')
)

value = BigDecimal('5301.1531')
value_brl = BigDecimal('4301.5484')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 10, 15),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.12459645'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('956541.52290')
)

value = BigDecimal('7754.1005')
value_brl = BigDecimal('1.12459645'),

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 1, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.12459645'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('1479494.08130')
)

value = BigDecimal('11517.4879')
value_brl = BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 4, 15),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.65748987'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('2887163.76900')
)

value = BigDecimal('17357.1224')
value_brl = BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 7, 15),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal(''),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('3981845.13040')
)

value = BigDecimal('22067.3857')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 10, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('3981845.13040')
)

value = BigDecimal('21720.9652')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 1, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_a,
  :start_balance => BigDecimal('3981845.13040')
)

#Sub B

value = BigDecimal('265946.66880')
value_brl = BigDecimal('525000')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 01, 29),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1,97408'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('0'),
  :confirmed => true
)

value = BigDecimal('440999.18440')
value_brl = BigDecimal('870567.67')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 02, 24),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.97408'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('265946.6688'),
  :confirmed => true
)

value = BigDecimal('1362241.92780')
value_brl = BigDecimal('2689174.54')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 04, 28),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.97408'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('706945.8532'),
  :confirmed => true
)

value = BigDecimal('1100315.45090')
value_brl = BigDecimal('2176173.09')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 10, 26),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.97777'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('2069187.7810'),
  :confirmed => true
)

value = BigDecimal('2071978.31780')
value_brl = BigDecimal('4113734.76')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 02, 24),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.98541'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('3169503.2319'),
  :confirmed => true
)

value = BigDecimal('1335137.51200')
value_brl = BigDecimal('2653194.61')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 03, 18),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.98721'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('5241481.5497'),
  :confirmed => true
)

value = BigDecimal('419254.50250')
value_brl = BigDecimal('836284.86')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 6, 22),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('1.99470'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('6576619.0617'),
  :confirmed => true
)

value = BigDecimal('1374526.12470')
value_brl = BigDecimal('2752052.84')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 9, 26),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('2.00218'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('6995873.5642'),
  :confirmed => true
)

value = BigDecimal('575106.83670')
value_brl = BigDecimal('1152590.59')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 10, 21),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('2.00413'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('8370399.6889'),
  :confirmed => true
)

value = BigDecimal('1767422.50640')
value_brl = BigDecimal('3548767')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 12, 8),
  :value_brl => value_brl,
  :exchange_rate => BigDecimal('2.00788'),
  :transaction_info => withdraw_bnds_sub_b,
  :start_balance => BigDecimal('8945506.5256'),
  :confirmed => true
)

#Sub B interests

value = BigDecimal('8672.18320')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 4, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('706945.8532')
)

value = BigDecimal('36793.90520')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 7, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('2069187.7810')
)

value = BigDecimal('41100.27689')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2015, 10, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('2069187.7810')
)

value = BigDecimal('60317.66040')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 1, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('3169503.2319')
)

value = BigDecimal('131258.76350')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 4, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('6576619.0617')
)

value = BigDecimal('131258.76350')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 7, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('6995873.5642')
)

value = BigDecimal('148184.55750')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2016, 10, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('8370399.6889')
)

value = BigDecimal('190016.06960')
value_brl =BigDecimal('1.73571224')

TransactionItem.create!(
  :value => value,
  :date => Date.new(2017, 1, 15),
  :value_brl => value_brl,
  :exchange_rate =>BigDecimal('1.73571224'),
  :transaction_info => interest_bnds_sub_b,
  :start_balance => BigDecimal('10712929.0320')
)