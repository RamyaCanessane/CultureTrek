//
//  TrekHistoryExamples.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 12/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import SwiftUI

extension Trek {
    
    static var liveDemoHistoryExamples: [Trek] {
        let list = parisTreks + seineSaintDenisTreks + hautDeSeineTreks
        
        return list.shuffled()
    }
}

// MARK: Paris

fileprivate let badgeQuartierLatin = Badge(
    icon: Image(systemName: "book.fill"),
    name: "Savant de la Sorbonne"
)

fileprivate let badgeMontmartre = Badge(
    icon: Image(systemName: "paintpalette.fill"),
    name: "Artiste de la Butte"
)

fileprivate let badgeLouvre = Badge(
    icon: Image(systemName: "crown.fill"),
    name: "Gardien des Joyaux"
)

fileprivate let badgeMarais = Badge(
    icon: Image(systemName: "building.columns.fill"),
    name: "Seigneur du Marais"
)

fileprivate let parisTreks: [Trek] = [
    trekQuartierLatin,
    trekMontmartre,
    trekMarais,
    trekLouvreTuileries
]

fileprivate let trekQuartierLatin = Trek(
    accessibility: Trek.Accessibility(
        bike: false,
        stroller: true,
        walking: true,
        wheelchair: true
    ),
    badgesToUnlock: [badgeQuartierLatin],
    city: "Paris",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 12),
        duration: .seconds(1 * 3600 + 35 * 60),
        earnedPoints: 480,
        photos: [],
        unlockedBadges: [badgeQuartierLatin]
    ),
    department: nil,
    distance: Measurement(value: 3.2, unit: .kilometers),
    duration: .seconds(1 * 3600 + 45 * 60),
    elevation: .low,
    goal: "Découvrir l'histoire antique et intellectuelle du cœur historique de la capitale.",
    goodToKnow: [
        "Prévoir des chaussures confortables pour les pavés.",
        "Accès libre et gratuit aux Arènes de Lutèce."
    ],
    isLiked: true,
    name: "Mystères du Quartier Latin",
    picture: Image(.mystèresDuQuartierLatin), //"Mystères du Quartier Latin"
    riddles: [
        Riddle(
            clue: "La station se situe sur la ligne 7, dans le 5e arrondissement.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8402, longitude: 2.3518),
            goodToKnow: "Station ouverte en 1930.",
            isCompleted: true,
            order: 1,
            picture: Image(systemName: "tram.fill"),
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Recherche le nom d'une station de métro dont la somme des lettres est égale au numéro de département de la Savoie (73). Le rendez-vous sera à l'extérieur de cette station de métro.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Cherche un amphithéâtre gallo-romain caché derrière la rue Monge.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8431, longitude: 2.3529),
            goodToKnow: "Lieu de combats de gladiateurs au Ier siècle.",
            isCompleted: true,
            order: 2,
            picture: Image(systemName: "figure.walk"),
            photos: [],
            summary: "Pénètre dans cet amphi théâtral antique où s'installaient 17 000 spectateurs. Trouve la tête de lion sculptée pour continuer.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Dirige-toi vers le dôme imposant qui domine la montagne Sainte-Geneviève.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8462, longitude: 2.3464),
            goodToKnow: "Devise inscrite : 'Aux grands hommes, la patrie reconnaissante'.",
            isCompleted: true,
            order: 3,
            picture: Image(systemName: "star.fill"),
            photos: [],
            summary: "Avance vers ce temple républicain. Compte les colonnes de la façade principale pour débloquer l'étape suivante.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Descends vers la place de la célèbre université fondée au XIIIe siècle.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8485, longitude: 2.3431),
            goodToKnow: "Fondée par Robert de Sorbon en 1253.",
            isCompleted: false,
            order: 4,
            picture: Image(systemName: "book.closed.fill"),
            photos: [],
            summary: "Laisse le dôme derrière toi et rejoins la place où étudiaient les savants en latin. La statue du philosophe assis te fera face.",
            validationPoints: 90
        ),
        Riddle(
            clue: "Rejoins les vestiges des bains romains intégrés au musée médiéval.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8503, longitude: 2.3444),
            goodToKnow: "Les thermes gallo-romains datent de la fin du IIe siècle.",
            isCompleted: false,
            order: 5,
            picture: Image(systemName: "shield.fill"),
            photos: [],
            summary: "Observe les magnifiques arcades gallo-romaines antiques avant de te diriger vers l'entrée du musée.",
            validationPoints: 90
        ),
        Riddle(
            clue: "Termine la balade devant le bassin central du jardin du Sénat.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8462, longitude: 2.3372),
            goodToKnow: "Jardin créé à la demande de Marie de Médicis en 1612.",
            isCompleted: false,
            order: 6,
            picture: Image(systemName: "leaf.fill"),
            photos: [],
            summary: "Franchis les grilles forgées de ce jardin royal et rejoins le grand bassin circulaire.",
            validationPoints: 100
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Napoléon Bonaparte"),
                .good("Victor Hugo"),
                .bad("Louis XIV")
            ],
            badAnswerExplanation: "Napoléon repose aux Invalides et Louis XIV à la basilique Saint-Denis.",
            goodAnswerFact: "Victor Hugo fut le premier grand homme inhumé au Panthéon sous la IIIe République en 1885.",
            order: 1,
            question: "Qui fut la première personnalité inhumée au Panthéon après sa conversion laïque ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Les Arènes de Lutèce"),
                .bad("Le Colisée de Paris"),
                .bad("Le Circus Maximus")
            ],
            badAnswerExplanation: "Le Colisée se trouve à Rome et le Circus Maximus était un hippodrome.",
            goodAnswerFact: "Les Arènes de Lutèce pouvaient accueillir jusqu'à 17 000 spectateurs sous l'Empire romain.",
            order: 2,
            question: "Quel est le plus ancien vestige gallo-romain à ciel ouvert visible dans le quartier ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("1515"),
                .bad("1789"),
                .good("1253")
            ],
            badAnswerExplanation: "1515 correspond à la bataille de Marignan et 1789 à la Révolution française.",
            goodAnswerFact: "La Sorbonne a été fondée en 1253 par Robert de Sorbon pour les étudiants démunis.",
            order: 3,
            question: "En quelle année le collège de la Sorbonne a-t-il été fondé ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("La Tapisserie de Bayeux"),
                .good("La Dame à la Licorne"),
                .bad("La Joconde")
            ],
            badAnswerExplanation: "La Tapisserie de Bayeux est en Normandie et La Joconde est au musée du Louvre.",
            goodAnswerFact: "La célèbre tenture de La Dame à la Licorne est le chef-d'œuvre réservé du musée de Cluny.",
            order: 4,
            question: "Quelle tenture médiévale célèbre est conservée au musée de Cluny ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Découvrez les trésors cachés du Quartier Latin, des arènes antiques aux ruelles mythiques de la Sorbonne."
)

