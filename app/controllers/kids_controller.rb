class KidsController < ApplicationController
    
  
    def create
        

        @user = User.find(params[:user_id])
            son = @user.kids.where('kids.name = ? AND kids.surname = ?', params[:kid][:name], params[:kid][:surname])
            
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
        @kid.destroy
        redirect_to profilo_path(@user)
    end
    
    private
    
    def kids_params
        p = params.require(:kid).permit(:name,:surname,:sesso, :birth_date, :birth_place)
        {:name=> p[:name], :surname=>p[:surname], :user_id=>session[:user_id],:sesso=>p[:sesso],
        :birth_date=>p[:birth_date],:birth_place=>p[:birth_place]}
    end
end

