NEW_EXO = {
  ask_for_new_exo:
  "Maintenant que nous avons terminé, as-tu envie d'en faire un autre ?",
  au_revoir:
  "Pas de souci, en espérant que tu reviennes bientôt !",
  unknown_command: "Désolé, je n'ai pas compris. Peux-tu répéter s'il te plaît ?"
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

NOUVEL_EXERCICE = [
  {
    content_type: 'text',
    title: 'Nouvel exercice',
    payload: 'NOUVEL_EXERCICE'
  },
  {
    content_type: 'text',
    title: "J'en ai fini",
    payload: 'GOODBYE'
  },
  {
    content_type: 'text',
    title: 'Changer de thème',
    payload: 'CHANGER_THEME'
  }
]
