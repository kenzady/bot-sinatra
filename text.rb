IDIOMS = {
  greetings:
  "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress.
Comment te sens-tu aujourd’hui ?",
  unknown_command:
  "Désolé, je n'ai pas compris ta réponse, peux-tu cliquer sur un bouton s'il te plaît ?",
  objectives:
  "C'est noté. Sur quel objectif voudrais-tu travailler en priorité ?",
  gestion_stress:
  "Tout d'abord, je vais te poser quelques questions pour apprendre à mieux te connaître.
Tu m'as parlé de ton stress, as-tu déjà essayé de résoudre cela ?",
  methode:
  "Alors passons aux choses sérieuses. Moi, ma méthode préférée pour gérer mon stress est la méthode des Thérapies Cognitivo-Comportementales (TCC).
Il s'agit d'une méthode validée scientifiquement qui va t'aider à chasser toutes tes pensées négatives et les réactions qui vont avec. Voici une liste d'articles intéressants si tu veux en savoir plus sur le sujet :",
  motive_ou_pas:
  "Es-tu toujours motivé(e) pour que l'on test cette méthode ensemble à l'aide d'exercices assez fun ?"
}

MENU_PERSISTANT =
  {
    mes_exercices: "Voici la liste des 6 dimensions de l'hexaflex ! Clique sur l'une d'elles pour voir les exercices déjà réalisés et les refaire si tu le souhaites. :)"
  }

HUMOUR = [
  {
    content_type: 'text',
    title: 'Sévèrement stréssé(e)',
    payload: 'HIGLY_STRESSED'
  },
  {
    content_type: 'text',
    title: 'Moyennement stressé(e)',
    payload: 'SOMEWHAT_STRESSED'
  },
  {
    content_type: 'text',
    title: 'Pas stressé(e)',
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
  "Très bien. Dirais-tu que ça a marché ?"
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
    title: 'Je ne sais pas',
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
  }
]

ANS_RESOLUTION_STRESS = {
  oui: "Génial ! Je suis content de l'apprendre. Qu'est ce qui t'a le plus aidé selon toi ?",
  moins: "C'est un début ! Qu'est ce qui t'a le plus aidé selon toi ?",
  non: "J'en suis navré... 😞 Néanmoins, est-ce que tu sais pourquoi ça n'a pas marché ?"
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
    title: "Aller à la méthode",
    payload: 'METHOD'
  }
]


ANS_WHY_EFFICIENCY = {
  aide_exterieure: "Très bien ! Quel type d'aide as-tu consultée ?",
  motivation_personnelle: "Bravo ! C'est grandiose que tu aies une motivation personnelle forte car cela acompte pour beaucoup dans le fait de se sentir mieux ! Je pense que nous allons travailler ensemble de façon merveilleuse si tu gardes ta motivation au beau fixe !",
  both: "Génial ! Nous allons faire du très bon travail ensemble ! J'ai hâte de voir ce que cela donne !",
  dont_know: "Aucun souci ! On ne sais pas toujours ce qui nous a aidé le plus. Mais nous allons faire un travail génial ensemble c'est certain !"
}


TYPE_AIDE_EXTERIEURE = [
    {
      content_type: 'text',
      title: "Aide professionelle",
      payload: 'PRO_HELP'
    },
    {
      content_type: 'text',
      title: "Aide de mon entourage",
      payload: 'ENTOURAGE_HELP'
    },
    {
      content_type: 'text',
      title: "Aide sur Internet",
      payload: 'INTERNET_HELP'
    },
    {
      content_type: 'text',
      title: "Je ne sais pas",
      payload: 'DONT_KNOW'
    },
    {
      content_type: 'text',
      title: "Aller à la méthode",
      payload: 'METHOD'
    }
  ]

ANS_AIDE_EXTERIEURE = {
  aide_pro: "C'est génial que tu aies pris le temps d'aller voir un spécialiste ! Cela va nous permettre de commencer sur des bases solides !",
  aide_entourage: "C'est super que tu aies des gens de confiance sur qui compter ! Et le fait que tu aies eu le courage de te livrer à eux me fait penser que nous allons pouvoir grandement avancer ensemble !",
  aide_internet: "C'est une mine d'information c'est sûr ! Je peux moi-même être considéré comme de l'aide sur Internet ! Nous allons bien travailler ensemble, j'en suis convaincu !",
  dont_know: "On a souvent du mal à savoir pourquoi les choses n'ont pas marché, c'est vrai. Mais chacun à des outils qui lui correspondent le mieux, et le tout est de continuer à chercher sa perle rare. Qui sait, ça sera peut-être moi ! :blush:"
}

RAISONS_INEFFICACITE = [
    {
      content_type: 'text',
      title: "Ne savais pas quoi faire",
      payload: 'SAVAIT_PAS'
    },
    {
      content_type: 'text',
      title: "Pas assez investi(e)",
      payload: 'NON_INVESTISSEMENT'
    },
    {
      content_type: 'text',
      title: "Ça n'a pas marché",
      payload: 'PAS_MARCHE'
    },
    {
      content_type: 'text',
      title: "Je ne sais pas",
      payload: 'DONT_KNOW'
    },
    {
      content_type: 'text',
      title: "Aller à la méthode",
      payload: 'METHOD'
    }
  ]

ANS_INEFFICIENCY = {
  savait_pas: "Je comprends, souvent les gens ont peur de se livrer, et n'osent pas aller voir un spécialiste. Mais ne t'inquiète pas, je suis la pour toi et nous allons avancer dans cette aventure tous les deux, pas à pas ! :blush:",
  non_investissement: "C'est souvent un problème, surtout quand on ne peut pas utiliser l'outil à tout instant (psychologue par exemple). C'est pour ca que je pourrais t'être très utile ! En étant tout le temps dans ta poche, je peux essayer de te garder investi ! C'est très important de rester motivé afin d'aller mieux sur le long-terme ! :blush:",
  pas_marche: "Désolé d'apprendre ça. Mais tu sais, chacun a un outil qui lui correspond le mieux, et peut-être que pour toi, je suis celui qu'il faut. Il ne faut pas perdre courage et nous allons avancer tous les deux main dans la main ! :blush:",
  dont_know: "On a souvent du mal à savoir pourquoi les choses n'ont pas marché, c'est vrai. Mais chacun à des outils qui lui correspondent le mieux, et le tout est de continuer à chercher sa perle rare. Qui sait, ça sera peut-être moi ! :blush:"
}

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
    title: "Pas osé en parler",
    payload: 'DARE'
  },
  {
    content_type: 'text',
    title: "Pas su vers qui me tourner",
    payload: 'WHO_TO_SPEAK'
  },
  {
    content_type: 'text',
    title: "Pas les moyens",
    payload: 'NO_MEANS'
  },
  {
    content_type: 'text',
    title: "Ne pensais pas avoir besoin",
    payload: 'THINK'
  },
]

METHODE_ARTICLES = [
  {
    type: 'web_url',
    url:"google.com",
    title: "Article 1"
  },
  {
    type: 'web_url',
    url:"google.com",
    title: "Article 2"
  },
  {
    type: 'web_url',
    url:"google.com",
    title: "Article "
  }
]

METHODE_MOTIVE = [
  {
    content_type: 'text',
    title: 'Oui !',
    payload: 'OUI'
  },
  {
    content_type: 'text',
    title: 'Non...',
    payload: 'NON'
  },
]

ANS_METHODE_MOTIVE = {
  oui:
    "Trop cool!",
  non:
    "Dommage... N'hésite pas à revenir vers moi si tu changes d'avis, je suis toujours là pour t'aider !"
}