fileprivate let trekMontmartre = Trek(
    accessibility: Trek.Accessibility(
        bike: false,
        stroller: false,
        walking: true,
        wheelchair: false
    ),
    badgesToUnlock: [badgeMontmartre],
    city: "Paris",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 30),
        duration: .seconds(2 * 3600 + 0 * 60),
        earnedPoints: 390,
        photos: [],
        unlockedBadges: [badgeMontmartre]
    ),
    department: nil,
    distance: Measurement(value: 2.8, unit: .kilometers),
    duration: .seconds(2 * 3600 + 15 * 60),
    elevation: .high,
    goal: "Arpenter les escaliers mythiques et découvrir la bohème artistique montmartroise.",
    goodToKnow: [
        "Parcours comportant de nombreuses marches et escaliers.",
        "Très fréquenté en fin d'après-midi."
    ],
    isLiked: false,
    name: "Les Secrets de Montmartre",
    picture: Image(.lesSecretsDeMontmartre), // Les Secrets de Montmartre
    riddles: [
        Riddle(
            clue: "Station de la ligne 12 célèbre pour son édicule Guimard.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8844, longitude: 2.3386),
            goodToKnow: "L'une des stations les plus profondes du réseau métropolitain.",
            isCompleted: true,
            order: 1,
            picture: Image(systemName: "m.circle.fill"),
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Recherche le nom d'une station de métro dont le total des chiffres représentant les lettres sera égal à 3 fois le numéro de département de la Dordogne (24). Le rendez-vous sera à l'extérieur de cette station de métro.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Recherche le square Jehan-Rictus au sortir de la station.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8848, longitude: 2.3383),
            goodToKnow: "Composé de 612 carreaux de lava émaillée.",
            isCompleted: true,
            order: 2,
            picture: Image(systemName: "heart.fill"),
            photos: [],
            summary: "Entre dans ce square ombragé. Trouve le mur bleu émaillé où la plus belle déclaration d'amour est inscrite 311 fois en 250 langues.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Grimpe la rue de la Mironton vers la place des peintres.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8865, longitude: 2.3408),
            goodToKnow: "Ancienne place centrale du village de Montmartre.",
            isCompleted: true,
            order: 3,
            picture: Image(systemName: "paintbrush.fill"),
            photos: [],
            summary: "Atteins cette place animée. Observe les portraitistes à l'œuvre pour repérer la ruelle menant au dôme.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Rejoins le sommet de la butte devant le monument blanc en travertin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8867, longitude: 2.3431),
            goodToKnow: "Consacré en 1919.",
            isCompleted: false,
            order: 4,
            picture: Image(systemName: "cross.fill"),
            photos: [],
            summary: "Hisse-toi au sommet de la Butte devant cet édifice d'une blancheur éclatante. Admire le panorama d'exception sur Paris.",
            validationPoints: 90
        ),
        Riddle(
            clue: "Redescends par le versant nord vers le coin de la rue Saint-Vincent.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8881, longitude: 2.3396),
            goodToKnow: "Vendanges célébrées chaque année au mois d'octobre.",
            isCompleted: false,
            order: 5,
            picture: Image(systemName: "wineglass.fill"),
            photos: [],
            summary: "Poursuis ta descente vers ce clos viticole préservé au cœur du quartier.",
            validationPoints: 90
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .good("Le château-Landon (travertin)"),
                .bad("Le marbre de Carrare"),
                .bad("Le granite breton")
            ],
            badAnswerExplanation: "La pierre de travertin réagit à la pluie en sécrétant du calcaire qui auto-nettoie l'édifice.",
            goodAnswerFact: "La pierre de château-Landon (travertin) blanchit avec le temps et l'eau de pluie.",
            order: 1,
            question: "Grâce à quel matériau la basilique du Sacré-Cœur conserve-t-elle sa blancheur éclatante ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Le Clos des Tuileries"),
                .good("Le Clos Montmartre"),
                .bad("Le Domaine de Belleville")
            ],
            badAnswerExplanation: "Le Clos Montmartre est le véritable nom des vignes historiques de la Butte.",
            goodAnswerFact: "Le Clos Montmartre compte environ 2 000 pieds de vigne plantés en 1933.",
            order: 2,
            question: "Quel est le nom exact du vignoble niché sur le flanc nord de Montmartre ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Le Moulin Rouge"),
                .bad("Le Chat Noir"),
                .good("Le Bateau-Lavoir")
            ],
            badAnswerExplanation: "Le Moulin Rouge et Le Chat Noir étaient des cabarets.",
            goodAnswerFact: "C'est au Bateau-Lavoir que Picasso a peint 'Les Demoiselles d'Avignon' en 1907.",
            order: 3,
            question: "Dans quelle célèbre cité d'artistes de la place Émile-Goudeau Picasso avait-il son atelier ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Une traversée pittoresque de la Butte Montmartre entre ruelles pavées, cabarets légendaires et vignes cachées."
)

