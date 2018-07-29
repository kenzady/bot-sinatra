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

NEW_EXO = {
  ask_for_new_exo:
  "Maintenant que nous avons terminé, as-tu envie d'en faire un autre ?",
  au_revoir:
  'Pas de souci, en espérant que tu reviennes bientôt !',
  unknown_command: "Désolé, je n'ai pas compris. Peux-tu répéter s'il te plaît ?",
  no_more_exos_available: 'Quel bosseur ! Tu as déjà fait tous les exercices à ta disposition !'
}

NOUVEL_EXERCICE = [
  {
    content_type: 'text',
    title: "Refaire l'exercice",
    payload: 'NOUVEL_EXERCICE'
  },
  {
    content_type: 'text',
    title: 'Nouvel exercice',
    payload: 'NOUVEL_EXERCICE'
  },
  {
    content_type: 'text',
    title: "J'ai terminé",
    payload: 'GOODBYE'
  },
  {
    content_type: 'text',
    title: 'Changer de thème',
    payload: 'CHANGER_THEME'
  }
]

# Feedbacks routine

FEEDBACK_QUESTION = 'Maintenant que nous avons terminé, as-tu apprécié cet exercice ?'

FEEDBACK = [
  {
    content_type: 'text',
    title: 'Beaucoup',
    payload: 'BEAUCOUP'
  },
  {
    content_type: 'text',
    title: "Un petit peu",
    payload: 'UN_PEU'
  },
  {
    content_type: 'text',
    title: 'Pas du tout',
    payload: 'PAS_DU_TOUT'
  }
]

ANS_FEEDBACK = {
  beaucoup:
  "Génial 😎 ! Sache que cet exercice devient de plus en plus facile à force de répétition. Hâte de réitérer l'expérience avec toi ! 😉 Que veux tu faire maintenant?" ,
  un_peu:
  "Tant mieux ! Sache que cet exercice devient de plus en plus facile à force de répétition.Hâte de réitérer l'expérience avec toi ! 😉 Que veux-tu faire maintenant?",
  pas_du_tout:
  "J'en suis navré 😞😔 Sache que cet exercice devient de plus en plus facile à force de répétition. J'espère que tu l'apprécieras plus la prochaine fois ! Que veux tu faire maintenant?"

}
