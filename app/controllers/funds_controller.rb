class FundsController < ApplicationController

  def create
    if params[:present_value] == "" 
      @present_value = 10000
    else
      @present_value = params[:present_value].gsub(",", "").to_i
    end

    if params[:pmt] == ""
      @pmt = 1000
    else
      @pmt = params[:pmt].gsub(",","").to_i
    end

    if params[:age] == ""
      @age = 35
    else
      @age = params[:age].to_i
    end
    
    if params[:fund_ticker] == ""
      @exp_ratio = 0.81
    else 
      @exp_ratio = Fund.new.get_expense(params[:fund_ticker]).to_f
    end

    respond_to do |format|
      format.js
    end
  end

end
