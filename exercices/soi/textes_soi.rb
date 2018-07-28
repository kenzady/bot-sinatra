SOI_OBSERVATEUR = {
  ready:
  "L'exercice que je te propose s'appelle 'Le soi observateur' et c'est un exercice audio. Ça te tente ?",
  intro:
  "C'est parti alors, le voici !" ,
  nouvel_exercice:
  "Maintenant que nous avons terminé, as-tu envie d'en faire un autre ?",
  unknown_command:
  "Je ne comprends pas ce que tu as dit, peux-tu appuyer sur un bouton s'il te plait?",
  au_revoir:
  "Pas de souci, en espérant que tu reviennes bientôt !"
}

JEU_DE_ROLE = {
  ready:
  "L'exercice que je te propose s'appelle 'Jeu de rôle' Ça te tente ?",
  intro:
  "C'est parti alors, le voici !" ,
  nouvel_exercice:
  "Maintenant que nous avons terminé, as-tu envie d'en faire un autre ?",
  unknown_command:
  "Je ne comprends pas ce que tu as dit, peux-tu appuyer sur un bouton s'il te plait?",
  au_revoir:
  "Pas de souci, en espérant que tu reviennes bientôt !"
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
