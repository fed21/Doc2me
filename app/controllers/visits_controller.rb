class VisitsController < ApplicationController
    
    
    def servizi
       
    end 

    def prenotazioni
        if !user_signed_in? && !doctor_signed_in?
            redirect_to '/'
        else
            if user_signed_in?
                @p = Visit.where(:user_id => current_user.id)          
            else
                @p = Visit.where(:doctor_id => current_doctor.id)
            end
        end
        
    end


    def setpagata
        
    #vis = Visit.order(:data_ora).order(:stato_visita).first
    
    end

    def createservizi1
        d = Date.today.strftime("%Y-%m-%d")
        datereq=params[:date]
        @datereq = datereq
        @cu = current_user.id
        
        
        if (datereq > d)
            @hour = params[:ora]
            hour=params[:ora].split(':')[0].to_i
            minuti=params[:ora].split(':')[1].to_i
            anno=params[:date].split("-")[0].to_i
            mese=params[:date].split("-")[1].to_i
            giorno=params[:date].split("-")[2].to_i
            wday= datereq.to_date.wday
           
            
            
            turn=Turn.where('turns.start <= ? AND turns.end > ? AND turns.day=?',hour,hour,wday)
             
            if turn[0] != nil
                iddoc=turn[0][:doctor_id]
                
                @emaildoc=Doctor.where(:id=> iddoc)[0][:email]
                # current_user.id
                son = Kid.where(:user_id=>current_user.id)
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome], params[:figliocognome])
                if son[0] != nil

                    sonid = son.first[:id]
                    dora= DateTime.new(anno,mese,giorno,hour,minuti)
                    Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'online', :user_id=>current_user.id, :kid_id=>sonid)                        
                    Formservizi1Mailer.servizi1_form1(@emaildoc, current_user, params[:date], @hour).deliver
                    redirect_to '/servizi', notice: "Visita prenotata con successo"       
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
            minuti=params[:ora].split(':')[1].to_i
            anno=params[:date].split("-")[0].to_i
            mese=params[:date].split("-")[1].to_i
            giorno=params[:date].split("-")[2].to_i
            wday= datereq.to_date.wday
            turn=Turn.where(:day=> wday)
            
            
            turn=Turn.where('turns.start <= ? AND turns.end > ? AND turns.day=?',hour,hour,wday)
            if turn[0] != nil
                iddoc=turn[0][:doctor_id]
                
                @emaildoc=Doctor.where(:id=> iddoc)[0][:email]
                # current_user.id
                son = Kid.where(:user_id=>current_user.id)
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome], params[:figliocognome])
                if son[0] != nil

                    sonid = son.first[:id]
                    dora= DateTime.new(anno,mese,giorno,hour,minuti)
                    Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'domicilio', :user_id=>current_user.id, :kid_id=>sonid)                        
                    Formservizi2Mailer.servizi2_form2(@emaildoc, current_user, params[:date], @hour, params[:indirizzo]).deliver
                    redirect_to '/servizi' , notice: "Visita prenotata con successo"        
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

    def destroy
        @v=Visit.find(params[:format])
        @v.destroy
        redirect_to "/prenotazioni"
    end
end
