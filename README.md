# Repository
Repository per fase di development e deployment dell'applicazione web in Ruby on Rails "DOC2ME".
Il sito è raggiungibile al seguente link: 
```console
https://doc2me.herokuapp.com
```
# Il team
Studenti proponenti il progetto Doc2me per il Laboratorio di Sicurezza Informatica e Architetture Software dell’Università La Sapienza di Roma.

•	Jacopo Brunetti 
•	Federico Andrea Capomagi 
•	Federico Carmignani 
•	Giordano Cicchetti 

# Il progetto
Il progetto prevede la realizzazione e la distribuzione online di una piattaforma web, denominata Doc2me , che permette, come si evince dal nome, di avvicinare i dottori alle richieste dei pazienti alleggerendo le procedure di prenotazione e di contatto con i medici stessi. Essa permette di effettuare prenotazioni per visite mediche in modalità mista, ovvero online, in studio e a domicilio, ed offre la possibilità di entrare agilmente in comunicazione diretta con i medici in situazioni emergenziali.

 
# I ruoli
L’applicazione prevede 3 ruoli che un utente può assumere all’interno del sito web, ognuno con funzionalità specifiche, oltre al ruolo esterno di amministratore, che garantisce la manutenibilità e l’aggiornabilità della piattaforma, e che si identifica nel ruolo di amministratore di ogni applicazione in Ruby on Rails.

Utente non registrato:
    Può solamente visionare i contenuti del sito web, come la descrizione dei medici, le tariffe ed i servizi offerti, può inoltre richiedere il servizio emergenziale.

Utente registrato:
	Può visionare tutti i contenuti del sito web, può effettuare e disdire prenotazioni delle visite, online, in studio o a domicilio, può visionare date e orari disponibili e accordare un appuntamento presso lo studio di riferimento dei medici, può mettersi in contatto direttamente con il medico per situazioni emergenziali, può aggiungere profili relativi ad eventuali figli.

 Medico:
 	Può ricevere prenotazioni online, in studio o a domicilio e disdirle, inoltre può visionare le prenotazioni a suo carico nell’apposita sezione del profilo.

 Admin:
 	Può avere accesso dall’applicazione Rails a tutte le funzionalità del sito, può gestire gli utenti nel database di Rails e può avere una panoramica delle prenotazioni effettuate, può registrare un medico, può apportare modifiche al contenuto del sito web.

# L’ autenticazione                                                
Sono previste due modalità di accesso al sito:   
    Locale: L’utente può autenticarsi direttamente nel sito inserendo i dati personali richiesti.
    OAuth: L’utente può autenticarsi direttamente tramite il proprio account Google.

L’applicazione usufruisce di servizi esterni integrati tramite le rispettive API RESTful: SENDGRID, PAYPAL SANDOBOX e GOOGLE O-AUTH.

# Le funzionalità
Doc2me mette a disposizione un sito web i cui i visitatori hanno la possibilità, in modo semplice e veloce, di visionare i servizi offerti dai medici, una descrizione dei medici stessi affiliati alla piattaforma e le tariffe fisse che quest’ultima propone. I visitatori possono navigare sul sito liberamente per comprenderne gli scopi e l’assistenza che esso offre, oltre a richiedere il servizio emergenziale; gli utenti possono quindi effettuare il login rapidamente dalla home page del sito inserendo i loro dati personali ed usufruire a pieno in tal modo delle funzionalità proposte. Un utente registrato su Doc2me ha la possibilità di mettersi in contatto diretto con il medico in turno, tramite una videochiamata, richiedendo una consulenza medica online. Inoltre, l'utente registrato può prenotare una visita in studio, indicando orario e data della stessa visita, compatibilmente con le disponibilità, oltre che optare per una visita a domicilio. Infine, l'utente registrato avrà la possibilità di inserire all’interno del suo stesso account profili di eventuali figli, semplificando così la gestione delle visite mediche e permettendo di ottenere un report familiare complessivo circa le visite ancora da svolgere o svolte in passato, ricevendo infine diagnosi per e-mail, inserita dall’utente in fase di registrazione, e inviate dal medico stesso, il quale riceve i dati del paziente da visitare  tramite e-mail generate automaticamente dal sistema ogni volta che una prenotazione viene effettuata. La piattaforma si occupa di gestire lo smistamento delle prenotazioni a seconda dei turni dei medici di Doc2me , debitamente inseriti nel sistema in fase di creazione del profilo di un medico. Ogni medico riceve in tempo reale le prenotazioni a suo carico, ed inoltre ha la possibilità di richiedere agli admin un aggiornamento delle domande frequenti (FAQ) , presenti nel sito, in base ad eventuali richieste ricevute dai pazienti. Gli admin di Doc2me hanno il compito di inserire i medici nel sistema, oltre ad occuparsi della gestione dei clienti e dei contenuti. Gli admin sono in stretto contatto con i medici per eventuali problemi nel servizio e sono responsabili della manutenzione del sito stesso. I servizi offerti potranno essere pagati sia in contanti che tramite Paypal, nella pagina relativa alle prenotazioni di ogni utente. L’applicazione verrà distribuita tramite Heroku, piattaforma cloud per applicazioni software che supporta Ruby on Rails, e resa così accessibile anche online interagendo con un database PostgreSQL remoto.