fileprivate let trekLouvreTuileries = Trek(
    accessibility: Trek.Accessibility(
        bike: true,
        stroller: true,
        walking: true,
        wheelchair: true
    ),
    badgesToUnlock: [badgeLouvre],
    city: "Paris",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 30),
        duration: .seconds(2 * 3600 + 10 * 60),
        earnedPoints: 560,
        photos: [],
        unlockedBadges: [badgeLouvre]
    ),
    department: nil,
    distance: Measurement(value: 4.1, unit: .kilometers),
    duration: .seconds(2 * 3600 + 30 * 60),
    elevation: .low,
    goal: "Suivre la voie royale traversant les plus beaux jardins et monuments de la rive droite.",
    goodToKnow: [
        "Parcours entièrement plat et accessible à tous.",
        "Nombreux bancs et points d'eau disponibles."
    ],
    isLiked: true,
    name: "L'Axe Historique du Louvre aux Tuileries",
    picture: Image(.lAxeHistoriqueDuLouvreAuxTuileries), // L'Axe Historique du Louvre aux Tuileries
    riddles: [
        Riddle(
            clue: "Station de la ligne 12 au bord du boulevard Saint-Germain.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8556, longitude: 2.3255),
            goodToKnow: "Inaugurée en 1910.",
            isCompleted: true,
            order: 1,
            picture: Image(systemName: "tram.fill"),
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Recherche le nom d'une station de métro dont le total des chiffres représentant les lettres sera égal au numéro de département de Paris (75). Le rendez-vous sera à l'extérieur de cette station de métro.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Franchis la Seine en empruntant le pont en pierre de Louis XIV.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8601, longitude: 2.3292),
            goodToKnow: "Achevée en 1689.",
            isCompleted: true,
            order: 2,
            picture: Image(systemName: "map.fill"),
            photos: [],
            summary: "Traverse le fleuve sur le Pont Royal en direction de l'imposant palais royal du Louvre.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Pénètre dans la plus ancienne cour de la Renaissance du palais.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            goodToKnow: "Cour carrée édifiée du XVIe au XVIIe siècle.",
            isCompleted: true,
            order: 3,
            picture: Image(systemName: "building.2.fill"),
            photos: [],
            summary: "Entre au centre de la Cour Carrée et repère les monogrammes royaux sculptés dans la pierre.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Avance vers la grande pyramide en verre de Pei.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8610, longitude: 2.3358),
            goodToKnow: "Inaugurée en 1989.",
            isCompleted: true,
            order: 4,
            picture: Image(systemName: "triangle.fill"),
            photos: [],
            summary: "Contemple la Pyramide de verre. Contourne ses bassins pour te diriger vers l'Arc du Carrousel.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Avance sous les grands arbres du jardin d'André Le Nôtre.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8635, longitude: 2.3275),
            goodToKnow: "Créé à l'origine pour la reine Catherine de Médicis.",
            isCompleted: false,
            order: 5,
            picture: Image(systemName: "tree.fill"),
            photos: [],
            summary: "Pénètre dans la grande allée centrale du jardin des Tuileries et poursuis jusqu'au grand bassin octogonal.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Sors du jardin vers l'immense place octogonale au monolithe égyptien.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8656, longitude: 2.3212),
            goodToKnow: "L'Obélisque provient du temple de Louxor.",
            isCompleted: false,
            order: 6,
            picture: Image(systemName: "sun.max.fill"),
            photos: [],
            summary: "Gagne la Place de la Concorde où s'élève l'Obélisque doré offert à la France par l'Égypte.",
            validationPoints: 90
        ),
        Riddle(
            clue: "Finis la balade devant la grande nef vitrée construite pour l'exposition de 1900.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8661, longitude: 2.3145),
            goodToKnow: "Édifice majestueux de la Belle Époque.",
            isCompleted: false,
            order: 7,
            picture: Image(systemName: "sparkles"),
            photos: [],
            summary: "Termine ce parcours grandiose en observant les coupoles de verre du Grand et du Petit Palais.",
            validationPoints: 100
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("666"),
                .good("673"),
                .bad("1000")
            ],
            badAnswerExplanation: "La valeur de 666 est un mythe populaire relayé par la fiction.",
            goodAnswerFact: "La pyramide comprend exactement 673 éléments vitrés (603 losanges et 70 triangles).",
            order: 1,
            question: "Combien de losanges et triangles en verre constituent la pyramide du Louvre ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Le temple de Louxor"),
                .bad("La pyramide de Khéops"),
                .bad("Le temple d'Abou Simbel")
            ],
            badAnswerExplanation: "L'obélisque provient spécifiquement de l'entrée du temple de Louxor.",
            goodAnswerFact: "Offert par Méhémet Ali, l'obélisque de Louxor est érigé à Paris depuis 1836.",
            order: 2,
            question: "De quel temple d'Égypte provient l'Obélisque de la place de la Concorde ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Baron Haussmann"),
                .bad("Jules Hardouin-Mansart"),
                .good("André Le Nôtre")
            ],
            badAnswerExplanation: "Haussmann était urbaniste du Second Empire et Mansart architecte royal.",
            goodAnswerFact: "André Le Nôtre rejeta la perspective classique et redessina le jardin en 1664.",
            order: 3,
            question: "Quel célèbre jardinier du roi Louis XIV a réaménagé le Jardin des Tuileries ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("François Ier"),
                .good("Louis XIV"),
                .bad("Henri IV")
            ],
            badAnswerExplanation: "Louis XIV finança l'ouvrage de 1685 à 1689.",
            goodAnswerFact: "Le Pont Royal est le troisième plus ancien pont franchissant la Seine à Paris.",
            order: 4,
            question: "Quel roi de France a entièrement financé la construction du Pont Royal ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("La victoire de Waterloo"),
                .good("La victoire d'Austerlitz"),
                .bad("La prise de la Bastille")
            ],
            badAnswerExplanation: "L'arc du Carrousel célèbre la campagne militaire napoléonienne de 1805.",
            goodAnswerFact: "Érigé entre 1806 et 1808, l'arc du Carrousel célèbre la victoire d'Austerlitz.",
            order: 5,
            question: "Quelle victoire de la Grande Armée napoléonienne l'Arc de Triomphe du Carrousel honore-t-il ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Une traversée monumentale le long de l'Axe Historique royal, du Louvre jusqu'aux Champs-Élysées."
)

fileprivate let trekMarais = Trek(
    accessibility: Trek.Accessibility(
        bike: true,
        stroller: true,
        walking: true,
        wheelchair: true
    ),
    badgesToUnlock: [badgeMarais],
    city: "Paris",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 8, day: 14),
        duration: .seconds(1 * 3600 + 50 * 60),
        earnedPoints: 420,
        photos: [],
        unlockedBadges: [badgeMarais]
    ),
    department: nil,
    distance: Measurement(value: 3.6, unit: .kilometers),
    duration: .seconds(2 * 3600 + 0 * 60),
    elevation: .medium,
    goal: "S'immerger dans le Paris aristocratique du XVIIe siècle et ses hôtels particuliers d'exception.",
    goodToKnow: [
        "Idéal le dimanche pour profiter des rues piétonnisées.",
        "Nombreuses cours d'hôtels particuliers en accès libre."
    ],
    isLiked: true,
    name: "Flânerie Médiévale dans le Marais",
    picture: Image(.flânerieMédiévaleDansLeMarais), // Flânerie Médiévale dans le Marais
    riddles: [
        Riddle(
            clue: "Station de la ligne 9 située à l'ouest du Palais de Chaillot.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8648, longitude: 2.2939),
            goodToKnow: "Décorée sur le thème de la bataille d'Iéna.",
            isCompleted: true,
            order: 1,
            picture: Image(systemName: "tram.fill"),
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Recherche le nom d'une station de métro dont la somme des lettres vaut exactement 1 fois le numéro de département du Finistère (29). Le rendez-vous sera à l'extérieur de cette station de métro.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Pénètre dans la cour de cet hôtel particulier monumental de la rue Saint-Antoine.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8548, longitude: 2.3639),
            goodToKnow: "Chef-d'œuvre de style Louis XIII achevé en 1630.",
            isCompleted: true,
            order: 2,
            picture: Image(systemName: "house.fill"),
            photos: [],
            summary: "Pénètre sous le portail voûté de cet hôtel particulier. Traverse ses deux cours pour déboucher sur le jardin.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Passe sous la voûte menant à la plus ancienne place royale de Paris.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8556, longitude: 2.3655),
            goodToKnow: "Inaugurée en 1612.",
            isCompleted: false,
            order: 3,
            picture: Image(systemName: "square.split.diagonal.2x2.fill"),
            photos: [],
            summary: "Franchis le passage et débouche sur cette place carrée bordée de 36 pavillons de brique et de pierre.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Rejoins le pavillon situé au numéro 6 de la place.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8549, longitude: 2.3663),
            goodToKnow: "Lieu de résidence de l'écrivain de 1832 à 1848.",
            isCompleted: false,
            order: 4,
            picture: Image(systemName: "text.quote"),
            photos: [],
            summary: "Rends-toi au coin sud-est devant l'immeuble où l'auteur des Misérables a résidé pendant seize ans.",
            validationPoints: 90
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Place des Tuileries"),
                .good("Place Royale"),
                .bad("Place de la Bastille")
            ],
            badAnswerExplanation: "Elle portait le nom de Place Royale lors de son inauguration par Louis XIII.",
            goodAnswerFact: "Nommée Place Royale en 1612, elle prend le nom de Place des Vosges en 1800.",
            order: 1,
            question: "Quel était le nom d'origine de la Place des Vosges lors de son inauguration ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Style Gothique"),
                .good("Style Louis XIII"),
                .bad("Style Art Déco")
            ],
            badAnswerExplanation: "Il s'agit du style classique Louis XIII mêlant brique rouge et pierre de taille.",
            goodAnswerFact: "Conçu par Jean Androuet du Cerceau, l'Hôtel de Sully est un modèle du style Louis XIII.",
            order: 2,
            question: "Quel style architectural caractérise le superbe Hôtel de Sully ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("5 ans"),
                .good("16 ans"),
                .bad("30 ans")
            ],
            badAnswerExplanation: "Victor Hugo y fut locataire de 1832 à 1848.",
            goodAnswerFact: "C'est dans cet appartement du deuxième étage que Victor Hugo rédigea la majorité des Misérables.",
            order: 3,
            question: "Pendant combien d'années Victor Hugo a-t-il habité sur la Place des Vosges ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Des maréchaux de France"),
                .good("Du monastère Saint-Paul (XIVe siècle)"),
                .bad("Des écuries napoléoniennes")
            ],
            badAnswerExplanation: "Le quartier s'est étendu sur le terrain de l'ancien monastère royal Saint-Paul.",
            goodAnswerFact: "Le Village Saint-Paul abrite un réseau de cours intérieures pavées restaurées.",
            order: 4,
            question: "De quel ensemble médiéval le Village Saint-Paul tire-t-il ses ruelles et cours intérieures ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Une promenade enchanteresse au cœur du Marais, entre hôtels particuliers aristocratiques et cours cachées."
)

