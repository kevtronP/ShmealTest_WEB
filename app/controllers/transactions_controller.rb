class TransactionsController < ApplicationController
  def new
    Braintree::ClientToken.generate

    render json: @client_token

  end

  def create
    @result = Braintree::Transaction.sale(
              amount => "6.00",
              payment_method_nonce: params[:payment_method_nonce])

    if @result.success?

    else

    end
  end

end
