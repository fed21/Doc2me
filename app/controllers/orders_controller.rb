class OrdersController < ApplicationController


  skip_before_action :verify_authenticity_token

  before_action :paypal_init, :except => [:index]

  def index
    
  end
  
  
  def create_order
  end
  

  def capture_order
    vis = Visit.where('user_id = ? AND stato_visita = ?', current_user.id, 'non pagata')[0]
    #vis = Visit.order(:data_ora).order(:stato_visita).first
    
    vis.update(stato_visita: 'pagata')
  end

    private

    def paypal_init
        client_id='ASdq7iEyucp804GHdGDsuhL1htb1dVa39RFyDtYF5noSAIYc3l6_sLW0DtK3HGqLzl4GlChhdk-EBEle'
        client_secret='EMAiNppJqsz_Ja9njpH5xWyRDpUkqUsbzHlo2v74CehMSuI6zL86jsb0qD2XqLbfiJgzPR0DsgAUu47'
        
        environment = PayPal::SandboxEnvironment.new client_id, client_secret
        @client = PayPal::PayPalHttpClient.new environment
    end
end
