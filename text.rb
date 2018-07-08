IDIOMS = {
  greetings:
  "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress.
Comment te sens-tu aujourd’hui ?",
  unknown_command:
  "Désolé, je n'ai pas compris ta réponse,peux-tu m'éclairer ?",
  objectives:
  "C'est noté. Sur quel objectif voudrais-tu travailler en priorité ?",
  gestion_stress:
  "Tout d'abord, je vais te poser quelques questions pour apprendre à mieux te connaître.
Tu m'as parlé de ton stress, as-tu déjà essayé de résoudre cela ?"
}

HUMOUR = [
  {
    content_type: 'text',
    title: 'Sévèrement stréssé',
    payload: 'HIGLY_STRESSED'
  },
  {
    content_type: 'text',
    title: 'Peu stressé',
    payload: 'SOMEWHAT_STRESSED'
  },
  {
    content_type: 'text',
    title: 'Pas du tout stressé',
    payload: 'NOT_STRESSED'
  }
]

ANS_HUMOUR = {
  bad: "Ça tombe bien, je suis là pour t'aider ! Qu'est ce qui cause ton stress en ce moment ?",
  good: "Je suis ravi de l'apprendre ! Serais-tu quand-même intéressé(e) par le fait de mieux comprendre, puis potentiellement tester ma méthode ? Cela pourrait toujours te servir !",
  unknown_command: "Désolé, je n'ai pas compris ta réponse, peux-tu répéter stp ?"
  }

ANS_EFFICIENCY = {
  bad:
  "Il y a une première fois à tout ! Je suis heureux que tu sois venu me voir alors.
  Mais tout d'abord, y-a-t'il une raison pour laquelle tu n'as pas essayé de résoudre tes problèmes de stress ou anxiété ?",
  good:
  "Très bien. Dirais-tu que ça a marché ?",
  unknown_command:
  "Désolé, je n'ai pas compris ta réponse, peux-tu répéter stp ?"
}

CAUSE_STRESS = [
  {
    content_type: 'text',
    title: 'Famille',
    payload: 'FAMILLE'
  },
  {
    content_type: 'text',
    title: 'Vie sentimentale',
    payload: 'LOVE'
  },
  {
    content_type: 'text',
    title: 'Vie professionnelle',
    payload: 'WORK'
  },
  {
    content_type: 'text',
    title: 'Sport',
    payload: 'SPORT'
  },
  {
    content_type: 'text',
    title: 'Santé',
    payload: 'SANTE'
  },
  {
    content_type: 'text',
    title: 'Ne sais pas',
    payload: 'DONT_KNOW'
  }
]

AHEAD = [
  {
    content_type: 'text',
    title: 'Allons-y!',
    payload: 'GO'
  },
  {
    content_type: 'text',
    title: 'Non, merci!',
    payload: 'NO_THANKS'
  }
]

OBJECTIVES = [
  {
    content_type: 'text',
    title: 'Maîtriser mes peurs',
    payload: 'PEURS'
  },
  {
    content_type: 'text',
    title: 'Confiance en moi',
    payload: 'CONFIANCE'
  },
  {
    content_type: 'text',
    title: 'Gérer mon stress',
    payload: 'DEALING_WITH_STRESS'
  },
  {
    content_type: 'text',
    title: 'Eviter le conflit',
    payload: 'CONFLIT'
  },
  {
    content_type: 'text',
    title: 'Impulsivité',
    payload: 'IMPULSIVITE'
  },
  {
    content_type: 'text',
    title: 'Vivre au présent',
    payload: 'HAKUNA_MATATA'
  },
  {
    content_type: 'text',
    title: 'Je ne sais pas trop',
    payload: 'NE_SAIT_PAS'
  }
]

GESTION_STRESS = [
  {
    content_type: 'text',
    title: 'Oui',
    payload: 'OUI'
  },
  {
    content_type: 'text',
    title: 'Plus ou moins',
    payload: 'MORE_LESS'
  },
  {
    content_type: 'text',
    title: 'Non',
    payload: 'Non'
  },
]

ANS_RESOLUTION_STRESS = {
  oui: "Génial ! Je suis content de l'apprendre. Qu'est ce qui t'a le plus aidé selon toi ?",
  moins: "C'est un début ! Qu'est ce qui t'a le plus aidé selon toi ?",
  non: "J'en suis navré... :disappointed: Néanmoins, est-ce que tu sais pourquoi ça n'a pas marché?",
}

  RAISONS_EFFICACITE = [
    {
      content_type: 'text',
      title: "Aide extérieure",
      payload: 'EXT_HELP'
    },
    {
      content_type: 'text',
      title: "Motivation personnelle",
      payload: 'PERSONAL_MOTIV'
    },
    {
      content_type: 'text',
      title: "Les deux",
      payload: 'BOTH'
    },
    {
      content_type: 'text',
      title: "Je ne sais pas",
      payload: 'DONT_KNOW'
    },
    {
      content_type: 'text',
      title: "Passer directement à la méthode",
      payload: 'METHOD'
    }
  ]

REPONSE_TERNAIRE = [
  {
    content_type: 'text',
    title: 'Oui',
    payload: 'OUI'
  },
  {
    content_type: 'text',
    title: 'Un peu',
    payload: 'UN_PEU'
  },
  {
    content_type: 'text',
    title: 'Pas du tout',
    payload: 'PAS_DU_TOUT'
  },
]

PQ_INACTION = [
  {
    content_type: 'text',
    title: "Je n'osais pas en parler",
    payload: 'DARE'
  },
  {
    content_type: 'text',
    title: "Je ne savais pas vers qui me tourner",
    payload: 'WHO_TO_SPEAK'
  },
  {
    content_type: 'text',
    title: "Je n'en avais pas les moyens",
    payload: 'NO_MEANS'
  },
  {
    content_type: 'text',
    title: "Je ne pensais pas avoir besoin",
    payload: 'THINK'
  },
]


