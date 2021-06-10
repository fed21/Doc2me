class UpdateStub
    @redirection
    def initialize
        #For "new" method
        @redirection=nil
    end

    def updatesimulated(nome,cognome,telefono)
        user=User.where(:nome => "prova" , :cognome=>"prova" , :telefono=> 3213213212)
        user.update(nome: nome , cognome: cognome , telefono: telefono)
        @redirection="profilo"
    end

    def redirection
        return @redirection 
    end
end