// MARK: Seine-Saint-Denis

fileprivate let seineSaintDenisTreks = [
    trekOurcq,
    trekSaintOuen,
    trekMontreuil,
    trekRoisAthletes
]

fileprivate let trekRoisAthletes = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "crown.fill"), name: "Nécropole Royale"),
        Badge(icon: Image(systemName: "sportscourt.fill"), name: "Ferveur Olympique")
    ],
    city: "Saint-Denis",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 12),
        duration: .seconds(1 * 3600 + 45 * 60),
        earnedPoints: 450,
        photos: [],
        unlockedBadges: [Badge(icon: Image(systemName: "crown.fill"), name: "Nécropole Royale")]
    ),
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 4.2, unit: .kilometers),
    duration: .seconds(2 * 3600 + 0 * 60),
    elevation: .low,
    goal: "Parcourir l'histoire royale et moderne de la cité dionysienne.",
    goodToKnow: ["Prévoir des chaussures confortables", "Accès facile en Métro 13"],
    isLiked: true,
    name: "Des Rois aux Athlètes",
    picture: Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: "https://images.unsplash.com/photo-1549144511-f099e773c147")!))!),
    riddles: [
        Riddle(
            clue: "Recherche la station 'Basilique de Saint-Denis' sur la ligne 13.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9361, longitude: 2.3597),
            goodToKnow: "Proche de l'Hôtel de Ville.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Recherche le nom d'une station de métro dont le total des chiffres représentant les lettres sera égal à 5 fois le numéro de département du Finistère (29). Le rendez-vous sera à l'extérieur de cette station.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Regarde vers les vitraux du transept nord.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9364, longitude: 2.3598),
            goodToKnow: "La basilique est le premier chef-d'œuvre de l'art gothique.",
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Dirige-toi vers le monument qui abrite le repos ultime des rois de France et trouve l'entrée sous la grande rose gothique.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Avance le long du parc du Légion d'Honneur.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9345, longitude: 2.3610),
            goodToKnow: "Ancien monastère transformé par Napoléon Ier.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Longe les murs de l'établissement où la valeur militaire et civile est instruite aux filles des décorés de la Nation.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Suis le cours d'eau en direction du sud.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9300, longitude: 2.3580),
            goodToKnow: "Inauguré en 1821.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Laisse l'histoire derrière toi et longe le canal où les embarcations de marchandises cédaient autrefois la place aux promenades.",
            validationPoints: 40
        ),
        Riddle(
            clue: "L'arène géante se dresse devant toi.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9244, longitude: 2.3602),
            goodToKnow: "Construit pour la Coupe du Monde 1998.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Cherche la structure colossale dont la toiture suspendue évoque une soucoupe volante posée près de l'autoroute.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Traverse la passerelle olympique.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9230, longitude: 2.3560),
            goodToKnow: "Connecte le Stade au Centre Aquatique.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Franchis l'ouvrage d'art en bois reliant le géant du football au nouveau temple de la natation.",
            validationPoints: 80
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Louis XIV"),
                .good("Dagobert Ier"),
                .bad("François Ier")
            ],
            badAnswerExplanation: "Louis XIV est enterré ici, mais Dagobert fut le premier monarque inhumé dans l'abbaye.",
            goodAnswerFact: "Roi des Francs au VIIe siècle, Dagobert Ier a choisi la Basilique comme lieu de sépulture.",
            order: 1,
            question: "Quel roi de France fut le premier à se faire enterrer dans la Basilique de Saint-Denis ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Suger"),
                .bad("Richelieu"),
                .bad("Mazarin")
            ],
            badAnswerExplanation: "Richelieu et Mazarin ont vécu bien plus tard.",
            goodAnswerFact: "L'abbé Suger a reconstruit des parties de l'église abbatiale en utilisant de nouvelles techniques architecturales gothiques.",
            order: 2,
            question: "Quel abbé est considéré comme le père bâtisseur de l'art gothique à Saint-Denis ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("1980"),
                .bad("2006"),
                .good("1998")
            ],
            badAnswerExplanation: "Le Stade a été inauguré juste avant la Coupe du Monde de Football 1998.",
            goodAnswerFact: "Inauguré le 28 janvier 1998 lors du match de football France-Espagne.",
            order: 3,
            question: "En quelle année le Stade de France a-t-il été inauguré ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("La Seine"),
                .good("La Marne"),
                .bad("L'Oise")
            ],
            badAnswerExplanation: "Le canal reliant le canal de l'Ourcq à la Seine.",
            goodAnswerFact: "Le canal Saint-Denis relie le bassin de la Villette à la Seine.",
            order: 4,
            question: "Le canal Saint-Denis prend sa source au Bassin de la Villette et rejoint quel fleuve ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Découvrez Saint-Denis, de la nécropole des rois de France jusqu'au mythique Stade de France."
)

