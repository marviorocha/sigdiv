# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonthReportsController, :type => :controller do

  context "Month and Year" do
     it { 
      start_date = (Faker::Date.between(from: '2013-01-01', to: Date.today))
             expect(start_date).to be_between(start_date, Date.today)
             expect(start_date).to be_truthy
        } 
  end
  
  
end
 
 