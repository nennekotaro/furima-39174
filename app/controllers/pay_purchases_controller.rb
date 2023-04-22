class PayPurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_item_sold, only: [:index, :create]

  def index
    @pay_form_purchase_form = PayFormPurchaseForm.new
  end

  def create
    @pay_form_purchase_form = PayFormPurchaseForm.new(pay_form_purchase_form_params)

    if @pay_form_purchase_form.valid?
      pay_item
      @pay_form_purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_form_purchase_form_params
    params.require(:pay_form_purchase_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def check_item_sold
    return unless @item.pay_purchase.present? || current_user.id == @item.user.id

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: pay_form_purchase_form_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