fileprivate let trekOurcq = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "paintpalette.fill"), name: "Explorateur Street-Art")
    ],
    city: "Pantin",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 3),
        duration: .seconds(1 * 3600 + 10 * 60),
        earnedPoints: 280,
        photos: [],
        unlockedBadges: []
    ),
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 3.1, unit: .kilometers),
    duration: .seconds(1 * 3600 + 30 * 60),
    elevation: .low,
    goal: "Découvrir la métamorphose culturelle des bords du Canal de l'Ourcq.",
    goodToKnow: ["Idéal à vélo ou à pied", "Nombreux cafés le long du canal"],
    isLiked: false,
    name: "L'Art au Fil de l'Ourcq",
    picture: Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34")!))!),
    riddles: [
        Riddle(
            clue: "Station Hoche ou Église de Pantin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8897, longitude: 2.4035),
            goodToKnow: "Ligne 5 du métro.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Rends-toi là où la ligne 5 s'arrête devant une église au clocher carré. Le départ se fait sur la place piétonne adjacente.",
            validationPoints: 40
        ),
        Riddle(
            clue: "L'ancien bâtiment des douanes reconverti.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8930, longitude: 2.4042),
            goodToKnow: "Aujourd'hui hub créatif d'BETC.",
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Avance vers le canal et repère le vaste édifice en béton armé autrefois dédié au stockage des marchandises industrielles.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Bâtiment à l'architecture brutaliste le long de l'eau.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8961, longitude: 2.3995),
            goodToKnow: "Centre National de la Danse.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Recherche la structure imposante où le rythme et les pas des danseurs résonnent au-dessus de l'eau.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Regarde les fresques sous le pont.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8975, longitude: 2.3920),
            goodToKnow: "Galerie d'art urbain à ciel ouvert.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Passe sous l'ouvrage routier pour découvrir les figures colorées peintes à même le béton.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Ancienne usine réhabilitée en lieu culturel.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8988, longitude: 2.3880),
            goodToKnow: "La Cité Fertile.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Franchis les grilles d'un ancien site ferroviaire reconverti en tiers-lieu écoresponsable et végétalisé.",
            validationPoints: 60
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Stockage de blé"),
                .good("Magasins Généraux"),
                .bad("Gare routière")
            ],
            badAnswerExplanation: "Il s'agissait des Magasins Généraux de la douane.",
            goodAnswerFact: "Les Magasins Généraux servaient au stockage du grain, du sucre et des alcools importés à Paris.",
            order: 1,
            question: "Comment s'appelle le grand bâtiment industriel réhabilité le long du canal à Pantin ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Le CND (Centre National de la Danse)"),
                .bad("L'Opéra de Pantin"),
                .bad("La Philharmonie de l'Est")
            ],
            badAnswerExplanation: "C'est l'institution nationale consacrée à la danse.",
            goodAnswerFact: "Le CND est installé dans l'ancien centre administratif de Pantin depuis 2004.",
            order: 2,
            question: "Quelle institution culturelle occupe l'édifice brutaliste du quai de la Seine ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Canal Saint-Martin"),
                .bad("Canal de Denis"),
                .good("Canal de l'Ourcq")
            ],
            badAnswerExplanation: "Le Canal de l'Ourcq traverse la commune de Pantin.",
            goodAnswerFact: "Le Canal de l'Ourcq mesure 108 km de long et se termine au bassin de la Villette.",
            order: 3,
            question: "Quel cours d'eau artificiel borde le parcours de ce jeu de piste ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Une traversée urbaine et contemporaine à Pantin, entre street-art, architecture et canaux."
)

fileprivate let trekMontreuil = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: false, walking: true, wheelchair: false),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "leaf.fill"), name: "Arboriculteur de Montreuil"),
        Badge(icon: Image(systemName: "film.fill"), name: "Pionnier du Cinéma")
    ],
    city: "Montreuil",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 30),
        duration: .seconds(2 * 3600 + 15 * 60),
        earnedPoints: 520,
        photos: [],
        unlockedBadges: [
            Badge(icon: Image(systemName: "leaf.fill"), name: "Arboriculteur de Montreuil")
        ]
    ),
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 5.0, unit: .kilometers),
    duration: .seconds(2 * 3600 + 30 * 60),
    elevation: .medium,
    goal: "Parcourir le patrimoine horticole unique et l'histoire du 7ème art à Montreuil.",
    goodToKnow: ["Dénivelé moyen", "Secteur préservé des Murs à pêches"],
    isLiked: true,
    name: "Les Secret des Murs à Pêches",
    picture: Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: "https://images.unsplash.com/photo-1500382017468-9049fed747ef")!))!),
    riddles: [
        Riddle(
            clue: "Place du Général de Gaulle / Mairie de Montreuil.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8624, longitude: 2.4411),
            goodToKnow: "Terminus de la ligne 9 du métro.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Retrouve le terminus de la ligne 9 dont le nom est l'homonyme du siège du gouvernement local de Montreuil.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Derrière la mairie, le parc contemporain.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8640, longitude: 2.4430),
            goodToKnow: "Le Parc Jean-Moulin / Les Guillands.",
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Monte la ruelle étroite pour atteindre un havre de verdure offrant une vue panoramique sur Paris.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Quartier Saint-Antoine.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8670, longitude: 2.4550),
            goodToKnow: "Des murs en plâtre retenant la chaleur du soleil.",
            isCompleted: true,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Serpente entre ces mystérieux murs plâtrés qui protégeaient jadis les arbres fruitiers du froid de l'hiver.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Anciens studios de Georges Méliès.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8610, longitude: 2.4480),
            goodToKnow: "Lieu de naissance du cinéma à effets spéciaux.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Cherche la plaque commémorative marquant l'emplacement où le magicien du cinéma a tourné son 'Voyage dans la Lune'.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Parc Montreau et son château.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8655, longitude: 2.4630),
            goodToKnow: "Contient le Musée de l'Histoire Vivante.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Pénètre dans ce parc historique et dirige-toi vers la demeure du XIXe siècle abritant la mémoire des luttes sociales.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Place de la Fraternité.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8570, longitude: 2.4350),
            goodToKnow: "Quartier animé du Bas-Montreuil.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Redescends vers les ateliers d'artistes du Bas-Montreuil pour trouver la place au nom d'une valeur républicaine fraternelle.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Théâtre Public de Montreuil.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8618, longitude: 2.4419),
            goodToKnow: "Centre Dramatique National.",
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Termine la boucle sur la place du marché, au pied du bâtiment moderne dédié aux arts de la scène.",
            validationPoints: 60
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Les pommes"),
                .good("Les pêches"),
                .bad("Les cerises")
            ],
            badAnswerExplanation: "Montreuil était célèbre pour sa production de pêches fournies à la cour du Roi Soleil.",
            goodAnswerFact: "Grâce aux murs en plâtre chauffés par le soleil, Montreuil produisait jusqu'à 17 millions de pêches par an.",
            order: 1,
            question: "Quel fruit a fait la renommée internationale de Montreuil dès le XVIIe siècle ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Les Frères Lumière"),
                .bad("Charles Pathé"),
                .good("Georges Méliès")
            ],
            badAnswerExplanation: "C'est bien Georges Méliès qui a construit le premier studio de cinéma en verre à Montreuil.",
            goodAnswerFact: "Méliès a tourné plus de 500 films à Montreuil entre 1897 et 1912.",
            order: 2,
            question: "Quel célèbre cinéaste inventeur des effets spéciaux installa ses studios à Montreuil ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Le plâtre (gypse)"),
                .bad("Le granit"),
                .bad("La brique rouge")
            ],
            badAnswerExplanation: "Le sol de Montreuil était très riche en gypse, utilisé pour fabriquer le plâtre.",
            goodAnswerFact: "Le gypse extrait localement permettait d'enduire les murs pour emmagasiner la chaleur.",
            order: 3,
            question: "Quel matériau local composait le revêtement des célèbres murs horticoles ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Musée Grévin"),
                .good("Musée de l'Histoire Vivante"),
                .bad("Musée d'Art Moderne")
            ],
            badAnswerExplanation: "Il s'agit du Musée de l'Histoire Vivante, fondé en 1939.",
            goodAnswerFact: "Ce musée retrace l'histoire des mouvements sociaux et ouvriers en France.",
            order: 4,
            question: "Quel musée est situé au cœur du Parc Montreau ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Ligne 1"),
                .bad("Ligne 3"),
                .good("Ligne 9")
            ],
            badAnswerExplanation: "C'est la ligne 9 qui dessert Montreuil.",
            goodAnswerFact: "Mairie de Montreuil est le terminus de la ligne 9 depuis 1937.",
            order: 5,
            question: "Quelle ligne du métro parisien vous mène au centre de Montreuil ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Explorez Montreuil à travers son passé fruitier, le cinéma de Georges Méliès et sa communauté d'artistes."
)

