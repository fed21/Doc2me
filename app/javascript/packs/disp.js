$(document).ready(function () {
  
    var show=0;
    
    var data_valid =/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/;
   
$('#disp').click(function(){
        var date= document.getElementById("reservationDate").value;
        console.log(date);
       
        if(show==0){

            if (!$("#reservationDate").val() || (!data_valid.test(date)) ){
            alert("seleziona una data prima di continuare");
            }
    
            else{
            $('#disp-panel').show();
            show=1;
            console.log(show);
            }

        }  

        else{
            $('#disp-panel').hide();
            show=0;
      }  
    });
});



    