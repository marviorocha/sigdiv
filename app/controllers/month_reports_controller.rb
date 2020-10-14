# frozen_string_literal: true

class MonthReportsController < ApplicationController
	include ApplicationHelper
	include MonthReportsHelper
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
			
			indentification(@projection_debt, pdf)         
			
		end
		
		pdf.bounding_box([310, 595], width: 260, height: 220) do
			
			indentification_right(@projection_debt, pdf)			
			
		end 
		
		## B - Esquema de Liberação de Recursos
		
		pdf.move_up 95 
		pdf.text "B - Esquema de Liberação de Recursos", style: :bold, size: 10
		pdf.move_down 5
		pdf.stroke_horizontal_rule
		pdf.move_down 5
		
		pdf.bounding_box([0, 440], width: 260, height: 220) do
			
			schema_b(@projection_debt, pdf)
			
		end
		
		
		pdf.bounding_box([310, 440], width: 240, height: 220) do
			
			schema_b_right(@projection_debt, pdf)
			
		end
		
		
		## C - Esquema de Pagamentos
		pdf.move_up 110  
		pdf.text "C - Esquema de Pagamentos", style: :bold, size: 10
		pdf.move_down 5
		pdf.stroke_horizontal_rule
		pdf.move_down 5 
		
		paid_principal_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 2 
		paid_interest_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 3 
		paid_charges_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date, 4 
		paid_total_year_amount =  @projection_debt.debt.transaction_items_year_total @start_date 
		
		# 1 - A Realizado no Exercício
		
		pdf.bounding_box([0, 300], width: 540, height: 140) do
			
			exercicio_1(@projection_debt, pdf)
			
		end
		
		# 2 - A Realizado no Exercício
		pdf.bounding_box([0, 220], width: 540, height: 140) do
			
			exercicio_2(@projection_debt, pdf)
			
		end
		
		# 3 - A Realizado no Exercício
		pdf.bounding_box([0, 120], width: 540, height: 140) do
			
			exercicio_3(@projection_debt, pdf)
			
		end
		
		pdf.start_new_page
		
		total_principal = 0 
		total_principal_brl = 0 
		total_interest_brl = 0 
		total_charges_brl = 0 
		total = 0 
		
		
		
		# 4 - A Realizar nos Próximos Exercícios
		pdf.bounding_box([0, 700], width: 540) do	
			exercicio_4(@projection_debt, pdf)
		end
		
		# 5- Saldo Devedor
		box_size =	((@start_date.year + 1)..@projection_debt.last_year).map{|x|}
		pdf.bounding_box([0, 2300 / box_size.count  ], width: 540, height: 320) do
			pdf.move_up 100
			pdf.text "4 - Saldo Devedor", style: :bold, size: 9
			
			pdf.move_down 2
			
			data = [ ["","Principal em R$", "Juros em R$", "Outros encargos em R$", "Total"],
			[ "Vencido:",
				"",
				"",
				"",
				"",]]
				pdf.table(data, width: 540, :row_colors => ["E9ECEF", "FFFFFF", "FFFFFF","FFFFFF","FFFFFF"])
			end
				
				
				
				
				pdf.render_file 'public/reports.pdf' 
				
				#redirect_to root_path + 'reports.pdf'
				
				
				
			end
			
			def export		
				
			end
			
		end
		