fileprivate let trekSaintOuen = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "clock.arrow.circlepath"), name: "Chasseur de Trésors")
    ],
    city: "Saint-Ouen-sur-Seine",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 8, day: 6),
        duration: .seconds(1 * 3600 + 30 * 60),
        earnedPoints: 310,
        photos: [],
        unlockedBadges: [
            Badge(icon: Image(systemName: "clock.arrow.circlepath"), name: "Chasseur de Trésors")
        ]
    ),
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 2.8, unit: .kilometers),
    duration: .seconds(1 * 3600 + 45 * 60),
    elevation: .low,
    goal: "Parcourir le plus grand marché d'antiquités au monde.",
    goodToKnow: ["Marché ouvert du samedi au lundi", "Attention à la foule le week-end"],
    isLiked: true,
    name: "L'Énigme des Puces",
    picture: Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: "https://images.unsplash.com/photo-1513151233558-d860c5398176")!))!),
    riddles: [
        Riddle(
            clue: "Station Porte de Clignancourt.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8990, longitude: 2.3448),
            goodToKnow: "Ligne 4.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Trouve la station située sur la ligne 4 dont le nom associe une 'Porte' parisienne au nom du martyr chrétien Clignancourt. Rendez-vous au boulevard extérieur.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Entrée du Marché Vernaison.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9025, longitude: 2.3420),
            goodToKnow: "Le plus ancien marché des Puces.",
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "S'engouffre dans le dédale du plus ancien marché couvert où les objets du passé s'entassent sous les tonnelles végétales.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Marché Paul Bert Serpette.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9040, longitude: 2.3435),
            goodToKnow: "Temple du design et du luxe ancien.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Rejoins les allées où les antiquaires de renom exposent le mobilier du XXe siècle et les pièces de collection.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Château de Saint-Ouen et grand parc des Docks.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9110, longitude: 2.3330),
            goodToKnow: "Château construit sous Louis XVIII.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Quitte la brocante et marche vers la Seine pour découvrir la résidence restaurée offerte par le roi Louis XVIII à la comtesse du Cayla.",
            validationPoints: 70
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .good("1885"),
                .bad("1945"),
                .bad("1968")
            ],
            badAnswerExplanation: "C'est à la fin du XIXe siècle (1885) que le marché a été officiellement reconnu.",
            goodAnswerFact: "L'installation des chineurs et crocheteurs a été officialisée par arrêté municipal en 1885.",
            order: 1,
            question: "En quelle année environ le Marché aux Puces de Saint-Ouen a-t-il été officiellement reconnu ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Marché Biron"),
                .bad("Marché Malik"),
                .good("Marché Vernaison")
            ],
            badAnswerExplanation: "Le marché Vernaison est considéré comme le berceau historique des Puces.",
            goodAnswerFact: "Romain Vernaison y installe les premières baraques en bois sur son terrain en 1920.",
            order: 2,
            question: "Quel est le plus ancien marché structuré des Puces de Saint-Ouen ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Louis XIV"),
                .good("Louis XVIII"),
                .bad("Napoléon III")
            ],
            badAnswerExplanation: "C'est Louis XVIII qui ordonna la construction du château de Saint-Ouen.",
            goodAnswerFact: "Le château a été édifié au début de la Restauration pour marquer la Déclaration de Saint-Ouen.",
            order: 3,
            question: "Quel roi de France a fait construire le Château de Saint-Ouen en 1821 ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Plongez au cœur des Puces de Saint-Ouen, carrefour mondial de l'antiquité et de la brocante."
)


// MARK: Haut-de-Seine

fileprivate let hautDeSeineTreks = [
    trekBoulogne,
    trekSceaux,
    trekCourbevoie,
    trekMeudon
]

fileprivate let trekBoulogne = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "building.2.crop.circle"), name: "Architecte en herbe")
    ],
    city: "Boulogne-Billancourt",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 8, day: 14),
        duration: .seconds(2 * 3600 + 15 * 60),
        earnedPoints: 450,
        photos: [],
        unlockedBadges: []
    ),
    department: "Hauts-de-Seine",
    distance: Measurement(value: 4.5, unit: .kilometers),
    duration: .seconds(2 * 3600 + 30 * 60),
    elevation: .low,
    goal: "Découvrir l'architecture des années 30 et l'histoire des studios de cinéma.",
    goodToKnow: ["Prévois de bonnes chaussures, les trottoirs pavés sont nombreux."],
    isLiked: true,
    name: "L'âge d'or de Boulogne",
    picture: Image(.lÂgeDOrDeBoulogne), // L'âge d'or de Boulogne
    riddles: [
        Riddle(
            clue: "La station porte le nom d'un célèbre homme politique socialiste.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8335, longitude: 2.2430),
            goodToKnow: "Cette station a été ouverte en 1934.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 etc. Recherche le nom d'une station de métro de la ligne 9 dont le total des chiffres représentant les lettres sera égal à 3 fois le numéro du département de l'Isère. Le rendez-vous sera à l'extérieur de cette station de métro.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Regarde bien l'angle des rues.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8351, longitude: 2.2410),
            goodToKnow: nil,
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "En sortant de la station, il te faudra remonter les numéros pairs des immeubles de l'avenue principale jusqu'à croiser la rue nommée d'après l'inventeur de la photographie.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Cherche le nom du grand architecte Le Corbusier.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8412, longitude: 2.2523),
            goodToKnow: nil,
            isCompleted: true,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Tourne à droite après avoir constaté qu'un bâtiment aux lignes pures, conçu pour un sculpteur célèbre, s'élève devant toi.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Il s'agit des anciens studios.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8378, longitude: 2.2356),
            goodToKnow: "De nombreux films de la Nouvelle Vague y ont été tournés.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Pénètre dans cette rue dont tu découvriras l'histoire cinématographique. Une immense porte métallique t'indiquera l'entrée des anciens plateaux de tournage.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Une petite rue pavée souvent fleurie.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8385, longitude: 2.2380),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "La rue dans laquelle tu bifurqueras rapidement n'organise pas de carnaval, mais son nom t'y fera penser. Trouve la maison au volet bleu marine.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Un jardin public avec de grandes serres.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8471, longitude: 2.2514),
            goodToKnow: "Ce parc abrite de magnifiques serres du 19e siècle.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Mon premier est un lieu de repos. Mon deuxième est le nom d'un célèbre banquier philanthrope. Tu passeras devant mon tout pour terminer ce parcours.",
            validationPoints: 100
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Claude Monet"),
                .good("Le Corbusier"),
                .bad("Gustave Eiffel")
            ],
            badAnswerExplanation: "Ces architectes/artistes n'ont pas dessiné cet immeuble des années 30.",
            goodAnswerFact: "Le Corbusier a conçu cet immeuble novateur entre 1931 et 1934.",
            order: 1,
            question: "Quel célèbre architecte a dessiné l'immeuble Molitor situé dans cette ville ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Renault"),
                .bad("Peugeot"),
                .bad("Citroën")
            ],
            badAnswerExplanation: "Seul Renault avait son siège historique ici.",
            goodAnswerFact: "Les usines Renault occupaient l'île Seguin jusqu'en 1992.",
            order: 2,
            question: "Quelle grande marque automobile avait ses usines historiques sur l'Île Seguin ?",
            result: .bad
        ),
        QuizQuestion(
            answers: [
                .bad("Le bois de Vincennes"),
                .bad("Le parc de Saint-Cloud"),
                .good("Le bois de Boulogne")
            ],
            badAnswerExplanation: "Regarde bien la carte géographiquement.",
            goodAnswerFact: "Le bois de Boulogne borde directement le nord de la ville.",
            order: 3,
            question: "Quel grand espace vert borde le nord de Boulogne-Billancourt ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Les studios de la Victorine"),
                .good("Les studios de Billancourt"),
                .bad("Les studios d'Épinay")
            ],
            badAnswerExplanation: "Les studios de la Victorine sont à Nice.",
            goodAnswerFact: "Ouverts en 1922, ils ont accueilli le tournage de 'La Grande Vadrouille'.",
            order: 4,
            question: "Comment s'appelaient les studios de cinéma mythiques de la ville ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Plonge dans les années 30 à travers l'architecture moderniste et le passé industriel de Boulogne."
)

