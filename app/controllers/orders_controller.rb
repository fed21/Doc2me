class OrdersController < ApplicationController


  skip_before_action :verify_authenticity_token

  before_action :paypal_init, :except => [:index]

  def index
    
  end
  
  
  def create_order
  end
  

  def capture_order
    # orde = Order.find(5)
    # @user
    # orde = (select * from Visite, prenota where and prenota.genitore = @user.id and Visite.pagata=false).first
    # orde.update(price: 300)
    # request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new params[:order_id]
      # begin
      #   response = @client.execute request
      #   order = Order.find_by :token => params[:order_id]
      #   order.paid = response.result.status == 'COMPLETED'
      #   if order.save
      #     return render :json => {:status => response.result.status}, :status => :ok
      #   end
      # rescue PayPalHttp::HttpError => ioe
      #   # HANDLE THE ERROR
      # end
  end

    private

    def paypal_init
        client_id='ASdq7iEyucp804GHdGDsuhL1htb1dVa39RFyDtYF5noSAIYc3l6_sLW0DtK3HGqLzl4GlChhdk-EBEle'
        client_secret='EMAiNppJqsz_Ja9njpH5xWyRDpUkqUsbzHlo2v74CehMSuI6zL86jsb0qD2XqLbfiJgzPR0DsgAUu47'
        
        environment = PayPal::SandboxEnvironment.new client_id, client_secret
        @client = PayPal::PayPalHttpClient.new environment
    end
end
