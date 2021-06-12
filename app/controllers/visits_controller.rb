class VisitsController < ApplicationController
    
    
    def servizi
       
    end 

    def prenotazioni
        if !user_signed_in? && !doctor_signed_in?
            redirect_to '/'
        else
            if user_signed_in?
                @p = Visit.where(:user_id => current_user.id).order(:data_ora)
                @da_pagare = Visit.where("user_id= ? AND stato_visita= ?",current_user.id,"da pagare")[0]    
            else
                @p = Visit.where(:doctor_id => current_doctor.id).order(:data_ora)
            end
        end
        
    end


    def altervisit
    
        visid = params[:idvisita]
        vis = Visit.where('id = ? AND doctor_id = ?', visid, current_doctor.id)[0]
        if vis != nil
            vis.update(stato_visita: 'pagata')
            redirect_to '/prenotazioni'
        else
            redirect_to '/prenotazioni', notice: 'Visita non trovata'
        end
    
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
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome].downcase.titleize, params[:figliocognome].downcase.titleize)
                if son[0] != nil
                    
                    sonid = son.first[:id]
                    dora= DateTime.new(anno,mese,giorno,hour,minuti)

                    check = Visit.where(:data_ora => dora)
                    if check[0]!= nil
                        redirect_to "/servizi", notice: "Orario non disponibile" 
                    else
                        Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'online', :user_id=>current_user.id, :kid_id=>sonid)                        
                        Formservizi1Mailer.servizi1_form1(@emaildoc, current_user, params[:date], @hour).deliver
                        redirect_to '/servizi', notice: "Visita prenotata con successo" 
                    end      
                else
                    redirect_to "/servizi", notice: "Nessun figlio trovato, prova a inserirlo con iniziali in minuscolo!"
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
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome].downcase.titleize, params[:figliocognome].downcase.titleize)
                if son[0] != nil

                    sonid = son.first[:id]
                    dora= DateTime.new(anno,mese,giorno,hour,minuti)

                    check = Visit.where(:data_ora => dora)
                    if check[0]!= nil
                        redirect_to "/servizi", notice: "Orario non disponibile" 
                    else
                        Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'domicilio', :user_id=>current_user.id, :kid_id=>sonid)                        
                        Formservizi2Mailer.servizi2_form2(@emaildoc, current_user, params[:date], @hour, params[:indirizzo]).deliver
                        redirect_to '/servizi' , notice: "Visita prenotata con successo"
                    end        
                else
                    redirect_to "/servizi", notice: "Nessun figlio trovato, prova a inserirlo con iniziali in minuscolo!"
                end           
            else
                redirect_to "/servizi", notice: "Nessun medico lavora nel turno indicato"
            end
        
        else
            redirect_to "/servizi", notice: "Inserire una nuova data"
        end

    end

    def createservizi3
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

                son = Kid.where(:user_id=>current_user.id)
                son = son.where('kids.name = ? AND kids.surname = ?', params[:figlionome].downcase.titleize, params[:figliocognome].downcase.titleize)
                if son[0] != nil

                    
                    datamin = params[:date]+(" 00:00:00")
                    datamax = params[:date]+(" 23:59:59")
                    @oc = Visit.where('data_ora <= ? AND data_ora >= ?', datamax, datamin)
                    @oc = @oc.map {|x| x.data_ora.hour}
                    if @oc.include?(hour)
                        redirect_to "/disponibilita", notice: "Orario non disponibile"
                    else
                        sonid = son.first[:id]
                        dora= DateTime.new(anno,mese,giorno,hour,minuti)
                        Visit.create!(:doctor_id=>iddoc, :data_ora=>dora, :stato_visita=>'non pagata', :tipo_visita=>'in studio', :user_id=>current_user.id, :kid_id=>sonid)                        
                        Formservizi3Mailer.servizi3_form3(@emaildoc, current_user, params[:date], @hour).deliver
                        redirect_to '/disponibilita', notice: "Visita prenotata con successo"    
                    end

                           
                else
                    redirect_to "/disponibilita", notice: "Nessun figlio trovato, prova a inserirlo con iniziali in minuscolo!"
                end           
            else
                redirect_to "/disponibilita", notice: "Nessun medico lavora nel turno indicato"
            end
        
        else
            redirect_to "/disponibilita", notice: "Inserire una nuova data"
        end

    end

    def destroy
        
        @v=Visit.find(params[:format])

        if user_signed_in?
        
            if @v.user_id != current_user.id 
                redirect_to "/"
            end

        elsif doctor_signed_in?

            if @v.doctor_id != current_doctor.id 
                redirect_to "/"
            end

        end 

        @v.destroy
        
        if(user_signed_in?)
            dottore = @v.doctor_id
            email_doc = Doctor.where(:id=>dottore)[0][:email]
            tipo=@v.tipo_visita
            datehour= @v.data_ora
            date=datehour.strftime("%Y-%m-%d")
            hour=datehour.strftime('%I:%M')
            UtenteeliminavisitaMailer.utenteeliminavisita(email_doc,current_user,date,hour,tipo).deliver
            redirect_to "/prenotazioni" ,notice: "visita annullata" 

        elsif(doctor_signed_in?)
            utente = @v.user_id
            email_utente = User.where(:id=>utente)[0][:email]
            tipo=@v.tipo_visita
            datehour= @v.data_ora
            date=datehour.strftime("%Y-%m-%d")
            hour=datehour.strftime('%I:%M')
            MedicoeliminavisitaMailer.medicoeliminavisita(email_utente,current_doctor,date,hour,tipo).deliver
            redirect_to "/prenotazioni" ,notice: "visita annullata" 
           
        end
        
    end
end
