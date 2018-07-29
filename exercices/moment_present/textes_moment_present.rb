EXOS_MOMENT_PRESENT = ["exo_jeu_du_detail", "exo_minuteur_start"]

JEU_DU_DETAIL = {
  intro:
  "Let's go! Cet exercice s'appelle 'Le jeu du détail'.Je vais te montrer une image, et tu auras 30 secondes pour en décrire le plus de détails possible. 👁🖼" ,
  ready:
  "Est-tu prêt ? Tu as 30 sec à partir du moment où tu cliques sur le bouton !",
  time_up:
  "Time's up ! Décris moi ce que tu as vu 😃",
  quel_oeil:
  "Quel oeil ! J'en avais manqué plein !",
  peux_mieux_faire:
  "C'est un bon début ! Mais je suis sûr que tu t'amélioreras à force de répétition ! 😉",
  but_exercice:
  "Cet exercice est fait pour te faire travailler ta concentration et donc à faire le vide autour de toi pendant un court instant. J'espère que tu l'as aimé.",
  nouvel_exercice:
  "Maintenant que nous avons terminé, as-tu envie d'en faire un autre ?",
  au_revoir:
  "Pas de souci, en espérant que tu reviennes bientôt !"
}


MINUTEUR = {
  intro:
  "C'est parti !
  Cet exercice s'appelle 'Le Minuteur'. Son but est de te redonner l'habitude d'être en contact avec toi-même et de vivre en pleine conscience." ,
  ready:
  "Pour se faire, tu vas définir une durée, et à la fin de celle-ci, je te préviendrai que c'est terminé, et tu devras noter ce que tu étais en train de faire à cet instant. ⏰🗒",
  time_up:
  "Dring Dring, Note maintenant ce que tu étais en train de faire quand l'alarme a sonné.",
  respirations:
  "Super ! Maintenant prends 4 grandes respirations, sans penser à ce que tu étais en train de faire puis expire. Tu peux suivre ce gif pour t'aider.",
  feedback:
  "Voilà, c'est terminé ! As-tu apprécié cet exercice ?",
  unknown_command:
  "Je ne comprends pas ce que tu as dit, peux-tu cliquer sur un bouton s'il te plait?"
}


MINUTEUR_TIME = [
  {
    content_type: 'text',
    title: '10 minutes',
    payload: 'DIX_MINUTES'
  },
  {
    content_type: 'text',
    title: '30 minutes',
    payload: 'TRENTE_MINUTES'
  },
  {
    content_type: 'text',
    title: '1 heure',
    payload: 'UNE_HEURE'
  },
  {
    content_type: 'text',
    title: '1 heure 30',
    payload: 'UNE_HEURE_TRENTE'
  },
  {
    content_type: 'text',
    title: 'Faire un autre exercice',
    payload: 'SKIP_EXERCICE'
  }
]

ANS_MINUTEUR = {
  play:
  "C'est noté!  A tout à l'heure ! 👋🏼" ,
  skip:
  "Comme tu veux 😶 Je te propose alors un autre exercice, en espérant que celui-là te plaise !"
}
