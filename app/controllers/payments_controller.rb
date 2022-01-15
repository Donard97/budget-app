class PaymentsController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to groups_url
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.author = current_user

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment.groups.first, notice: 'Payment was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:success] = 'Payment was successfully deleted.'
    redirect_to root_path
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, group_ids: [])
  end
end
