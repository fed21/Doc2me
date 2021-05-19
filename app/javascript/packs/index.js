//alert("js caricato");
const navSlide=() => {
    const burger= document.querySelector('.burger');
    const nav =document.querySelector('.ul-nav');
    const navLinks = document.querySelectorAll('.ul-nav li');

    burger.addEventListener('click',()=> {
            nav.classList.toggle('nav-active');
    
            navLinks.forEach((link,index)=> {
                    if (link.style.animation) {
                            link.style.animation='';
                    }
                    else {
                           link.style.animation= 'navLinkFade 0.5s ease forwards ${index / 7+1.5}s';
                    }
            });
    burger.classList.toggle('toggle');
    });

var val = 0;

function cambiaOpacita(){
    var immagine = document.getElementById("im");
    
    
    immagine.style.opacity = val/100;
    immagine.style.filter = 'alpha(opacity = ' + val + ')';       
}
function aumentaOpacita() {
    val += 2;  
    cambiaOpacita();
    

    if(val<100){  
        
    setTimeout(aumentaOpacita, 50);
    }  
}
aumentaOpacita();
}
navSlide();


