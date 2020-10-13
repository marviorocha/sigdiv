# frozen_string_literal: true

class MonthReportsController < ApplicationController
	include ApplicationHelper
	include ActionView::Helpers::NumberHelper
	def show
		
		start_date = Date.new(params[:year].to_i, params[:month].to_i)
		
		@projection_debt = ProjectionDebt.new(Debt.find(params[:debt_id]), start_date + 1.month)
		@start_date = @projection_debt.start_date
		@future_transactions = @projection_debt.transaction_items    
		
		
		pdf = Prawn::Document.new
		pdf.font "Helvetica", size: 8
		pdf.stroke_color 'aaaaaa'
		pdf.stroke_axis
		pdf.image "app/assets/images/logo_niteroi.jpg", :at => [0, 700], :scale => 0.75
		pdf.draw_text "PREFEITURA NITERÓI - SECRETARIA MUNICIPAL DE FAZENDA", at: [90, 660], size: 13
		pdf.move_down 100
		
		pdf.text "A - Identificação do Contrato", style: :bold, size: 10
		## A Indentificação do Contrato
		pdf.move_down 5
		pdf.stroke_horizontal_rule
		pdf.move_down 5
		
		
		pdf.bounding_box([0, 595], width: 260, height: 220) do
			
			pdf.text "<b>Tipo:</b> #{@projection_debt.category}", inline_format: true
			pdf.text "<b>Mutuário:</b> Prefeitura Municipal de Niterói", inline_format: true
			pdf.text "<b>Credor:</b> #{@projection_debt.creditor.name}", inline_format: true
			pdf.text "<b>Valor do Contrato:</b> #{'R$ ' + big_decimal_to_currency_cents(@projection_debt.contract_value)}", inline_format: true
			pdf.text "<b>Fator de Conversão do Mês (moeda original) REAL:</b> #{@projection_debt.category}", inline_format: true
			pdf.text "<b>Fator de Conversão do Mês (em Real):</b> #{@projection_debt.category}", inline_format: true
			pdf.text "<b>Taxa de Encargos:</b> #{@projection_debt.transaction_infos.reduce('') { |result, info| info.charge? ? result + "#{info.description}: #{info.base}% " : result }}", inline_format: true
			pdf.text "<b>Taxa de juros:</b> #{@projection_debt.interest_rate}%", inline_format: true              
			
		end
		
		pdf.bounding_box([310, 595], width: 260, height: 220) do
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
		pdf.move_up 95 
		pdf.text "B - Esquema de Liberação de Recursos", style: :bold, size: 10
		pdf.move_down 5
		pdf.stroke_horizontal_rule
		pdf.move_down 5
		
		pdf.bounding_box([0, 440], width: 260, height: 220) do
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
			
			the_color = ["FFFFFF"]
			data += [["TOTAL", big_decimal_to_currency_cents(sum_values), big_decimal_to_currency_cents(sum_values_brl)]]
			
			
			pdf.table(data, width: 250, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF"])
			
		end
		
		pdf.bounding_box([310, 440], width: 240, height: 220) do
			pdf.text "1 - Parcelas Recebidas", style: :bold, size: 9
			pdf.move_down 2
			data = [ ["Mês/Ano", "Valores - Moeda Original"],
			["", ""] ]
			pdf.table(data, width: 220, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF"])
			
		end
		
		
		## C - Esquema de Pagamentos
		pdf.move_up 110  
		pdf.text "C - Esquema de Pagamentos", style: :bold, size: 10
		pdf.move_down 5
		pdf.stroke_horizontal_rule
		pdf.move_down 5 
		
		
		
		pdf.bounding_box([0, 300], width: 540, height: 140) do
			pdf.text "1- Realizado no Exercício", style: :bold, size: 9
			pdf.move_down 2
			data = [ ["Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"],
			["", "","",""] ]
			pdf.table(data, width: 540, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF"])
			
		end
		
		pdf.render_file 'public/reports.pdf' 
		
		
		
	end
	
	def export		
		
	end
	
end
