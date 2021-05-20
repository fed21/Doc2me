$(document).ready(function () {
    var show=1;
    var show=0;
    $('#disp').click(function(){
        $('#disp-panel').show();
        if (show==0){
            $('#disp-panel').show();
            show=1;
            console.log(show);
        }
      else{

            $('#disp-panel').hide();
            show=0;
      }  
       
        
        console.log(show);
    });
});