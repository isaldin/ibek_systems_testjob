class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def create
    @payment = Payment.new(params[:payment])

    if @payment.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
