# frozen_string_literal: true

module MonthReportsHelper
  
  
  # Start Indentification 
  def indentification(projection, pdf)
    pdf.text "<b>Tipo:</b> #{@projection_debt.category}", inline_format: true
    pdf.text "<b>Mutuário:</b> Prefeitura Municipal de Niterói", inline_format: true
    pdf.text "<b>Credor:</b> #{@projection_debt.creditor.name}", inline_format: true
    pdf.text "<b>Valor do Contrato:</b> 
    #{'R$ ' + big_decimal_to_currency_cents(@projection_debt.contract_value)}", inline_format: true
    pdf.text "<b>Fator de Conversão do Mês (moeda original) REAL:</b>
    #{@projection_debt.category}", inline_format: true
    pdf.text "<b>Fator de Conversão do Mês (em Real):</b>
    #{@projection_debt.category}", inline_format: true
    pdf.text "<b>Taxa de Encargos:</b> 
    #{@projection_debt.transaction_infos.reduce('') { |result, info| info.charge? ? result + 
    "#{info.description}: #{info.base}% " : result }}", inline_format: true
    pdf.text "<b>Taxa de juros:</b> #{@projection_debt.interest_rate}%", inline_format: true   
  end
  
  def indentification_right(projection, pdf)
    pdf.text "<b>Data da Assinatura:</b> #{@projection_debt.signature_date.strftime('%d/%m/%Y')}", inline_format: true
    pdf.text "<b>Agente Financeiro:</b> #{@projection_debt.creditor.name}", inline_format: true
    pdf.text "<b>Moeda Original:</b> #{@projection_debt.currency.name}", inline_format: true
    pdf.text "<b>Prazo de Carência:</b> #{@projection_debt.grace_period.strftime('%d/%m/%Y')}", inline_format: true
    pdf.text "<b>Prazo de Amortização:</b> #{@projection_debt.amortization_period.strftime('%d/%m/%Y')}", inline_format: true
    pdf.text "<b>Forma de Pagamento:</b> #{@projection_debt.amortization_type}", inline_format: true
    pdf.text "<b>Objetivo da Operação:</b> #{@projection_debt.purpose}", inline_format: true
    pdf.move_down 5
    last_rate = @projection_debt.debt.last_exchange_rate(@start_date)
    pdf.text "<b>Fator de Conversão em:</b> #{ @start_date.end_of_month.strftime('%d/%m/%Y')} #{last_rate.present? ? last_rate : "-"}", inline_format: true   
  end
  
  ## B - Esquema de Liberação de Recursos
  
  def schema_b(projection, pdf)
    
    pdf.text "1 - Parcelas Recebidas", style: :bold, size: 9
    pdf.move_down 2
    sum_values = 0
    sum_values_brl = 0
    data = [ ["Mês/Ano", "Valores - Moeda Original", "Valores em R$	"] ]  
    
    @projection_debt.debt.withdraws_values_by_year(@start_date).each do |year_values|           
      data += [[year_values[0].to_i, big_decimal_to_currency_cents(year_values[1]), big_decimal_to_currency_cents(year_values[2])]]
      sum_values += year_values[1]
      sum_values_brl += year_values[2]
    end
    
    the_color = @projection_debt.debt.withdraws_values_by_year(@start_date).map{|x| + "FFFFFF"}
    data += [["TOTAL", big_decimal_to_currency_cents(sum_values), big_decimal_to_currency_cents(sum_values_brl)]]       
    
    pdf.table(data, width: 250, :row_colors => ["E9ECEF"] + the_color)
    
  end
  
  def schema_b_right(protection, pdf)
    pdf.text "1 - Parcelas Recebidas", style: :bold, size: 9
    pdf.move_down 2
    data = [ ["Mês/Ano", "Valores - Moeda Original"],  ["", ""] ]
    pdf.table(data, width: 220, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF"])
  end
  
  ## C - Esquema de Pagamentos
  
  def exercicio_1(protection, pdf)
    paid_principal_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 2 
    paid_interest_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 3 
    paid_charges_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 4 
    paid_total_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date 
    
    pdf.text "1- Realizado no Exercício", style: :bold, size: 9
    pdf.move_down 2
    data = [ ["","Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"],
    ["No mês:",
      big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total(@start_date, 2)),
      big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date, 3),
      big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date, 4),
      big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date) 
    ],
    
    ["Até mês", big_decimal_to_currency_cents(paid_principal_year_amount),
      big_decimal_to_currency_cents(paid_interest_year_amount),
      big_decimal_to_currency_cents(paid_charges_year_amount),
      big_decimal_to_currency_cents(paid_total_year_amount)]
    ]
    
    pdf.table(data, width: 540, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF"])
  end
  
  ## 1 - A Realizado no Exercício
  
  def exercicio_2(projection, pdf)
    
    paid_principal_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 2 
    paid_interest_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 3 
    paid_charges_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 4 
    paid_total_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date 
    
    
    pdf.text "2 - A Realizado no Exercício", style: :bold, size: 9
    pdf.move_down 2
    
    data = [ ["","Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"],
    [ "Vencido:",
      "",
      "",
      "",
      "",],
      [
        "No mês:",
        big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total(@start_date, 2)),
        big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date, 3),
        big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date, 4),
        big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date) 
      ],
      
      ["Até mês", big_decimal_to_currency_cents(paid_principal_year_amount),
        big_decimal_to_currency_cents(paid_interest_year_amount),
        big_decimal_to_currency_cents(paid_charges_year_amount),
        big_decimal_to_currency_cents(paid_total_year_amount)]
      ]
      
      
      pdf.table(data, width: 540, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF","FFFFFF","FFFFFF"])
      
    end
    
    
    ## 3 - A Realizado no Exercício
    
    def exercicio_3(projection, pdf)
      
      paid_principal_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 2 
      paid_interest_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 3 
      paid_charges_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 4 
      paid_total_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date 
      
      
      pdf.text "3 - A Realizado no Exercício", style: :bold, size: 9
      pdf.move_down 2
      
      data = [ ["","Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"],
      [ "Vencido:",
        "",
        "",
        "",
        "",],
        [
          "No mês:",
          big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total(@start_date, 2)),
          big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date, 3),
          big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date, 4),
          big_decimal_to_currency_cents(@projection_debt.debt.transaction_items_month_total @start_date) 
        ],
        
        ["Até mês", big_decimal_to_currency_cents(paid_principal_year_amount),
          big_decimal_to_currency_cents(paid_interest_year_amount),
          big_decimal_to_currency_cents(paid_charges_year_amount),
          big_decimal_to_currency_cents(paid_total_year_amount)]
        ]
        
        
        pdf.table(data, width: 540, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF","FFFFFF","FFFFFF"])
        pdf.move_up 200
      end
      
      ## 4 - A Realizado no Exercício
      
      def exercicio_4(projection, pdf)
      
        total_principal = 0 
        total_principal_brl = 0 
        total_interest_brl = 0 
        total_charges_brl = 0 
        total = 0 
        
        pdf.text "4 - A Realizar nos Próximos Exercícios", style: :bold, size: 9
        pdf.move_down 2
        
        data = [ ["Ano","Principal em Moeda Original", "Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"]]
        
        
        ((@start_date.year + 1)..@projection_debt.last_year).each do |year| 
          
          year_total_principal = @projection_debt.brl_total_by year, 2 
          year_total_principal_brl = @projection_debt.brl_total_by year, 2 
          year_total_interest_brl = @projection_debt.brl_total_by year, 3 
          year_total_charges_brl = @projection_debt.brl_total_by year, 4 
          year_total = year_total_principal_brl + year_total_interest_brl + year_total_charges_brl 
          
          data += [[year,	big_decimal_to_currency_cents(year_total_principal_brl),
            big_decimal_to_currency_cents(year_total_principal_brl),
            big_decimal_to_currency_cents(year_total_interest_brl),
            big_decimal_to_currency_cents(year_total_charges_brl),
            big_decimal_to_currency_cents(year_total) 
            
            ]]
            
            total_principal += year_total_principal 
            total_principal_brl += year_total_principal_brl 
            total_interest_brl += year_total_interest_brl 
            total_charges_brl += year_total_charges_brl 
            total += year_total 
            
          end 
          
          make_color = data.map{|x| + "FFFFFF"}			
          pdf.table(data, width: 540, row_colors: ['E9ECEF'] + make_color )
          
        end
        
        ## 1 - Saldo devedor
        
        def saldo_devedor(projection, pdf)
          total_principal = 0 
          total_principal_brl = 0 
          total_interest_brl = 0 
          total_charges_brl = 0 
          total = 0 
          current_year_lacking_principal = @projection_debt.brl_lacking_total_by @start_date, 2 
          current_year_lacking_principal_brl = @projection_debt.brl_lacking_total_by  @start_date, 2 
          current_year_lacking_interest_brl = @projection_debt.brl_lacking_total_by @start_date, 3 
          current_year_lacking_charges_brl = @projection_debt.brl_lacking_total_by @start_date, 4 
          current_year_lacking = current_year_lacking_principal_brl + current_year_lacking_interest_brl + current_year_lacking_charges_brl 
          
          ((@start_date.year + 1)..@projection_debt.last_year).each do |year| 
            
            year_total_principal = @projection_debt.brl_total_by year, 2 
            year_total_principal_brl = @projection_debt.brl_total_by year, 2 
            year_total_interest_brl = @projection_debt.brl_total_by year, 3 
            year_total_charges_brl = @projection_debt.brl_total_by year, 4 
            year_total = year_total_principal_brl + year_total_interest_brl + year_total_charges_brl  
            
            total_principal += year_total_principal 
            total_principal_brl += year_total_principal_brl 
            total_interest_brl += year_total_interest_brl 
            total_charges_brl += year_total_charges_brl 
            total += year_total 
            
          end 
          
          
          pdf.text "4 - Saldo Devedor", style: :bold, size: 9
          
          pdf.move_down 2
          
          data = [ ["Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"],
            [ big_decimal_to_currency_cents(total_principal_brl + current_year_lacking_principal),
            big_decimal_to_currency_cents(total_interest_brl + current_year_lacking_interest_brl) ,
            big_decimal_to_currency_cents(total_charges_brl + current_year_lacking_charges_brl),
            big_decimal_to_currency_cents(total + current_year_lacking)]]
            pdf.table(data, width: 540, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF","FFFFFF","FFFFFF"])                   
          end

          

          
        end
        