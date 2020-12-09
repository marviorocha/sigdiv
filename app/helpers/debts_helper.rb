module DebtsHelper

    def status(status) 

        if status == "Amortização"
            return '<span class="badge badge-pill badge-warning">Amortização</span>'.html_safe 
        end
        if status == "Carência"
            return '<span class="badge badge-pill badge-info">Carência</span>'.html_safe 
        end
        if status == "Finalizado"
            return '<span class="badge badge-pill badge-success">Finalizado</span>'.html_safe 
        end

   

    end

end