class TransactionsController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
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
