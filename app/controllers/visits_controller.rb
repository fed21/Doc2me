class VisitsController < ApplicationController
    def servizi
       
    end 

   
    def createservizi1
        d = Date.today.strftime("%Y-%m-%d")
        datereq=params[:date]
        @datereq = datereq
        @cu = current_user.id
        
        if (datereq > d)
            @hour = params[:ora]
            hour=params[:ora].split(':')[0].to_i
            wday= datereq.to_date.wday
            turn=Turn.where(:day=> wday)
            
            
            turn=turn.where('turns.start <= ? AND turns.end > ?',hour,hour)
            if turn[0] != nil
                iddoc=turn[0][:id]
                
                @emaildoc=Doctor.where(:id=> iddoc)[0][:email]
                # current_user.id
                son = Kid.where(:user_id=>current_user.id)
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome], params[:figliocognome])
                if son[0] != nil

                    sonid = son.first[:id]
                    dora= DateTime.new(2021,06,07,10,00)
                    Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'online', :user_id=>current_user.id, :kid_id=>sonid)                        
                    Formservizi1Mailer.servizi1_form1(@emaildoc, current_user, params[:date], @hour).deliver
                    redirect_to '/servizi'        
                else
                    redirect_to "/servizi", notice: "Nessun figlio trovato"
                end           
            else
                redirect_to "/servizi", notice: "Nessun medico lavora nel turno indicato"
            end
        
        else
            redirect_to "/servizi", notice: "Inserire una nuova data"
        end

    end

    def createservizi2
        d = Date.today.strftime("%Y-%m-%d")
        datereq=params[:date]
        @datereq = datereq
        @cu = current_user.id
        
        if (datereq > d)
            @hour = params[:ora]
            hour=params[:ora].split(':')[0].to_i
            wday= datereq.to_date.wday
            turn=Turn.where(:day=> wday)
            
            
            turn=turn.where('turns.start <= ? AND turns.end > ?',hour,hour)
            if turn[0] != nil
                iddoc=turn[0][:id]
                
                @emaildoc=Doctor.where(:id=> iddoc)[0][:email]
                # current_user.id
                son = Kid.where(:user_id=>current_user.id)
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome], params[:figliocognome])
                if son[0] != nil

                    sonid = son.first[:id]
                    dora= DateTime.new(2021,06,07,10,00)
                    Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'domicilio', :user_id=>current_user.id, :kid_id=>sonid)                        
                    Formservizi2Mailer.servizi2_form2(@emaildoc, current_user, params[:date], @hour, params[:indirizzo]).deliver
                    redirect_to '/servizi'        
                else
                    redirect_to "/servizi", notice: "Nessun figlio trovato"
                end           
            else
                redirect_to "/servizi", notice: "Nessun medico lavora nel turno indicato"
            end
        
        else
            redirect_to "/servizi", notice: "Inserire una nuova data"
        end

    end
end
