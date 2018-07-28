DINER_CELEBRATION = {
ready:
"Cet exercice s'appelle 'Dîner de célébration de vie' et va te projeter dans le futur. Ça te dit ?",
intro:
"Vamos ! Imaginons que dans 10 ans, les personnes les plus proches de toi décident d’organiser un dîner en ton honneur. A cet évènement tous ceux qui vous sont chers sont présents une coupe à la main.",
fete:
"Durant cette fête, ils ont tous préparé un discours en ton honneur. 🍾  Au cours de cette prise de parole ils vont pouvoir te témoigner en toute sincérité ce qu’ils pensent et ressentent pour toi. Que voudrais-tu qu’ils disent à ce moment ?",
reponse_valeurs:
"Super ! Tu vois, ce que tu viens d'écrire, ce sont en fait les valeurs qui te sont le plus chères. C'est très important de les connaître, et nous allons pouvoir les réutiliser lorsque nous travaillerons sur les valeurs engagées ensemble.",
note_valeurs:
"Je prends note de ce que tu as écris, et toi aussi tu devrais garder ces valeurs sur un carnet ou dans un coin de ta tête. Elles sont très importantes ! 😌",
nouvel_exercice:
"Maintenant que nous avons terminé, as-tu envie de faire un autre exercice ?",
unknown_command:
  "Je ne comprends pas ce que tu as dit, peux-tu appuyer sur un bouton s'il te plait?"
}

SE_REMERCIER = {
ready:
"Cet exercice s'appelle 'Se remercier dans 5 ans'. Ça te dit de le faire ?",
intro:
"Je vais te demander de te projeter 5 ans dans le futur. Où te vois-tu ? Regarde en arrière sur les 5 années qui t'ont amenées ici. Est-ce qu'il y a quelque chose dont tu voudrais te remercier d'avoir fait (que ce soit pour toi-même ou pour une autre personne) ?",
note:
"Okay, je note. Ce que tu viens d'écrire est lié aux valeurs que tu considères comme importantes. C'est très important d'y rester fidèle et de faire chaque jours des actions qui vont dans ce sens. N'hésite pas à aller faire un tour sur la dimension 'Action Engagées' qui va te permettre de travailler là-dessus.",
nouvel_exercice:
"Maintenant que nous avons terminé cet exercice, as-tu envie d'en faire un autre ?",
unknown_command:
  "Je ne comprends pas ce que tu as dit, peux-tu appuyer sur un des boutons s'il te plait?"
}


START_EXERCISE = [
  {
    content_type: 'text',
    title: 'GO!',
    payload: 'GO'
  },
  {
    content_type: 'text',
    title: "Changer d'exo",
    payload: 'CHANGE_EXO'
  },
  {
    content_type: 'text',
    title: 'Autre dimension',
    payload: 'ANOTHER_DIMENSION'
  }
]

NOUVEL_EXERCICE  = [
  {
    content_type: 'text',
    title: 'Oui',
    payload: 'OUI'
  },
  {
    content_type: 'text',
    title: "Non",
    payload: 'NON'
  },
  {
    content_type: 'text',
    title: 'Changer de thème',
    payload: 'CHANGER_THEME'
  }
]
