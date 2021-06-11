class KidsController < ApplicationController
    def create
        
        @user = User.find(params[:user_id])
        son = @user.kids.where('kids.name = ? AND kids.surname = ?', params[:kid][:name].downcase.titleize, params[:kid][:surname].downcase.titleize)
        
        if son[0] == nil
            @kid = @user.kids.create(kids_params)
            redirect_to profilo_path(@user)
        
        else
            redirect_to profilo_path(@user), notice: "Figlio gia esistente"
        end
    end

    def destroy

      @user = User.find(params[:user_id])
      @kid = @user.kids.find(params[:format])
      visite = Visit.where(:kid_id => @kid.id)
      if visite[0] 
        redirect_to profilo_path(@user), notice: "non puoi eliminare questo figlio poiche ha delle visite prenotate"
      else 
        @kid.destroy
        redirect_to profilo_path(@user)
      end
    end
    
    private
    
    def kids_params
      p = params.require(:kid).permit(:name,:surname,:sesso, :birth_date, :birth_place)
      {:name=> p[:name].downcase.titleize, :surname=>p[:surname].downcase.titleize, :user_id=>session[:user_id],:sesso=>p[:sesso],
      :birth_date=>p[:birth_date],:birth_place=>p[:birth_place]}
    end
end

