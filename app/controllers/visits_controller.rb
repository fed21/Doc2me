class VisitsController < ApplicationController
    def servizi
       
    end 

   
    def createservizi1
        d = Date.today.strftime("%Y-%m-%d")
        datereq=params[:date]
        if (datereq > d)
            
            hour=params[:ora].split(':')[0].to_i
            wday= datereq.to_date.wday
            if turn=Turn.where(:day=> wday)
            else
                alert 
            end 
            
            turn=turn.where('turns.start <= ? AND turns.end > ?',hour,hour)
            iddoc=turn[0][:id]
            emaildoc=Doctor.where(:id=> iddoc)[0][:email]

            
            
            render html: current_user.id
        
        else
            redirect_to "/"
        end

    end
end
