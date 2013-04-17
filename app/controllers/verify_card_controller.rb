class VerifyCardController < ApplicationController
  def index
    @payment = Payment.new
  end

  def create
    Payment.new(params[:payment]).save

    redirect_to :root
  end

end
