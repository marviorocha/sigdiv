# frozen_string_literal: true

json.array! @creditors, :partial => 'creditors/creditor', :as => :creditor
