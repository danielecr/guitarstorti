# Esercizi per chitarra

Questo progetto nasce con l'obiettivo di produrre lo sviluppo esplicito degli esercizi contenuti in "Il dominio delle corde", opera didattica di Mauro Storti, un metodo per chitarra classica.

L'idea parte dalle premesse stesse dell'autore, che la visualizzazione delle distanze nella tastiera dello strumento,e l'associazione di questa distanza con la posizione nel pentagramma sia di per se un metodo didattico importante per memorizzare mentalmente tutta la tastiera e "dargli un senso" (queste sono parole mie per semplificare).

Questa cosa mi ha convinto talmente, che ieri, il 20 Maggio, vedendo l'opera sotto mano mi sono chiesto: e dove sono le partiture?

Questo progetto nasce per cercare di colmare questa mancanza, e per me per imparare lilypond, il sistema di formattazione delle partiture del progetto GNU.

In Project.md ho scritto le prime idee, probabilmente sbagliate, per approcciare il problema.

In questo momento sono alle prime battute/esercizi.

Si tratta di un pattern definito dall'uso delle dita mano sinistra: 1-4 e 1-2

Il pattern è diviso in 2 parti, la 'e' nel mezzo corrisponde ad un cambio di posizione della mano sinistra su un differente capotasto.
In particolare nel testo il capotasto è indicato con P1, P2, ... eccetera. Cioè:

```text

 P1   P2
1-4   1-2

 P1   P3
1-4   1-2

...

 P1   P9
1-4   1-2

```

E così via fino appunto al nono capotasto, in modo tale da coprire tutta la tastiera.

## L'approccio

Un primo tentativo è stato quello puramente generativo, cosa poco affrontabile visto la mia ignoranza su lilypond, ho cercato il supporto di ChatGPT, fiducioso della semplicità delle mie richieste ho scelto il modello 3.5, che si è rivelato un totale fallimento (vedere cartella `chatgpt-help/`).

Il secondo cambio di strategia è stato "basta che funzioni", per poi passare a "provo a raggruppare le sequenze di note ed usare transpose.

Grazie ad uno snippet trovato qui <https://lsr.di.unimi.it/LSR/Snippet?id=266> sono riuscito a generare sequenze leggibili.


