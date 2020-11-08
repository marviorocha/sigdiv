# frozen_string_literal: true

class MonthReportsController < ApplicationController
  include ApplicationHelper
  include MonthReportsHelper
  include ActionView::Helpers::NumberHelper
 
  def show

    params_year = params[:year]
    params_month = params[:month]

    if params_year and params_month == ""
      amortizacao_final = Debt.find(params[:debt_id])
      amortizacao_date = amortizacao_final.amortization_period
      start_date = Date.new(amortizacao_date.strftime("%Y").to_i, amortizacao_date.strftime("%m").to_i)
    else
      start_date = Date.new(params[:year].to_i, params[:month].to_i)
    end
   
 
    @projection_debt = ProjectionDebt.new(Debt.find(params[:debt_id]), start_date + 1.month)
    @start_date = @projection_debt.start_date
    @future_transactions = @projection_debt.transaction_items    
    
    
    pdf = Prawn::Document.new
    pdf.font 'Helvetica', :size => 8
    pdf.stroke_color 'aaaaaa'
    pdf.image 'app/assets/images/logo_niteroi.jpg', :at => [0, 700], :scale => 0.60
    pdf.draw_text 'PREFEITURA NITERÓI - SECRETARIA MUNICIPAL DE FAZENDA', :at => [90, 680], :size => 13
   
    pdf.move_down 100
    
    pdf.text 'A - Identificação do Contrato', :style => :bold, :size => 10
    ## A Indentificação do Contrato
    pdf.move_down 5
    pdf.stroke_horizontal_rule
    pdf.move_down 5
    
    
    pdf.bounding_box([0, 595], :width => 260, :height => 220) do
      
      indentification(@projection_debt, pdf)         
      
    end
    
    pdf.bounding_box([310, 595], :width => 260, :height => 220) do
      
      indentification_right(@projection_debt, pdf)			
      
    end 
    
    ## B - Esquema de Liberação de Recursos
    
    pdf.move_up 95 
    pdf.text 'B - Esquema de Liberação de Recursos', :style => :bold, :size => 10
    pdf.move_down 5
    pdf.stroke_horizontal_rule
    pdf.move_down 5
    
    pdf.bounding_box([0, 440], :width => 260, :height => 220) do
      
      schema_b(@projection_debt, pdf)
      
    end
    
    
    pdf.bounding_box([310, 440], :width => 240, :height => 220) do
      
      schema_b_right(@projection_debt, pdf)
      
    end
    
    
    ## C - Esquema de Pagamentos
    pdf.move_up 110  
    pdf.text 'C - Esquema de Pagamentos', :style => :bold, :size => 10
    pdf.move_down 5
    pdf.stroke_horizontal_rule
    pdf.move_down 5 
  
    
    # 1 - A Realizado no Exercício
    
    pdf.bounding_box([0, 300], :width => 540, :height => 440) do
      exercicio_1(@projection_debt, pdf)
      pdf.move_down 10
      exercicio_2(@projection_debt, pdf)
      pdf.move_down 10
      exercicio_3(@projection_debt, pdf)
    end
    
     
    
    pdf.start_new_page
    
  
    
    # 4 - A Realizar nos Próximos Exercícios
    pdf.bounding_box([0, 700], :width => 540) do	
     
      exercicio_4(@projection_debt, pdf)
      pdf.move_down 10 
      saldo_devedor(@projection_debt, pdf)

      pdf.move_down 20
      pdf.text 'D - Observações', :style => :bold, :size => 10
      pdf.move_down 5
      pdf.stroke_horizontal_rule
      pdf.move_down 10 
      
      pdf.table([[@projection_debt.notes]], :width => 540, :cell_style => { :height => 50 })

      pdf.move_down 30
      data = [['E - Local e Data', 'F - Órgão', 'G - Assinatura do Responsável'],
              ['Niterói, 28 de fevereiro de 2019',
               'Secretaria Municipal de Fazenda de Niterói',
               '']]
      pdf.table(data, :width => 540, :row_colors => %w[E9ECEF FFFFFF FFFFFF FFFFFF FFFFFF])                   
    end

        
    pdf.render_file 'public/reports.pdf' 
    
    # redirect_to "#{root_path}reports.pdf"
    
        
        
  end
      
   
      
end
    