fileprivate let trekSceaux = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: true, walking: true, wheelchair: false),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "leaf.circle.fill"), name: "Ami de la nature")
    ],
    city: "Sceaux",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 16),
        duration: .seconds(1 * 3600 + 45 * 60),
        earnedPoints: 220,
        photos: [],
        unlockedBadges: []
    ),
    department: "Hauts-de-Seine",
    distance: Measurement(value: 3.2, unit: .kilometers),
    duration: .seconds(2 * 3600 + 0 * 60),
    elevation: .medium,
    goal: "Parcourir le parc de Sceaux et découvrir son château.",
    goodToKnow: ["Le parc ferme ses grilles au coucher du soleil."],
    isLiked: false,
    name: "Les mystères du Domaine de Sceaux",
    picture: Image(.lesMystèresDuDomaineDeSceaux), // Les mystères du Domaine de Sceaux
    riddles: [
        Riddle(
            clue: "Une gare RER de la ligne B.",
            coordinate: CLLocationCoordinate2D(latitude: 48.7770, longitude: 2.3005),
            goodToKnow: nil,
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Quel est le point commun entre l'église devant laquelle tu te trouves et la station de RER par laquelle tu es probablement arrivé ? Leurs noms t'indiqueront le point de départ de notre chasse.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Pense au célèbre jardinier de Louis XIV.",
            coordinate: CLLocationCoordinate2D(latitude: 48.7745, longitude: 2.3021),
            goodToKnow: "André Le Nôtre a conçu cet axe.",
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "En avançant dans l'allée principale, la végétation se fera parfaitement symétrique. Arrête-toi au premier bassin rond.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Cherche le canal principal.",
            coordinate: CLLocationCoordinate2D(latitude: 48.7712, longitude: 2.3060),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Tourne à droite après avoir constaté qu'une grande étendue d'eau barre ton chemin. Le murmure des cascades te guidera.",
            validationPoints: 70
        ),
        Riddle(
            clue: "C'est un petit pavillon caché à l'est.",
            coordinate: CLLocationCoordinate2D(latitude: 48.7738, longitude: 2.3110),
            goodToKnow: "Ce pavillon servait aux réceptions de la duchesse du Maine.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Pénètre sous ces arbres centenaires et tu en ressortiras en passant devant un édifice circulaire. Compte ses colonnes.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Le château abrite aujourd'hui un musée.",
            coordinate: CLLocationCoordinate2D(latitude: 48.7732, longitude: 2.3001),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Remonte vers le point culminant. La bâtisse de briques et de pierres sera ton point final.",
            validationPoints: 100
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Napoléon Bonaparte"),
                .good("Jean-Baptiste Colbert"),
                .bad("Le Cardinal de Richelieu")
            ],
            badAnswerExplanation: "C'est un ministre de Louis XIV qui a acquis le domaine en 1670.",
            goodAnswerFact: "Colbert, ministre de Louis XIV, a fait de Sceaux un domaine somptueux.",
            order: 1,
            question: "Quel ministre célèbre a acheté le domaine de Sceaux au 17e siècle ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .good("Le Nôtre"),
                .bad("Mansart"),
                .bad("Haussmann")
            ],
            badAnswerExplanation: "Haussmann a transformé Paris au 19e siècle, Mansart était architecte.",
            goodAnswerFact: "André Le Nôtre est le créateur incontesté des jardins à la française.",
            order: 2,
            question: "Qui a dessiné les jardins géométriques du parc de Sceaux ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Les cygnes"),
                .bad("Les hérons"),
                .good("Les cerisiers du Japon")
            ],
            badAnswerExplanation: "C'est un élément végétal célèbre en avril.",
            goodAnswerFact: "Le bosquet nord se pare de rose lors de la floraison des cerisiers chaque printemps.",
            order: 3,
            question: "Quel élément naturel attire des milliers de visiteurs au parc de Sceaux au printemps ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Une promenade bucolique à travers les jardins à la française de l'un des plus beaux parcs d'Île-de-France."
)

