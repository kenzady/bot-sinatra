CHOCOLAT_CHOCOLAT = {
  intro:
  "C'est parti !
Pour cet exercice je vais tout d'abord te demander de prononcer lentement le mot 'chocolat' et d'observer ce qu'il éveille en toi",
  intro_bis:
  "Moi, quand je le prononce, je peux pratiquement sentir l'odeur qui me monte aux narines, sentir la réaction de mes papilles quand je goûte du chocolat, ...",
  repetition:
  "Maintenant, répete le mot 'chocolat' à haute voix, sans interruption pendant une minute (je te dirai quand t'arrêter)",
  arret_repetition:
  "Après un si grand nombre de répétitions, le mot chocolat te paraît étrange, non ? Tu ne penses plus au sens du mot mais plutôt au son étrange que ta voix produit.
Ce n’est qu’un mot mais les mots ont le pouvoir de porter avec eux les caractéristiques des choses qu’ils désignent et ils ne cessent de le faire que si nous mettons en œuvre des techniques visant à ne plus les entendre que comme les sons qu’ils sont en réalité.",
  debut_repetition_souffrance:
  "Maintenant, je vais te demander de penser à un mot, ou bien une phrase qui te fait souffrir. C'est bon ?",
  go:
  "Okay c'est parti !" ,
  fin_exercice:
  "Voilà, c'est terminé. Cet exercice permet de se détacher du sens des mots, et peut aider à réduire la souffrance associée à certaines phrases.
C'est un exercice que tu peux répéter par toi même aussi souvent que tu le désires, et j'espère que tu l'as apprécié ! ",
nouvel_exercice:
  "Maintenant que nous avons terminé, as-tu envie d'en faire un autre ?",
  unknown_command:
  "Je ne comprends pas ce que tu as dit, peux-tu appuyer sur un bouton s'il te plait?"
}


ANS_CHOCOLAT_CHOCOLAT = [
  {
    content_type: 'text',
    title: "C'est bon",
    payload: 'OK'
  },
  {
    content_type: 'text',
    title: "Pas envie de faire cet exo",
    payload: 'CHANGE_EXO'
  },
  {
    content_type: 'text',
    title: 'Changer de dimension',
    payload: 'ANOTHER_DIMENSION'
  }
]

JEU_DU_MAIS = {
  intro:
"Allons-y. Pour cet exercice, je vais te demander de m'écrire une pensée négative. Cela peut être une chose à laquelle tu penses souvent, ou un truc qui vient de te traverser l'esprit.",
  pensee_positive:
"Très bien. Maintenant je vais te demander d'y associer une pensée positive. Par exemple, si j'avais choisi 'Je me sens incapable de réussir mon exam', ici je pourrais dire 'Mais, ce n’est qu’une impression subjective et je vais travailler dur et finalement je réussirai'. À toi de jouer.",
  explication:
"En réalité, ceci est un outil très puissant. Le cerveau est peut-être merveilleux, mais quand il est confronté à un 'MAIS', il ne prend en compte que la seconde partie de la phrase.
C'est donc un outil mental prodigieux d’efficacité pour chasser les pensées négatives."

}


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