fileprivate let trekCourbevoie = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "eye.trianglebadge.exclamationmark"), name: "Œil de lynx")
    ],
    city: "Courbevoie",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 30),
        duration: .seconds(2 * 3600 + 10 * 60),
        earnedPoints: 600,
        photos: [],
        unlockedBadges: []
    ),
    department: "Hauts-de-Seine",
    distance: Measurement(value: 2.8, unit: .kilometers),
    duration: .seconds(2 * 3600 + 30 * 60),
    elevation: .low,
    goal: "Trouver les dizaines d'œuvres d'art contemporain dispersées sur le parvis.",
    goodToKnow: ["Le vent souffle souvent fort sur l'esplanade !"],
    isLiked: true,
    name: "L'art caché sous les tours",
    picture: Image(.lArtCachéSousLesTours), // L'art caché sous les tours
    riddles: [
        Riddle(
            clue: "Un immense cube évidé blanc.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8926, longitude: 2.2357),
            goodToKnow: "L'arche est dans le parfait alignement de l'Arc de Triomphe.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Recherche l'édifice cubique gigantesque qui clôt l'Axe Historique de Paris. Le rendez-vous sera au centre exact de ses escaliers extérieurs monumentaux.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Une sculpture de pouce géant.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8931, longitude: 2.2389),
            goodToKnow: "C'est une œuvre de César.",
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Va maintenant tout droit, rien ne doit t'arrêter. Avance jusqu'à croiser une partie de l'anatomie humaine surdimensionnée en bronze. Lève les yeux pour en voir le bout.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Une fontaine très colorée.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8900, longitude: 2.2410),
            goodToKnow: nil,
            isCompleted: true,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Tourne rapidement pour rencontrer une œuvre hydraulique aux couleurs vives. Bien qu'étrange, elle t'apportera un bon indice gravé sur son bassin.",
            validationPoints: 60
        ),
        Riddle(
            clue: "L'Araignée Rouge de Calder.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8890, longitude: 2.2435),
            goodToKnow: "L'œuvre mesure 15 mètres de haut.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Recherche l'immense arachnide de métal rouge. Rassure-toi, elle est immobile. Passe exactement sous ses pattes.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Les personnages sans visages.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8875, longitude: 2.2450),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "En sortant de cette zone rouge, tu longeras l'établissement où la végétation tente de survivre sur le béton. Cherche le groupe de personnages statiques fixant l'horizon.",
            validationPoints: 50
        ),
        Riddle(
            clue: "La cheminée colorée de Moretti.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8910, longitude: 2.2465),
            goodToKnow: "Elle est composée de milliers de tubes de fibre de verre.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Mille deux cents tubes de couleur mériteront ton attention lorsque tu longeras l'étrange cheminée d'aération transformée en phare multicolore.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Le bassin de Takis.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8860, longitude: 2.2480),
            goodToKnow: "Les signaux lumineux au bout des tiges bougent avec le vent.",
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Termine ta marche là où l'eau reflète Paris, sous les signaux mystérieux qui semblent surveiller le trafic du bout de leurs tiges.",
            validationPoints: 100
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .good("César"),
                .bad("Rodin"),
                .bad("Giacometti")
            ],
            badAnswerExplanation: "L'artiste est célèbre pour ses compressions et son prénom est donné aux récompenses du cinéma français.",
            goodAnswerFact: "César a réalisé cette empreinte géante de son propre pouce en 1965.",
            order: 1,
            question: "Quel sculpteur est l'auteur du Pouce géant de La Défense ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Un centre commercial"),
                .bad("Des bureaux"),
                .good("Un ministère et des salles d'exposition")
            ],
            badAnswerExplanation: "Ce n'est pas un lieu principalement commercial.",
            goodAnswerFact: "L'Arche abrite le Ministère de la Transition Écologique et le toit est accessible au public.",
            order: 2,
            question: "Que trouve-t-on dans les parois de la Grande Arche ?",
            result: .bad
        ),
        QuizQuestion(
            answers: [
                .bad("Une tour en forme de triangle"),
                .good("La statue historique de la Défense de Paris"),
                .bad("La plus ancienne tour de bureaux")
            ],
            badAnswerExplanation: "Le quartier doit son nom à un événement historique commémoré par cette œuvre.",
            goodAnswerFact: "Cette statue de Barrias a été érigée en 1883 en hommage aux soldats de la guerre de 1870.",
            order: 3,
            question: "Qu'est-ce qui a donné son nom au quartier de La Défense ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("60"),
                .bad("150"),
                .good("Près de 70")
            ],
            badAnswerExplanation: "C'est un musée à ciel ouvert gigantesque.",
            goodAnswerFact: "Le parvis compte environ 70 œuvres d'art majeures.",
            order: 4,
            question: "Combien d'œuvres d'art monumentales le quartier abrite-t-il environ ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("Agam"),
                .bad("Buren"),
                .bad("Soto")
            ],
            badAnswerExplanation: "Cet artiste israélien est un pionnier de l'art cinétique.",
            goodAnswerFact: "La fontaine monumentale d'Agam, créée en 1977, est constituée de mosaïques dont la perception change selon notre position.",
            order: 5,
            question: "Qui a conçu la grande fontaine cinétique du parvis ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Découvre le plus grand musée d'art contemporain à ciel ouvert de France, au cœur du quartier d'affaires."
)

fileprivate let trekMeudon = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: false, walking: true, wheelchair: false),
    badgesToUnlock: [
        Badge(icon: Image(systemName: "star.circle.fill"), name: "Tête dans les étoiles")
    ],
    city: "Meudon",
    completion: Trek.CompletionData(
        date: Date.from(year: 2026, month: 7, day: 3),
        duration: .seconds(1 * 3600 + 45 * 60),
        earnedPoints: 310,
        photos: [],
        unlockedBadges: []
    ),
    department: "Hauts-de-Seine",
    distance: Measurement(value: 3.5, unit: .kilometers),
    duration: .seconds(2 * 3600 + 0 * 60),
    elevation: .high,
    goal: "Gravir la colline pour percer les secrets de l'Observatoire et de l'ancien château.",
    goodToKnow: ["Ça monte fort, prends de l'eau !", "La terrasse offre l'une des plus belles vues sur Paris."],
    isLiked: true,
    name: "L'Observatoire des Rois",
    picture: Image(.lObservatoireDesRois), // L'Observatoire des Rois
    riddles: [
        Riddle(
            clue: "La gare RER se situe dans la vallée, cherche la ligne C.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8122, longitude: 2.2472),
            goodToKnow: "Cette gare a été inaugurée en 1901 pour relier Paris à Versailles.",
            isCompleted: true,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 etc. Recherche le nom d'une gare dont le total des chiffres représentant la dernière partie de son nom (Fleury) sera ton code de départ. Le rendez-vous sera au pied du viaduc attenant.",
            validationPoints: 40
        ),
        Riddle(
            clue: "Une grande avenue pavée bordée d'arbres majestueux.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8105, longitude: 2.2381),
            goodToKnow: nil,
            isCompleted: true,
            order: 2,
            picture: nil,
            photos: [],
            summary: "En sortant de sous les arches, il te faudra remonter l'avenue escarpée. Quand les platanes deviendront tilleuls, tu auras la possibilité de reprendre ton souffle devant les grilles du domaine.",
            validationPoints: 60
        ),
        Riddle(
            clue: "L'ancienne Orangerie du château.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8064, longitude: 2.2341),
            goodToKnow: "L'Orangerie a été construite au 17e siècle.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Pénètre dans ce jardin royal, et tu en ressortiras en passant devant le grand bâtiment de pierre aux multiples arcades, conçu pour protéger les agrumes du froid.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Le grand dôme astronomique visible de loin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8050, longitude: 2.2305),
            goodToKnow: "Il abrite la plus grande lunette astronomique d'Europe.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Va maintenant tout droit, monte les dernières marches de la terrasse. Une immense coupole ronde te mettra sur la bonne voie pour clore cette ascension.",
            validationPoints: 90
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Un planétarium géant"),
                .good("Une lunette astronomique"),
                .bad("Un accélérateur de particules")
            ],
            badAnswerExplanation: "Bien que lié à l'espace, ce n'est ni un planétarium ni un outil de physique quantique.",
            goodAnswerFact: "La Grande Lunette de Meudon, construite en 1891, est la troisième plus grande au monde.",
            order: 1,
            question: "Que se cache-t-il sous la grande coupole de l'Observatoire ?",
            result: .good
        ),
        QuizQuestion(
            answers: [
                .bad("Jean-Baptiste Colbert"),
                .bad("Nicolas Fouquet"),
                .good("Le Marquis de Louvois")
            ],
            badAnswerExplanation: "Colbert était à Sceaux et Fouquet à Vaux-le-Vicomte.",
            goodAnswerFact: "Louvois, puissant ministre de la Guerre de Louis XIV, embellit considérablement le château de Meudon.",
            order: 2,
            question: "Quel célèbre ministre de Louis XIV fut propriétaire du Château de Meudon ?",
            result: .bad
        ),
        QuizQuestion(
            answers: [
                .good("Auguste Rodin"),
                .bad("Camille Claudel"),
                .bad("Antoine Bourdelle")
            ],
            badAnswerExplanation: "Ces deux autres sculpteurs sont liés à lui, mais ne vivaient pas dans la Villa des Brillants.",
            goodAnswerFact: "Rodin a acheté la Villa des Brillants à Meudon en 1895, où il est d'ailleurs enterré.",
            order: 3,
            question: "Quel sculpteur mondialement connu a vécu et est enterré à Meudon ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Une belle ascension vers les étoiles, mêlant l'histoire royale et les grandes découvertes astronomiques françaises."
)
