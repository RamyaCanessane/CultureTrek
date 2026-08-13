//
//  TrekExamples.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 11/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import SwiftUI

extension Trek {
    
    static var liveDemoExamples: [Trek] {
        let list = parisTreks + seineSaintDenisTreks + alongTheMarneTreks
        
        let shuffled = list.shuffled()
        
        return [goldenTrekLesHauteursDeBelleville] + shuffled
    }
}

// MARK: Trek à Paris

fileprivate let parisTreks = [
    trekMarais,
    trekMontmartre,
    trekQuartierLatin,
    trekJardinTuileries,
    trekPassagesCouverts,
    trekCanalSaintMartin,
    trekIleDeLaCite
]

fileprivate let badgeMarais = Badge(icon: Image(systemName: "fleurdelis"), name: "Explorateur du Marais")

fileprivate let trekMarais = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: false),
    badgesToUnlock: [badgeMarais],
    city: "Paris",
    completion: nil,
    department: nil,
    distance: Measurement(value: 3.5, unit: .kilometers),
    duration: .seconds(2 * 3600 + 30 * 60),
    // 2h30
    elevation: .low,
    goal: "Découvrir les hôtels particuliers cachés et l'histoire médiévale du Marais.",
    goodToKnow: ["Beaucoup de rues pavées.", "Les musées sur le parcours sont gratuits pour les collections permanentes."],
    isLiked: false,
    name: "Secrets du Marais Historique",
    picture: Image("trek_marais"),
    // Photo URL: https://images.unsplash.com/photo-1550340499-a6c60fc8287c?q=80&w=1000
    riddles: [
        Riddle(
            clue: "Ligne 1, proche de l'Hôtel de Ville.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8556, longitude: 2.3565),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3... Recherche le nom d'une station de métro dont le total des chiffres représentant les lettres sera égal à 3 fois le numéro de département de la Gironde (33). Le rendez-vous sera à la sortie de cette station.",
            validationPoints: 50
        ),
        Riddle(
            clue: "C'est la plus ancienne place planifiée de Paris.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8554, longitude: 2.3655),
            goodToKnow: "L'ancienne Place Royale.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Cherche une place carrée où les briques rouges dansent avec les arcades. La maison d'un célèbre écrivain français, père de 'Quatrevingt-treize', s'y cache dans un angle.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Près de la rue des Rosiers.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8576, longitude: 2.3592),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Engage-toi dans la rue où l'odeur du falafel te guide. Au numéro 23, une plaque rappelle le destin tragique de l'école qui s'y trouvait.",
            validationPoints: 55
        ),
        Riddle(
            clue: "Un immense hôtel particulier.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8572, longitude: 2.3619),
            goodToKnow: "Aujourd'hui Musée de l'Histoire de Paris.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Suis les signes vers l'hôtel qui porte le nom de la dame aux lettres. Ses jardins sont un havre de paix.",
            validationPoints: 50
        ),
        Riddle(
            clue: "C'est un vestige des remparts.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8540, longitude: 2.3601),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "La végétation escalade un mur imposant qui défendait jadis la ville. Ce n'est pas le mur du son, mais celui de Philippe Auguste.",
            validationPoints: 65
        ),
        Riddle(
            clue: "A l'entrée de la bibliothèque.",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8529,
                longitude: 2.3626
            ),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Rends-toi à l'Hôtel de Sens. Regarde bien la façade, un boulet de canon de 1830 y est resté coincé.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Elle est sur une église.",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8545,
                longitude: 2.3546
            ),
            goodToKnow: nil,
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Près du fleuve, cherche l'église dont le nom évoque le plombier le plus célèbre du jeu vidéo. Une horloge orne son clocher solitaire.",
            validationPoints: 60
        ),
        Riddle(
            clue: "C'est le point d'arrivée.",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8565,
                longitude: 2.3512
            ),
            goodToKnow: nil,
            isCompleted: false,
            order: 8,
            picture: nil,
            photos: [],
            summary: "Termine ta course devant le palais de la ville. Ses innombrables statues te regardent arriver.",
            validationPoints: 40
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Louis XIV"),
                .good("Henri IV"),
                .bad("Napoléon Ier")
            ],
            badAnswerExplanation: "Non, c'est Henri IV qui a lancé la construction en 1605.",
            goodAnswerFact: "La place était initialement appelée Place Royale.",
            order: 1,
            question: "Quel roi a ordonné la construction de la Place des Vosges ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("Bibliothèque historique de la ville de Paris"),
                .bad("Musée Picasso"),
                .bad("Mairie du 4e")
            ],
            badAnswerExplanation: "Incorrect, c'est une bibliothèque.",
            goodAnswerFact: "Elle conserve des documents précieux sur l'histoire de Paris.",
            order: 2,
            question: "Qu'abrite aujourd'hui l'Hôtel de Lamoignon ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Un cimetière"),
                .good("Le couvent des Ave Maria"),
                .bad("Une caserne")
            ],
            badAnswerExplanation: "Ce n'est pas ça.",
            goodAnswerFact: "Le lycée a été construit sur les plans d'Édouard Debret.",
            order: 3,
            question: "Qu'y avait-il avant le Lycée Charlemagne ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Hôtel de Ville"),
                .bad("Châtelet"),
                .good("Saint-Paul")
            ],
            badAnswerExplanation: "C'est plus à l'est.",
            goodAnswerFact: "C'était la station du premier riddle !",
            order: 4,
            question: "Quelle station de métro dessert directement la rue Saint-Antoine ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("Une sirène"),
                .bad("Un lion"),
                .bad("Un bateau"),
                .bad("Un dragon")
            ],
            badAnswerExplanation: "Pas ce reptile.",
            goodAnswerFact: "C'est une enseigne de l'ancien 'Cabaret de la Sirène'.",
            order: 5,
            question: "Quel animal mystique orne la façade au 29 rue de Sévigné ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Parcourez les rues pavées du Marais, de la somptueuse Place des Vosges aux hôtels particuliers cachés du Moyen-Âge. Résolvez les énigmes et testez vos connaissances sur l'histoire royale de Paris."
)

fileprivate let badgeMontmartre = Badge(icon: Image(systemName: "paintbrush"), name: "Artiste de la Butte")

fileprivate let trekMontmartre = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: false, walking: true, wheelchair: false),
    badgesToUnlock: [badgeMontmartre],
    city: "Paris",
    completion: nil,
    department: nil,
    distance: Measurement(value: 2.8, unit: .kilometers),
    duration: .seconds(3 * 3600), // 3h
    elevation: .high,
    goal: "Suivre les traces des peintres célèbres et découvrir le Montmartre caché.",
    goodToKnow: ["Ça grimpe ! Prévoyez de bonnes chaussures.", "Évitez le funiculaire pour valider toutes les étapes."],
    isLiked: false,
    name: "La Bohème de Montmartre",
    picture: Image("trek_montmartre"),
    // Photo URL: https://images.unsplash.com/photo-1598113576082-f5c7ff26b7bd?q=80&w=1000
    riddles: [
        Riddle(
            clue: "Au pied du funiculaire.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8837, longitude: 2.3444),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Au pied de la colline, cherche la place dédiée à la sainte patronne de Paris. L'ascension commence ici.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Dans le square Louise Michel.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8847, longitude: 2.3435),
            goodToKnow: nil,
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Monte les marches mais ne t'épuise pas. À mi-chemin, un carrousel tourne sans fin. Repère le personnage qui n'est pas un animal sur le manège.",
            validationPoints: 55
        ),
        Riddle(
            clue: "Le grand monument blanc.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8867, longitude: 2.3431),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Devant la grande basilique blanche, ne regarde pas le ciel mais le sol. Une boussole géante t'indique les points cardinaux. Laquelle est la plus colorée ?",
            validationPoints: 40
        ),
        Riddle(
            clue: "La place des peintres.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8865, longitude: 2.3408),
            goodToKnow: "Très touristique.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Ici, les chevalets sont rois. Trouve le panneau qui indique l'altitude exacte de cette place, la plus haute de Paris.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Un ancien moulin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8876, longitude: 2.3364),
            goodToKnow: "Aujourd'hui un restaurant.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Descends la rue Lepic. Un survivant des moulins à vent te guette. Son nom évoque une pâtisserie populaire.",
            validationPoints: 65
        ),
        Riddle(
            clue: "Dans une petite rue derrière.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8887, longitude: 2.3381),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Un homme traverse un mur, figé dans la pierre. C'est l'œuvre d'un acteur célèbre pour son ami écrivain.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Les vignes de Montmartre.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8881, longitude: 2.3396),
            goodToKnow: nil,
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Au croisement de la rue des Saules, cherche le seul endroit de Paris où l'on fait encore du vin.",
            validationPoints: 75
        ),
        Riddle(
            clue: "Le cabaret rose.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8885, longitude: 2.3394),
            goodToKnow: nil,
            isCompleted: false,
            order: 8,
            picture: nil,
            photos: [],
            summary: "Juste en face des vignes, une maison rose attire l'œil. C'était le cabaret préféré des artistes fauchés.",
            validationPoints: 50
        ),
        Riddle(
            clue: "C'est la fin du parcours.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8851, longitude: 2.3323),
            goodToKnow: nil,
            isCompleted: false,
            order: 9,
            picture: nil,
            photos: [],
            summary: "Rejoins la place au nom d'une actrice célèbre. La sortie du métro est une œuvre d'art Art Nouveau.",
            validationPoints: 45
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [.bad("Bleu"), .good("Rose"), .bad("Jaune"), .bad("Vert")],
            badAnswerExplanation: "Non, c'est la période Rose.",
            goodAnswerFact: "Le tableau 'Les Demoiselles d'Avignon' marque la fin de cette période.",
            order: 1,
            question: "Quelle était la couleur dominante de la période de Picasso quand il habitait au Bateau-Lavoir ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("La Tour Eiffel"), .good("La Basilique du Sacré-Cœur"), .bad("L'Arc de Triomphe")],
            badAnswerExplanation: "Pas sur la butte.",
            goodAnswerFact: "Sa construction a commencé en 1875 après la guerre franco-prussienne.",
            order: 2,
            question: "Quel monument domine la butte Montmartre ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Van Gogh"), .bad("Renoir"), .good("Marcel Aymé")],
            badAnswerExplanation: "Ils étaient peintres.",
            goodAnswerFact: "La nouvelle est parue en 1941.",
            order: 3,
            question: "Qui a écrit la nouvelle 'Le Passe-Muraille' ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.good("Le Chat Noir"), .bad("Le Moulin Rouge"), .bad("Le Lapin Agile")],
            badAnswerExplanation: "Pas celui-ci.",
            goodAnswerFact: "Il a été fondé par Rodolphe Salis.",
            order: 4,
            question: "Quel célèbre cabaret (aujourd'hui disparu) avait pour emblème un animal noir ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Jean Marais"), .good("Dalida"), .bad("Edith Piaf"), .bad("Maurice Chevalier")],
            badAnswerExplanation: "Il n'y habite pas.",
            goodAnswerFact: "Sa maison se trouve rue d'Orchampt.",
            order: 5,
            question: "Quelle célèbre chanteuse a sa statue sur une place de Montmartre ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Pompier"), .good("Poulbot"), .bad("Gavroche")],
            badAnswerExplanation: "Ce sont les enfants de Paris.",
            goodAnswerFact: "Francisque Poulbot a dessiné ces enfants avec humour.",
            order: 6,
            question: "Comment appelle-t-on les enfants de Montmartre dessiné par l'artiste Poulbot ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Escaladez la butte sacrée. Des artistes du Bateau-Lavoir au Sacré-Cœur, découvrez l'esprit bohème qui anime encore ces ruelles escarpées."
)

fileprivate let badgeQuartierLatin = Badge(icon: Image(systemName: "book"), name: "Savant de la Sorbonne")

fileprivate let trekQuartierLatin = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [badgeQuartierLatin],
    city: "Paris",
    completion: nil,
    department: nil,
    distance: Measurement(value: 3.1, unit: .kilometers),
    duration: .seconds(2 * 3600 + 45 * 60),
    // 2h45
    elevation: .medium,
    goal: "Explorer le cœur intellectuel de Paris, des ruines romaines au Panthéon.",
    goodToKnow: ["Quartier très étudiant.", "Le Jardin du Luxembourg est à proximité pour une pause."],
    isLiked: false,
    name: "L'Âme du Quartier Latin",
    picture: Image("trek_latin"),
    // Photo URL: https://images.unsplash.com/photo-1549402585-783282245b0f?q=80&w=1000 //lien non valide
    riddles: [
        Riddle(
            clue: "Près de Notre-Dame.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8530, longitude: 2.3440),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Rends-toi à l'extrémité sud du Petit Pont. Ton aventure commence face à l'une des plus anciennes librairies anglophones de Paris. Le nom évoque un écrivain.",
            validationPoints: 50
        ),
        Riddle(
            clue: "L'église à côté.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8517, longitude: 2.3468),
            goodToKnow: nil,
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Cherche l'église la plus ancienne de Paris (selon certains). Elle cache un arbre planté en 1601. De quelle espèce s'agit-il ?",
            validationPoints: 60
        ),
        Riddle(
            clue: "La grande université.",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8488,
                longitude: 2.3430
            ),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Le bâtiment des savoirs t'attend. Sa façade est ornée de statues. Compte le nombre de 'M' majuscules sur l'inscription principale.",
            validationPoints: 70
        ),
        Riddle(
            clue: "Des ruines romaines.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8475, longitude: 2.3522),
            goodToKnow: nil,
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Les Romains combattaient ici. Entre dans les arènes. Combien d'entrées principales voûtées subsistent aujourd'hui ?",
            validationPoints: 80
        ),
        Riddle(
            clue: "Le grand monument aux grands hommes.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8462, longitude: 2.3464),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Aux grands hommes, la patrie reconnaissante. Regarde le dôme. Quelle couleur est le drapeau qui flotte tout en haut ?",
            validationPoints: 40
        ),
        Riddle(
            clue: "La rue la plus étroite.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8519, longitude: 2.3462),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Reviens vers le fleuve. Cherche la rue du Chat-qui-Pêche. C'est la plus étroite de Paris. Touche les deux murs en même temps.",
            validationPoints: 55
        ),
        Riddle(
            clue: "C'est la fin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8534, longitude: 2.3438),
            goodToKnow: nil,
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Termine sur la place face au pont Saint-Michel. Une grande fontaine te montre un saint terrassant un dragon.",
            validationPoints: 45
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [.bad("Jean Moulin"), .good("Sainte Geneviève"), .bad("Jeanne d'Arc")],
            badAnswerExplanation: "C'est la sainte patronne de Paris.",
            goodAnswerFact: "Elle aurait prié pour détourner Attila de Paris en 451.",
            order: 1,
            question: "Qui est enterré dans l'église Saint-Étienne-du-Mont, près du Panthéon ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.good("Thermes romains"), .bad("Amphithéâtre"), .bad("Forum"), .bad("Temple")],
            badAnswerExplanation: "Incorrect, ce sont des bains.",
            goodAnswerFact: "Ils ont été construits à la fin du IIe siècle.",
            order: 2,
            question: "Quel vestige romain abrite le Musée de Cluny ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Moyen-Âge"), .good("Antiquité"), .bad("Renaissance")],
            badAnswerExplanation: "Plus ancien !",
            goodAnswerFact: "C'est l'un des rares vestiges de Lutèce encore visible.",
            order: 3,
            question: "De quelle époque datent les Arènes de Lutèce ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Rouge"), .good("Gris"), .bad("Bleu"), .bad("Vert")],
            badAnswerExplanation: "Ce n'est pas coloré.",
            goodAnswerFact: "Il s'agit de pierre naturelle ou de ciment.",
            order: 4,
            question: "Quelle est la couleur dominante des bâtiments historiques du Quartier Latin ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Suivez le guide dans le labyrinthe du Quartier Latin. Des Romains aux étudiants de Mai 68, découvrez l'histoire intellectuelle et rebelle de Paris."
)


fileprivate let badgeIleDeLaCite = Badge(icon: Image(systemName: "crown"), name: "Gardien de la Cité")

fileprivate let trekIleDeLaCite = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [badgeIleDeLaCite],
    city: "Paris",
    completion: nil,
    department: nil,
    distance: Measurement(value: 1.5, unit: .kilometers),
    duration: .seconds(1 * 3600 + 30 * 60),
    // 1h30
    elevation: .low,
    goal: "Explorer le berceau de Paris, ses rois et ses mystères.",
    goodToKnow: ["Le parcours est court mais riche.", "Possibilité d'ajouter la visite de la Sainte-Chapelle."],
    isLiked: false,
    name: "Cœur de l'Île de la Cité",
    picture: Image("trek_cite"), // Photo URL: https://images.unsplash.com/photo-1594916892523-88390b1e4c70?q=80&w=1000 //lien non valide
    riddles: [
        Riddle(
            clue: "L'arrêt de métro sur l'île.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8557, longitude: 2.3473),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Au centre de l'île, cherche l'arrêt de métro. Son entrée est un édicule Guimard original. Il n'y en a qu'un sur l'île, trouve-le !",
            validationPoints: 50
        ),
        Riddle(
            clue: "Le Parvis de Notre-Dame.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8529, longitude: 2.3481),
            goodToKnow: nil,
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Ici commence toutes les routes de France. Cherche une plaque de bronze circulaire dans le sol. C'est le point zéro.",
            validationPoints: 60
        ),
        Riddle(
            clue: "La grande horloge du Palais.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8561, longitude: 2.3461),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Lève les yeux sur la Tour de l'Horloge du Palais de la Cité. C'est la plus ancienne horloge publique de Paris. En quel siècle a-t-elle été installée ?",
            validationPoints: 70
        ),
        Riddle(
            clue: "Dans une rue derrière.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8539, longitude: 2.3499),
            goodToKnow: nil,
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Recherche la rue Chanoinesse. Au numéro 26, une cour cache un sol singulier fait de dalles de pierres tumulaires d'anciennes églises. Combien peux-tu en compter sans entrer dans la cour ?",
            validationPoints: 80
        ),
        Riddle(
            clue: "Le plus vieux pont de Paris.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3411),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Marche vers la pointe ouest. Traverse le pont qui n'est pas neuf malgré son nom. Cherche la statue équestre du roi qui l'a inauguré.",
            validationPoints: 55
        ),
        Riddle(
            clue: "La pointe de l'île.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8568, longitude: 2.3402),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Au bout de l'île, le Jardin du Vert-Galant t'accueille. Il a la forme de la proue d'un navire. Rends-toi tout à la pointe et compte les bancs.",
            validationPoints: 65
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [.bad("Le Louvre"), .good("Palais de la Cité"), .bad("Palais du Luxembourg")],
            badAnswerExplanation: "C'était le palais des rois !",
            goodAnswerFact: "La Conciergerie en était une partie.",
            order: 1,
            question: "Quel bâtiment était la résidence des rois de France jusqu'au XIVe siècle ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Napoléon"), .bad("Victor Hugo"), .good("Louis IX (Saint Louis)")],
            badAnswerExplanation: "Il a fait construire la Sainte-Chapelle.",
            goodAnswerFact: "Il l'a construite pour abriter la Couronne d'Épines.",
            order: 2,
            question: "Quel roi a fait construire la Sainte-Chapelle ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.good("6"), .bad("2"), .bad("8"), .bad("4")],
            badAnswerExplanation: "Incorrect, il y en a 6 sur l'Île de la Cité.",
            goodAnswerFact: "Le Pont Neuf est le plus célèbre d'entre eux.",
            order: 3,
            question: "Combien de ponts relient l'Île de la Cité aux rives de la Seine ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("1515"), .bad("1370"), .good("1163"), .bad("1250")],
            badAnswerExplanation: "Incorrect, c'est au XIIe siècle.",
            goodAnswerFact: "La construction a duré près de 200 ans.",
            order: 4,
            question: "En quelle année a débuté la construction de la cathédrale Notre-Dame ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Chambre à coucher"), .good("Prison"), .bad("Marché")],
            badAnswerExplanation: "Elle est tristement célèbre comme prison.",
            goodAnswerFact: "C'est ici que Marie-Antoinette a passé ses derniers jours.",
            order: 5,
            question: "Quel rôle a joué la Conciergerie pendant la Révolution française ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Découvrez le berceau historique de Paris. Des rois de la Conciergerie à l'horloge médiévale, l'île de la Cité vous livre ses secrets les mieux gardés."
)


fileprivate let badgePassagesCouverts = Badge(icon: Image(systemName: "shoeprints.fill"), name: "Flâneur des Passages")

fileprivate let trekPassagesCouverts = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: false, walking: true, wheelchair: false),
    badgesToUnlock: [badgePassagesCouverts],
    city: "Paris",
    completion: nil,
    department: nil,
    distance: Measurement(value: 2.2, unit: .kilometers),
    duration: .seconds(2 * 3600), // 2h
    elevation: .low,
    goal: "Flâner dans les passages couverts du XIXe siècle, ancêtres des centres commerciaux.",
    goodToKnow: ["Les passages sont fermés le dimanche pour la plupart.", "Idéal pour une journée de pluie."],
    isLiked: false,
    name: "Les Passages Couverts",
    picture: Image("trek_passages"), // Photo URL: https://images.unsplash.com/photo-1549402585-783282245b0f?q=80&w=1000 //lien non valide
    riddles: [
        Riddle(
            clue: "Ligne 8 ou 9.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8710, longitude: 2.3421),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3... Recherche le nom d'une station de métro dont le total des chiffres représentant les lettres sera égal à 5 fois le numéro de département des Hauts-de-Seine (92). Le rendez-vous sera à la sortie de cette station.",
            validationPoints: 50
        ),
        Riddle(
            clue: "L'entrée est au 11 rue du Faubourg Montmartre.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8712, longitude: 2.3429),
            goodToKnow: nil,
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Entre dans le Passage Verdeau. C'est l'un des plus anciens. Cherche une boutique qui vend des appareils photo anciens et note son nom.",
            validationPoints: 60
        ),
        Riddle(
            clue: "Il traverse le boulevard Montmartre.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8717, longitude: 2.3425),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Passe au Passage des Panoramas. Regarde le sol. Quel type de revêtement pavait à l'origine ce passage (on en voit encore des vestiges) ?",
            validationPoints: 70
        ),
        Riddle(
            clue: "Près du musée Grévin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8719, longitude: 2.3418),
            goodToKnow: nil,
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Dans le Passage Jouffroy, cherche la boutique 'Le Bonheur des Dames'. Quel est le numéro de rue de l'immeuble où elle se trouve à l'intérieur du passage ?",
            validationPoints: 80
        ),
        Riddle(
            clue: "Une galerie luxueuse.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8665, longitude: 2.3392),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Dirige-toi vers la Galerie Vivienne. C'est la plus belle. Au sol, les mosaïques sont magnifiques. Quelle signature d'artiste y trouve-t-on ?",
            validationPoints: 90
        ),
        Riddle(
            clue: "Près de l'Opéra.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8687, longitude: 2.3361),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Pénètre dans le Passage Choiseul. C'est le plus long de Paris. Quelle est la couleur des colonnes de fer qui soutiennent la verrière ?",
            validationPoints: 55
        ),
        Riddle(
            clue: "C'est la fin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8681, longitude: 2.3323),
            goodToKnow: nil,
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Termine sur la place face à l'Opéra Garnier. Les statues dorées t'admirent.",
            validationPoints: 45
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [.bad("Moyen-Âge"), .good("XIXe siècle"), .bad("Renaissance"), .bad("XVIIIe siècle")],
            badAnswerExplanation: "Plus récent !",
            goodAnswerFact: "C'est l'âge d'or des passages couverts.",
            order: 1,
            question: "De quelle époque datent la plupart des passages couverts ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Passage Choiseul"), .good("Passage Verdeau"), .bad("Galerie Vivienne")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "Verdeau est le nom de l'un des promoteurs.",
            order: 2,
            question: "Quel passage doit son nom à l'un de ses promoteurs ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Jean Reno"), .bad("Gérard Depardieu"), .good("Alain Delon")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "C'est l'un des acteurs les plus iconiques de France.",
            order: 3,
            question: "Quel acteur célèbre a longtemps eu son bureau Galerie Vivienne ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Pierre"), .good("Mosaïque"), .bad("Ciment")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "Les mosaïques de la Galerie Vivienne sont signées Facchina.",
            order: 4,
            question: "Quel type de revêtement orne le sol de la Galerie Vivienne ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Partez pour une flânerie hors du temps dans les passages couverts du XIXe siècle. Verrières, mosaïques et boutiques insolites vous attendent dans ce dédale élégant."
)


fileprivate let badgeCanalSaintMartin = Badge(icon: Image(systemName: "bridge"), name: "Navigateur du Canal")

fileprivate let trekCanalSaintMartin = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [badgeCanalSaintMartin],
    city: "Paris",
    completion: nil,
    department: nil,
    distance: Measurement(value: 4.0, unit: .kilometers),
    duration: .seconds(2 * 3600), // 2h
    elevation: .low,
    goal: "Découvrir le Canal Saint-Martin, ses écluses et ses ponts tournants.",
    goodToKnow: ["Idéal pour une balade à vélo.", "Le canal est partiellement souterrain."],
    isLiked: false,
    name: "Balade sur le Canal Saint-Martin",
    picture: Image("trek_canal"), // Photo URL: https://images.unsplash.com/photo-1590013915160-b6f1f4b00511?q=80&w=1000 //lien non valide
    riddles: [
        Riddle(
            clue: "Grande place avec une statue.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8672, longitude: 2.3638),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Sur la grande place ornée d'une colossale Marianne, cherche le panneau qui indique l'entrée du canal souterrain. C'est ici que ton aventure commence.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Près de l'écluse du Temple.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8689, longitude: 2.3664),
            goodToKnow: nil,
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Au niveau de la première écluse, cherche le pont qui tourne sur lui-même. De quelle couleur est la structure métallique de ce pont tournant ?",
            validationPoints: 60
        ),
        Riddle(
            clue: "Célèbre hôtel d'un film.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8732, longitude: 2.3661),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Cherche l'hôtel dont le nom évoque le Nord. Célèbre pour une scène de film où une actrice y crie 'Atmosphère ! Atmosphère !'. Quel est le nom exact ?",
            validationPoints: 70
        ),
        Riddle(
            clue: "Pont tournant de la Grange aux Belles.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8741, longitude: 2.3669),
            goodToKnow: nil,
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Près d'une autre écluse, un deuxième pont tournant t'attend. Compte les réverbères qui sont directement fixés sur sa structure mobile.",
            validationPoints: 80
        ),
        Riddle(
            clue: "Passerelle surélevée.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8758, longitude: 2.3681),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Escalade l'une des passerelles piétonnes en arche. Quelle est la couleur des marches qui mènent au sommet ?",
            validationPoints: 55
        ),
        Riddle(
            clue: "Un square près de la Villette.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8821, longitude: 2.3731),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Approche du bassin de la Villette. Dans le square au bord du canal, cherche une sculpture en forme d'oiseau. Quelle espèce est représentée ?",
            validationPoints: 65
        ),
        Riddle(
            clue: "Grande rotonde.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8841, longitude: 2.3711),
            goodToKnow: nil,
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Termine devant la rotonde de Ledoux. Ce bâtiment circulaire contrôlait l'entrée des marchandises. Quelle est sa couleur principale ?",
            validationPoints: 45
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [.bad("Jean Gabin"), .bad("Alain Delon"), .good("Arletty")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "La scène a été tournée en studio.",
            order: 1,
            question: "Quelle actrice a rendu célèbre l'Hôtel du Nord par sa réplique 'Atmosphère ! Atmosphère !' ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Bassin de la Villette"),
                .bad("Bassin de l'Arsenal"),
                .good(
                    "Le Bassin souterrain de la Bastille"
                )
            ],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "C'est l'un des lieux secrets de Paris.",
            order: 2,
            question: "Où se trouve le seul bassin souterrain du canal ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Napoléon III"), .bad("Louis XIV"), .good("Napoléon Ier")],
            badAnswerExplanation: "Plus récent !",
            goodAnswerFact: "Le projet a été lancé en 1802.",
            order: 3,
            question: "Qui a ordonné le percement du canal pour l'alimentation en eau potable ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("1815"), .good("1825"), .bad("1835"), .bad("1805")],
            badAnswerExplanation: "Incorrect, c'est au début du XIXe siècle.",
            goodAnswerFact: "Sa construction a duré 23 ans.",
            order: 4,
            question: "En quelle année le canal a-t-il été ouvert à la navigation ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Suivez le fil de l'eau le long du canal Saint-Martin. Écluses, ponts tournants et atmosphère champêtre vous feront découvrir un Paris insolite et romantique."
)


fileprivate let badgeJardinTuileries = Badge(icon: Image(systemName: "fleurdelis"), name: "Jardinier du Roi")

fileprivate let trekJardinTuileries = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [badgeJardinTuileries],
    city: "Paris",
    completion: nil,
    department: "Paris",
    distance: Measurement(value: 2.1, unit: .kilometers),
    duration: .seconds(1 * 3600 + 45 * 60),
    // 1h45
    elevation: .low,
    goal: "Découvrir les Tuileries, ses jardins à la française et son histoire royale.",
    goodToKnow: ["Le jardin ferme à la nuit tombée.", "De nombreuses chaises sont disponibles."],
    isLiked: false,
    name: "Les Jardins du Roi (Tuileries)",
    picture: Image("trek_tuileries"),
    // Photo URL: https://images.unsplash.com/photo-1549402585-783282245b0f?q=80&w=1000 //lien non valide
    riddles: [
        Riddle(
            clue: "Près de la place de la Concorde.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8656, longitude: 2.3211),
            goodToKnow: nil,
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Commence ton trek face à l'Obélisque. Cherche le panneau qui indique l'entrée du jardin des Tuileries. C'est ici que ton aventure commence.",
            validationPoints: 50
        ),
        Riddle(
            clue: "Grande fontaine circulaire.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8658, longitude: 2.3228),
            goodToKnow: nil,
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Au centre du premier grand bassin circulaire, une sculpture en bronze représente un dieu égyptien. De quelle espèce d'animal s'agit-il ?",
            validationPoints: 60
        ),
        Riddle(
            clue: "Célèbre musée au Louvre.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8611, longitude: 2.3361),
            goodToKnow: nil,
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Dirige-toi vers le Louvre. Cherche la célèbre pyramide de verre. Quelle est sa couleur principale ?",
            validationPoints: 70
        ),
        Riddle(
            clue: "Un arc de triomphe.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8617, longitude: 2.3325),
            goodToKnow: nil,
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Face à la pyramide, cherche un arc de triomphe orné de chevaux dorés. Combien de statues de soldats se trouvent sur sa structure ?",
            validationPoints: 80
        ),
        Riddle(
            clue: "Une petite sculpture cachée.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8645, longitude: 2.3262),
            goodToKnow: nil,
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Dans les jardins, cherche une sculpture d'un animal en métal. Il est en train de bondir. Quelle espèce est représentée ?",
            validationPoints: 55
        ),
        Riddle(
            clue: "C'est la fin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8654, longitude: 2.3218),
            goodToKnow: nil,
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Termine ton trek face à l'un des nombreux bassins du jardin. Quelle est la couleur des bancs qui t'invitent au repos ?",
            validationPoints: 45
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [.bad("Jean Moulin"), .bad("Napoléon"), .good("Le Nôtre")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "C'est le dessinateur officiel des jardins du Roi.",
            order: 1,
            question: "Quel paysagiste célèbre a dessiné les jardins du Roi (Tuileries) ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Place Vendôme"), .bad("Place de l'Hôtel de Ville"), .good("Place de la Bastille")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "C'est la date de la prise de la Bastille.",
            order: 2,
            question: "Quelle place est célèbre pour sa colonne commémorant la Révolution de 1830 ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Moyen-Âge"), .bad("XIXe siècle"), .good("Renaissance")],
            badAnswerExplanation: "Plus ancien !",
            goodAnswerFact: "Le projet a été lancé en 1564.",
            order: 3,
            question: "De quelle époque datent les jardins originels ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [.bad("Louis XIV"), .bad("Jeanne d'Arc"), .good("Napoléon Ier")],
            badAnswerExplanation: "Incorrect.",
            goodAnswerFact: "La pyramide a été inaugurée par François Mitterrand.",
            order: 4,
            question: "Quel personnage célèbre a fait construire l'Arc de Triomphe du Carrousel ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Découvrez les splendeurs des Tuileries, ses jardins royaux et son histoire séculaire. Des statues antiques à la pyramide du Louvre, l'élégance de Paris vous attend."
)


// MARK: Trek Seine-Saint-Denis

fileprivate let seineSaintDenisTreks = [
    trekSaintDenisRoyale,
    trekCanalStreetArt,
    trekLeBourgetAirEspace
]

fileprivate let badgeGothique = Badge(
    icon: Image(systemName: "archway"),
    name: "Maître du Gothique"
)

fileprivate let badgeRoyale = Badge(
    icon: Image(systemName: "crown"),
    name: "Ami des Rois"
)

fileprivate let badgeRevolution = Badge(
    icon: Image(systemName: "building.columns"),
    name: "Sans-Culotte"
)

fileprivate let badgeArtUrbain = Badge(
    icon: Image(systemName: "paintpalette"),
    name: "Explorateur de Fresques"
)

fileprivate let badgeIndustriel = Badge(
    icon: Image(systemName: "factory"),
    name: "Patrimoine Industriel"
)

fileprivate let badgePionnier = Badge(
    icon: Image(systemName: "airplane"),
    name: "Pionnier de l'Air"
)

fileprivate let badgeEspace = Badge(
    icon: Image(systemName: "rocket"),
    name: "Conquérant Spatial"
)

fileprivate let trekSaintDenisRoyale = Trek(
    accessibility: Trek.Accessibility(
        bike: false,
        stroller: true,
        walking: true,
        wheelchair: true
    ),
    badgesToUnlock: [badgeGothique, badgeRoyale],
    city: "Saint-Denis",
    completion: nil,
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 1.5, unit: .kilometers),
    duration: .seconds(1 * 3600 + 30 * 60), // 1h30
    elevation: .low,
    goal: "Découvrir le berceau de l'art gothique et la dernière demeure des rois de France.",
    goodToKnow: [
        "Certaines parties extérieures sont pavées.",
        "La visite complète nécessite un ticket pour l'intérieur de la Basilique.",
        "Proche du métro Ligne 13."
    ],
    isLiked: false,
    name: "Saint-Denis : Le Sommeil des Rois",
    picture: Image("basilique_st_denis_facade"),
    // https://upload.wikimedia.org/wikipedia/commons/e/ee/Basilique_Saint-Denis_Fa%C3%A7ade_2011.jpg
    riddles: [
        Riddle(
            clue: "Prends la ligne 13 et cherche l'arrêt nommé d'après le monument principal.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9351, longitude: 2.3534),
            goodToKnow: "Sortie 1 - Hôtel de Ville.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "C'est au cœur de la ville que ton voyage commence. Pour trouver le premier point de ralliement, cherche l'endroit où la terre s'entrouvre pour laisser passer un dragon de métal bleu. Le rendez-vous est au pied du mât signalétique qui porte le nom de l'évêque martyr.",
            validationPoints: 50
              ),
        Riddle(
            clue: "Tourne le dos à la mairie, le monument est devant toi. Cherche la statue du grand abbé qui l'a reconstruit.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9355, longitude: 2.3539),
            goodToKnow: "L'abbé Suger est considéré comme le père de l'art gothique.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Devant le berceau du gothique, lève les yeux. Avant de pénétrer dans le domaine des rois, salue celui qui, au XIIe siècle, fit entrer la lumière. Mon premier est l'abbé qui m'a conçu, mon second est la statue qui le représente sur le parvis. Cherche l'abbé Suger.",
            validationPoints: 100
              ),
        Riddle(
            clue: "Contourne le bâtiment par la droite quand tu es face à l'entrée principale.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9352, longitude: 2.3544),
            goodToKnow: "Cette porte est souvent utilisée pour les sorties de cérémonie.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Longe les murs de pierre où dorment les monarques. Ne cherche pas la grande entrée mais la porte dérobée, là où le soleil de midi frappe la façade latérale. La porte Sud t'attend.",
            validationPoints: 75
              ),
        Riddle(
            clue: "L'indice se trouve à l'intérieur, dans la zone payante, près du transept nord.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9357, longitude: 2.3537),
            goodToKnow: "Un gisant est une sculpture funéraire représentant le défunt allongé.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Une fois à l'intérieur de la nécropole (si le cœur t'en dit), cherche l'armée immobile des endormis de pierre. Le couple le plus célèbre, dont la mort fut tragique sur la place de la Révolution, repose ici. Trouve les gisants de Louis XVI et Marie-Antoinette.",
            validationPoints: 150
              ),
        Riddle(
            clue: "Sors de la Basilique et va vers le nord-est, derrière l'édifice.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9360, longitude: 2.3548),
            goodToKnow: "Un lieu calme parfait pour une pause après la visite.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Reviens à l'air libre. Derrière le chevet, où les vitraux brillent comme des gemmes, un jardin porte le nom d'un maître d'œuvre génial du XIIIe siècle. Entre dans l'oasis verte de Pierre de Montreuil.",
            validationPoints: 80
              ),
        Riddle(
            clue: "Longe le jardin vers le sud en direction du bâtiment attenant.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9348, longitude: 2.3551),
            goodToKnow: "C'est l'ancienne abbaye, transformée par Napoléon.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Pour finir, longe l'ancien monastère transformé par l'Empereur. Le dernier rendez-vous est devant la grande grille de fer forgé d'une école très particulière, où seules les filles des décorés de la Nation ont le droit d'étudier.",
            validationPoints: 120
              )
    ],
    
    // --- 4 QUIZ QUESTIONS ---
    quizQuestions: [
        QuizQuestion(
            answers: [
                .good("Dagobert Ier"),
                .bad("Charlemagne"),
                .bad("Louis XIV")
            ],
            badAnswerExplanation: "Dagobert Ier est le premier roi franc à avoir été enterré dans l'abbaye au VIIe siècle, initiant une longue tradition.",
            goodAnswerFact: "Dagobert Ier est bien le premier ! C'est Napoléon Ier qui a tenté de faire de la Basilique la nécropole impériale, sans succès durable.",
            order: 1,
            question: "Qui est le premier roi de France à avoir été inhumé dans ce lieu ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("L'Art Roman"),
                .good("L'Art Gothique"),
                .bad("L'Art Baroque"),
                .bad("La Renaissance")
            ],
            badAnswerExplanation: "Grâce à l'abbé Suger au XIIe siècle, la Basilique est considérée comme le premier édifice majeur de l'art gothique.",
            goodAnswerFact: "Exactement ! L'utilisation innovante de la croisée d'ogives et des arcs-boutants a permis de créer un espace lumineux.",
            order: 2,
            question: "Quel style architectural majeur est né ici, initié par l'abbé Suger ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Gisant"),
                .bad("Cénotaphe"),
                .good("Oriflamme")
            ],
            badAnswerExplanation: "L'Oriflamme était la bannière de l'abbaye, que les rois venaient chercher avant de partir en guerre.",
            goodAnswerFact: "C'est la bonne réponse ! Elle était conservée près de l'autel et ne sortait que pour les grandes campagnes militaires.",
            order: 3,
            question: "Comment s'appelait la bannière sacrée des rois de France, conservée dans l'abbaye ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Ils ont été cachés dans la crypte"),
                .bad("Ils ont été vendus"),
                .good("Ils ont été profanés et jetés dans des fosses communes")
            ],
            badAnswerExplanation: "Malheureusement, pendant la Révolution, les révolutionnaires ont ouvert les tombeaux et jeté les ossements dans des fosses communes extérieures.",
            goodAnswerFact: "Triste réalité de la Révolution. Les corps ont été exhumés et jetés au vent.",
            order: 4,
            question: "Qu'est-il arrivé aux restes des rois pendant la Révolution française en 1793 ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Parcours le centre historique de Saint-Denis, du métro à la grande nécropole. Découvre l'histoire de France à travers ses rois et son architecture gothique."
)

fileprivate let trekCanalStreetArt = Trek(
    accessibility: Trek.Accessibility(
        bike: true,
        stroller: true,
        walking: true,
        wheelchair: true
    ),
    badgesToUnlock: [badgeArtUrbain, badgeIndustriel],
    city: "Pantin",
    completion: nil,
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 3.2, unit: .kilometers),
    duration: .seconds(2 * 3600 + 0 * 60), // 2h00
    elevation: .low,
    goal: "Explorer les berges du Canal de l'Ourcq pour découvrir le patrimoine industriel et l'art urbain vibrant.",
    goodToKnow: [
        "Parcours entièrement plat, idéal pour le vélo.",
        "Le street art évolue régulièrement, certaines fresques peuvent avoir changé.",
        "Plusieurs stations de métro (Ligne 5) le long du parcours."
    ],
    isLiked: false,
    name: "Ourcq : Galerie à Ciel Ouvert",
    picture: Image("pantin_canal_moulins"), // https://upload.wikimedia.org/wikipedia/commons/e/ef/Pantin_-_Grands_Moulins_et_Canal_de_l%27Ourcq.jpg
    riddles: [
        Riddle(
            clue: "Prends la ligne 5 et descends à l'arrêt nommé d'après l'édifice religieux principal de Pantin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8923, longitude: 2.4137),
            goodToKnow: "Sortie 1 - Avenue Jean Lolive.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "C'est devant une église qui ne ressemble à aucune autre que commence ton exploration. Cherche l'édifice dont le clocher rappelle un phare industriel sur une place qui porte le nom de 'l'Église'.",
            validationPoints: 50
              ),
        Riddle(
            clue: "Traverse l'avenue Jean Lolive et marche vers le nord jusqu'au bord de l'eau.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8935, longitude: 2.4128),
            goodToKnow: "C'est l'un des trois canaux parisiens.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Quitte le bitume de l'avenue pour retrouver la voie d'eau que Napoléon fit creuser. Le rendez-vous est au pied du pont, là où le quai commence.",
            validationPoints: 60
              ),
        Riddle(
            clue: "Longe le canal vers Paris (ouest) sur la rive sud.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8942, longitude: 2.4081),
            goodToKnow: "Architecture brutaliste des années 1970.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Sur ta gauche, un monolithe de béton impose sa présence. Ancienne mairie administrative, c'est aujourd'hui le temple du mouvement et de la grâce. Salue le Centre National de la Danse.",
            validationPoints: 90
              ),
        Riddle(
            clue: "Traverse le canal par la passerelle piétonne juste après le CND.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8950, longitude: 2.4085),
            goodToKnow: "Les œuvres sur les piliers changent souvent.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Traverse la voie d'eau sur la structure métallique qui t'offre une vue imprenable. De l'autre côté, sur les piliers du pont routier, l'art a pris possession du béton. Cherche la première grande fresque.",
            validationPoints: 110
              ),
        Riddle(
            clue: "Longe le canal vers l'est (quitte Paris) sur la rive nord.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8961, longitude: 2.4111),
            goodToKnow: "Ancienne minoterie réhabilitée en bureaux.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Un château industriel de briques rouges se dresse devant toi. Ses tours et ses silos rappellent un passé où le blé arrivait par péniche. Trouve les majestueux Grands Moulins.",
            validationPoints: 130
              ),
        Riddle(
            clue: "Continue à longer les Moulins vers l'est sur la rive nord.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8970, longitude: 2.4135),
            goodToKnow: "Zone de street art légal pour la ville de Pantin.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Longe les briques des Moulins. Quand l'enceinte se termine, un long mur devient une galerie d'art changeante. Repère la fresque qui s'étale sur des dizaines de mètres.",
            validationPoints: 100
              ),
        Riddle(
            clue: "Repère la passerelle piétonne qui enjambe le canal.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8985, longitude: 2.4170),
            goodToKnow: "Un point de vue idéal pour photographier le canal.",
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Traverse à nouveau pour rejoindre la rive sud. Une autre passerelle, plus moderne, t'attend. Elle fait face à un bâtiment rouge qui fut l'ancienne mairie.",
            validationPoints: 85
              ),
        Riddle(
            clue: "Longe le canal vers l'est, passe sous le grand pont de l'autoroute.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9021, longitude: 2.4285),
            goodToKnow: "Cette zone marque l'entrée dans Bobigny.",
            isCompleted: false,
            order: 8,
            picture: nil,
            photos: [],
            summary: "Le chemin devient plus sauvage. Quand tu entends le grondement de l'autoroute A86 au-dessus de toi, regarde les piliers massifs. L'art a aussi colonisé cet espace brut.",
            validationPoints: 120
              ),
        Riddle(
            clue: "Longe le canal quelques mètres après le pont A86 et cherche la station de métro.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9015, longitude: 2.4310),
            goodToKnow: "Le terminus de la Ligne 5 n'est pas loin.",
            isCompleted: false,
            order: 9,
            picture: nil,
            photos: [],
            summary: "Ton voyage s'achève où une autre station de métal bleu t'attend, portant le nom de Pantin, de Bobigny et d'un célèbre écrivain qui aimait les 'Fleurs bleues'.",
            validationPoints: 70
              )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .good("Napoléon Ier"),
                .bad("Louis XIV"),
                .bad("Georges Haussmann")
            ],
            badAnswerExplanation: "C'est Napoléon Ier qui a ordonné le creusement du canal au début du XIXe siècle pour alimenter Paris en eau potable.",
            goodAnswerFact: "Correct ! Il a aussi financé le projet en créant une taxe sur le vin.",
            order: 1,
            question: "Qui a ordonné la création du Canal de l'Ourcq en 1802 ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("L'Art Déco"),
                .bad("L'Haussmannien"),
                .good("Le Brutalisme")
            ],
            badAnswerExplanation: "L'ancien centre administratif de Pantin (devenu CND) est un exemple célèbre du brutalisme, caractérisé par le béton brut.",
            goodAnswerFact: "C'est ça ! Ce style architectural des années 1950-1970 met en valeur le béton et les formes massives.",
            order: 2,
            question: "Quel style architectural caractérise le Centre National de la Danse (CND) ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("D'un château médiéval"),
                .good("D'une église"),
                .bad("D'une mairie")
            ],
            badAnswerExplanation: "Le clocher de l'Église Saint-Germain-l'Auxerrois à Pantin ressemble beaucoup à une cheminée industrielle ou à un phare.",
            goodAnswerFact: "Un choix de design audacieux pour une église ! Ça lui donne un look très industriel qui colle bien à Pantin.",
            order: 3,
            question: "Que rappelle la forme du clocher de l'Église de Pantin (Riddle 1) ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("De l'acier"),
                .bad("Du verre"),
                .good("Du papier")
            ],
            badAnswerExplanation: "Dans les années 1920, la manufacture produisait jusqu'à 30% du papier peint français.",
            goodAnswerFact: "Correct ! Aujourd'hui réhabilitée, elle accueille l'agence de publicité BETC.",
            order: 4,
            question: "L'ancienne manufacture de Pantin, proche du CND, était célèbre pour sa production...",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("Un atelier"),
                .bad("Un monument"),
                .bad("Une fresque")
            ],
            badAnswerExplanation: "Un blase (ou blaze) est la signature d'un graffeur, souvent stylisée.",
            goodAnswerFact: "Exact ! Et 'TOY' désigne un graffeur débutant ou sans talent qui repasse sur les autres.",
            order: 5,
            question: "Dans le jargon du street art, que désigne un 'blase' ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Terminus Ourcq"),
                .bad("Ciné-Canal"),
                .good("L'Été du Canal")
            ],
            badAnswerExplanation: "Chaque été, ce festival propose des navettes fluviales, des concerts et des parcours de street art.",
            goodAnswerFact: "C'est le rendez-vous incontournable de l'été en Seine-Saint-Denis !",
            order: 6,
            question: "Comment s'appelle le festival qui anime les berges de l'Ourcq chaque été ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Parcours 3km de berges entre Pantin et Bobigny. Découvre l'architecture brutaliste du CND, les majestueux Grands Moulins et une galerie de street art en perpétuelle évolution."
)

fileprivate let trekLeBourgetAirEspace = Trek(
    accessibility: Trek.Accessibility(
        bike: false,
        stroller: true,
        walking: true,
        wheelchair: true
    ),
    badgesToUnlock: [badgePionnier, badgeEspace],
    city: "Le Bourget",
    completion: nil,
    department: "Seine-Saint-Denis",
    distance: Measurement(value: 2.1, unit: .kilometers),
    duration: .seconds(2 * 3600 + 30 * 60), // 2h30
    elevation: .low,
    goal: "Revivre l'histoire de l'aviation et de la conquête spatiale sur le site mythique du premier aéroport de Paris.",
    goodToKnow: [
        "Nécessite l'achat d'un billet pour accéder à la plupart des zones.",
        "Le parcours inclut des zones extérieures (tarmac) et intérieures (halls).",
        "Accessible en RER B (Le Bourget) puis bus."
    ],
    isLiked: false,
    name: "Le Bourget : Les Ailes de l'Histoire",
    picture: Image("musee_air_espace_concorde"), // https://upload.wikimedia.org/wikipedia/commons/3/3d/Concorde_001_F-WTSS_prototype_%28MAeE%29.jpg
    riddles: [
        Riddle(
            clue: "L'entrée du musée est au pied d'un grand bâtiment de 1937, sur l'Esplanade de l'Air et de l'Espace.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9463, longitude: 2.4346),
            goodToKnow: "L'aérogare est classée monument historique.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Pour commencer l'épopée, rends-toi là où tout a débuté pour l'aviation commerciale. Mon premier est l'ancienne aérogare de 1937, mon second est l'entrée d'un musée unique. Trouve la porte qui t'ouvre le ciel.",
            validationPoints: 50
              ),
        Riddle(
            clue: "Une fois à l'intérieur, va vers la droite, dans la zone dédiée aux débuts de l'aviation.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9465, longitude: 2.4341),
            goodToKnow: "Héberge le Demoiselle de Santos-Dumont.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Dans la Grande Galerie, l'air semble frémir du vrombissement des premiers moteurs. Cherche l'appareil frêle, fait de bois et de toile, qui a osé défier la gravité au début du XXe siècle. Salue les pionniers.",
            validationPoints: 100
              ),
        Riddle(
            clue: "Cherche l'appareil avec un moteur en étoile et une hélice en bois, près des ballons dirigeables.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9467, longitude: 2.4338),
            goodToKnow: "Louis Blériot a traversé la Manche en 1909.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Mon premier est un nom célèbre, mon second est le numéro XI. Je suis l'avion qui a traversé une mer pour relier la France à l'Angleterre. Repère le Blériot XI.",
            validationPoints: 90
              ),
        Riddle(
            clue: "Sors sur le tarmac, face à l'aérogare.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9458, longitude: 2.4349),
            goodToKnow: "Une plaque commémore l'atterrissage de Lindbergh en 1927.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Sors sur le tarmac. Face à toi, la grande aérogare. Cherche le monument qui célèbre deux héros : l'un français, Nungesser, dont l'Oiseau Blanc disparut, l'autre américain, Lindbergh, qui réussit la traversée.",
            validationPoints: 110
              ),
        Riddle(
            clue: "Longe l'aérogare vers le nord (gauche face au tarmac), cherche le grand hall Concorde.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9475, longitude: 2.4355),
            goodToKnow: "C'est le tout premier prototype, F-WTSS.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Pénètre dans le temple du supersonique. Sous ce toit, un oiseau blanc de métal s'apprête à décoller pour l'éternité. Cherche le premier prototype, le 001, celui qui n'a jamais porté de livrée de compagnie aérienne.",
            validationPoints: 150
              ),
        Riddle(
            clue: "Longe l'autre Concorde juste à côté.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9472, longitude: 2.4358),
            goodToKnow: "Immatriculé F-BTSD, le dernier Concorde à avoir volé pour Air France.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Juste à côté du prototype, un autre Concorde arbore les couleurs de la nation. Il t'invite à bord pour revivre le faste des vols transatlantiques à Mach 2.",
            validationPoints: 130
              ),
        Riddle(
            clue: "Sors du hall Concorde et va vers le milieu du tarmac.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9460, longitude: 2.4370),
            goodToKnow: "Il est entièrement visitable, soute incluse.",
            isCompleted: false,
            order: 7,
            picture: nil,
            photos: [],
            summary: "Sur le tarmac, un géant t'attend. Sa bosse le rend reconnaissable entre mille. Surnommé 'Jumbo Jet', il t'ouvre ses portes pour te montrer ses entrailles.",
            validationPoints: 120
              ),
        Riddle(
            clue: "Va vers l'extrémité nord du tarmac.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9485, longitude: 2.4390),
            goodToKnow: "Des répliques grandeur nature.",
            isCompleted: false,
            order: 8,
            picture: nil,
            photos: [],
            summary: "Quitte la Terre. Au loin, vers le ciel, deux flèches pointent vers l'infini. La première est Ariane 1, pionnière, la seconde est la puissante Ariane 5. Salue les géantes de l'espace.",
            validationPoints: 140
              ),
        Riddle(
            clue: "Reviens vers le sud et entre dans le Hall de l'Espace.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9455, longitude: 2.4365),
            goodToKnow: "Une réplique de la première sonde spatiale de 1957.",
            isCompleted: false,
            order: 9,
            picture: nil,
            photos: [],
            summary: "Dans le noir du Hall de l'Espace, cherche la petite sphère qui a tout déclenché. Mon premier est soviétique, mon second a émis le 'bip-bip' le plus célèbre de l'histoire. Trouve Spoutnik.",
            validationPoints: 110
              ),
        Riddle(
            clue: "Longe le fond du tarmac vers le sud.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9440, longitude: 2.4380),
            goodToKnow: "Un avion de bombardement nucléaire stratégique français.",
            isCompleted: false,
            order: 10,
            picture: nil,
            photos: [],
            summary: "Reviens vers les appareils militaires. Un avion aux ailes en delta, effilé comme une dague, incarne la dissuasion française pendant la Guerre Froide. Repère le Mirage IV.",
            validationPoints: 130
              ),
        Riddle(
            clue: "Repère l'hélicoptère géant près des avions de chasse.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9445, longitude: 2.4375),
            goodToKnow: "Hélicoptère lourd polyvalent français.",
            isCompleted: false,
            order: 11,
            picture: nil,
            photos: [],
            summary: "Ne cherche pas des ailes fixes mais des pales tournantes. Un colosse des airs, قادر survoler les mers, t'attend. Trouve le Super Frelon.",
            validationPoints: 100
              ),
        Riddle(
            clue: "Reviens devant l'entrée principale du musée.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9463, longitude: 2.4346),
            goodToKnow: "N'oublie pas de visiter la boutique !",
            isCompleted: false,
            order: 12,
            picture: nil,
            photos: [],
            summary: "L'épopée s'achève où elle a commencé. Reviens devant l'aérogare classée, le nez encore plein de l'odeur du kérosène et de l'espace.",
            validationPoints: 80
              )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("1919"),
                .good("1927"),
                .bad("1937")
            ],
            badAnswerExplanation: "C'est bien en 1927 que Charles Lindbergh a accompli sa traversée transatlantique légendaire.",
            goodAnswerFact: "Correct ! Son atterrissage ici a déclenché une émeute de joie !",
            order: 1,
            question: "En quelle année Charles Lindbergh a-t-il atterri au Bourget après sa traversée de l'Atlantique ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("1.5"),
                .bad("2.5"),
                .good("2.02")
            ],
            badAnswerExplanation: "Sa vitesse maximale de croisière était de Mach 2.02, soit environ 2179 km/h.",
            goodAnswerFact: "C'est ça ! Deux fois la vitesse du son.",
            order: 2,
            question: "Quelle était la vitesse de croisière maximale du Concorde, en Mach ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Kourou"),
                .bad("Baïkonour"),
                .good("Le Bourget")
            ],
            badAnswerExplanation: "Ariane n'a jamais décollé du Bourget (les fusées sont des répliques), mais de Kourou en Guyane. Cependant, le quiz porte sur le lieu où se trouve l'utilisateur.",
            goodAnswerFact: "Attention au piège ! Le quiz te demande où tu es. Les fusées Ariane sur le tarmac sont des répliques grandeur nature.",
            order: 3,
            question: "Lequel de ces sites n'est pas une base de lancement d'Ariane ? (Piège !)",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("D'un château médiéval"),
                .bad("D'un temple grec"),
                .bad("D'une mairie"),
                .bad("D'une cheminée industrielle")
            ],
            badAnswerExplanation: "L'aérogare de Georges Labro en 1937 avec ses deux tours ressemble beaucoup à un château médiéval.",
            goodAnswerFact: "Bien vu ! Une forme surprenante pour un aéroport moderne à l'époque.",
            order: 4,
            question: "Que rappelle la forme de l'ancienne aérogare de Georges Labro (1937) ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("La France"),
                .good("L'Union Soviétique"),
                .bad("Les États-Unis"),
                .bad("La Chine")
            ],
            badAnswerExplanation: "C'est l'URSS qui a lancé le premier satellite artificiel, Spoutnik 1, en 1957.",
            goodAnswerFact: "Correct ! Cet événement a marqué le début de la course à l'espace.",
            order: 5,
            question: "Quelle nation a lancé le premier satellite artificiel de l'histoire, Spoutnik ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Demoiselle"),
                .bad("Blériot XI"),
                .good("Mirage III"),
                .bad("Falcon 900")
            ],
            badAnswerExplanation: "Le Mirage III, avion de chasse célèbre des années 1960, est un exemple parfait de l'aile delta.",
            goodAnswerFact: "C'est la bonne réponse ! Ce design permet d'atteindre des vitesses élevées.",
            order: 6,
            question: "Lequel de ces appareils légendaires est célèbre pour ses ailes en delta ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("1h30"),
                .bad("2h30"),
                .good("3h30")
            ],
            badAnswerExplanation: "Le Concorde reliait Paris à New York en environ 3h30.",
            goodAnswerFact: "C'est ça ! Un gain de temps considérable par rapport aux vols classiques.",
            order: 7,
            question: "En combien de temps environ le Concorde reliait-il Paris à New York ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("L'industrie textile"),
                .bad("La production de papier peint"),
                .good("La production de l'Oiseau Blanc"),
                .bad("La construction de fusées")
            ],
            badAnswerExplanation: "L'Oiseau Blanc était l'avion de Nungesser et Coli qui disparut en 1927 lors de leur tentative de traversée de l'Atlantique.",
            goodAnswerFact: "C'est bien de l'aviation ! L'Oiseau Blanc est l'un des plus grands mystères de l'histoire de l'aviation.",
            order: 8,
            question: "De quelle production l'usine historique du Bourget était-elle célèbre dans les années 1920 ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Parcours 2km sur le tarmac et dans les halls du Musée de l'Air et de l'Espace. Découvre les pionniers de l'aviation, monte à bord de deux Concorde et d'un Boeing 747, et salue les fusées Ariane."
)


// MARK: Le long de la Marne

fileprivate let alongTheMarneTreks = [
    trekGuiguetteEtFer,
    trekCiteBossuet,
    trekIleAuxArtistes,
    trekTresorsLagny
]

fileprivate let trekGuiguetteEtFer = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [Badge(icon: Image(systemName: "music.note.house.fill"), name: "Mélomane des Guinguettes")],
    city: "Nogent-sur-Marne",
    completion: nil,
    department: "Val-de-Marne",
    distance: Measurement<UnitLength>(value: 3.5, unit: .kilometers),
    duration: .seconds(1 * 3600 + 45 * 60),
    elevation: .low,
    goal: "Revivre l'âge d'or des bords de Marne et découvrir l'architecture de Baltard.",
    goodToKnow: ["Prévois une bouteille d'eau.", "Une partie du parcours est piétonne et très ombragée."],
    isLiked: false,
    name: "L'esprit Guinguette et le Fer",
    picture: Image("nogent_marne"), // URL: https://upload.wikimedia.org/wikipedia/commons/6/69/Nogent-sur-Marne_-_Ile_des_Loups.jpg
    riddles: [
        Riddle(
            clue: "Le premier mot de la ville est Nogent.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8360, longitude: 2.4845),
            goodToKnow: "Cette gare est sur la branche de Boissy-Saint-Léger.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3 ; D = 4 etc. Recherche le nom d'une commune et de sa gare RER dont le total des lettres de son premier mot sera exactement égal au numéro du département de la ville de Paris. Le rendez-vous sera sur le parvis de cette gare.",
            validationPoints: 20
        ),
        Riddle(
            clue: "Suis l'avenue de Joinville vers le sud.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8345, longitude: 2.4880),
            goodToKnow: "L'édifice devant toi a été déplacé depuis le centre de Paris.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Descends la grande artère principale depuis la gare. Tourne à gauche quand tu apercevras la structure métallique d'un géant d'acier qui nourrissait autrefois les Parisiens.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Prends l'escalier qui descend vers la rivière.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8320, longitude: 2.4870),
            goodToKnow: "Les bords de Marne étaient le lieu de villégiature favori des Parisiens au 19ème siècle.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Laisse l'acier derrière toi et descends vers le cours d'eau qui donne son suffixe à la ville. Tu y trouveras une promenade pavée en contrebas.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Regarde vers l'île au milieu de l'eau.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8350, longitude: 2.4920),
            goodToKnow: "Les studios de cinéma de la région tournaient souvent ici.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Longe l'eau à contre-courant. Arrête-toi là où une île boisée refuse de se rattacher à la rive. Les loups y ont jadis élu domicile, d'après son nom.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Cherche le square Tino Rossi.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8385, longitude: 2.4950),
            goodToKnow: "Tino Rossi était très attaché à cette ville.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Poursuis ta route sous les saules pleureurs jusqu'à entendre la voix imaginaire d'un célèbre chanteur corse. Un square honorant sa mémoire t'y attend.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Le port de plaisance est ton point final.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8410, longitude: 2.4980),
            goodToKnow: "C'est l'un des ports de plaisance d'eau douce les plus actifs d'Île-de-France.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Termine ta marche là où les petits navires blancs se reposent et où l'on dîne sur l'eau.",
            validationPoints: 25
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Une ancienne prison pour femmes"),
                .bad("La première gare de l'Est"),
                .good("Une halle du marché parisien"),
                .bad("Un théâtre de quartier")
            ],
            badAnswerExplanation: "Il servait à abriter les denrées alimentaires.",
            goodAnswerFact: "Le Pavillon Baltard est le numéro 8 des 12 pavillons originellement construits aux Halles de Paris par Victor Baltard.",
            order: 1,
            question: "Quelle était la fonction originale du Pavillon Baltard avant son arrivée à Nogent ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Un type de bateau"),
                .good("Un cabaret populaire"),
                .bad("Une danse traditionnelle"),
                .bad("Un plat à base de poisson")
            ],
            badAnswerExplanation: "On y allait surtout pour boire, manger et danser.",
            goodAnswerFact: "Le mot viendrait de 'guinguet', un petit vin blanc aigrelet d'Île-de-France que l'on y servait à l'origine.",
            order: 2,
            question: "Qu'est-ce qu'une guinguette à l'origine ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("L'Oise"),
                .bad("L'Aisne"),
                .bad("La Seine")
            ],
            badAnswerExplanation: "La Marne se jette bien dans la Seine, mais ce n'est pas le plus long affluent global.",
            goodAnswerFact: "Avec ses 514 km, la Marne est la plus longue rivière de France (en tant qu'affluent).",
            order: 3,
            question: "La Marne est célèbre, mais quel est le seul affluent français qui la dépasse en longueur totale ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Claude Monet"),
                .bad("Auguste Renoir"),
                .bad("Camille Pissarro"),
                .good("Antoine Watteau")
            ],
            badAnswerExplanation: "Si les impressionnistes aimaient la Seine, ce peintre du 18ème siècle s'est éteint à Nogent.",
            goodAnswerFact: "Watteau y est décédé en 1721.",
            order: 4,
            question: "Quel célèbre peintre du mouvement rococo a fini ses jours à Nogent-sur-Marne ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Découvre les anciennes halles de Paris et flâne le long des rives qui ont inspiré tant d'artistes."
)

fileprivate let trekCiteBossuet = Trek(
    accessibility: Trek.Accessibility(bike: false, stroller: true, walking: true, wheelchair: false),
    badgesToUnlock: [Badge(icon: Image(systemName: "building.columns.fill"), name: "Historien de l'Aigle")],
    city: "Meaux",
    completion: nil,
    department: "Seine-et-Marne",
    distance: Measurement<UnitLength>(value: 2.2, unit: .kilometers),
    duration: .seconds(2 * 3600 + 0 * 60),
    elevation: .medium,
    goal: "Parcourir la cité épiscopale et plonger dans l'histoire de la capitale du Brie.",
    goodToKnow: ["Le jardin Bossuet a des horaires d'ouverture, vérifiez-les !", "Dégustation de fromage conseillée en fin de parcours."],
    isLiked: false,
    name: "La Cité de Bossuet",
    picture: Image("meaux_cathedrale"), // URL: https://upload.wikimedia.org/wikipedia/commons/b/b5/Meaux_-_Cath%C3%A9drale_Saint-%C3%89tienne_12.jpg
    riddles: [
        Riddle(
            clue: "La ville est Meaux.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9592, longitude: 2.8753),
            goodToKnow: "La gare de Meaux a été ouverte en 1849.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3... Le total des chiffres représentant les lettres de cette ville est égal au numéro de département des Pyrénées-Atlantiques. Rends-toi devant l'horloge de sa gare principale.",
            validationPoints: 20
        ),
        Riddle(
            clue: "C'est la cathédrale Saint-Étienne.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9610, longitude: 2.8795),
            goodToKnow: "Sa construction s'est étalée du 12e au 16e siècle.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Rejoins l'édifice dont la construction a pris plus de 350 ans. Son architecture asymétrique et sa tour unique te feront face au bout de la rue piétonne.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Pénètre dans le jardin à la française derrière la cathédrale.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9620, longitude: 2.8790),
            goodToKnow: "Sa forme ressemble à une mitre d'évêque depuis le ciel.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Contourne le monument par la droite pour trouver un espace de verdure symétrique. Son nom rend hommage à l'Aigle de Meaux.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Cherche les remparts gallo-romains.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9635, longitude: 2.8785),
            goodToKnow: "Ces murs ont protégé la ville des invasions normandes.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Continue vers le nord pour buter contre de vieilles pierres défensives qui veillent sur la ville depuis l'époque de la Gaule.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Reviens vers le Vieux Chapitre.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9605, longitude: 2.8800),
            goodToKnow: "L'escalier extérieur est une merveille de charpente.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Rebrousse chemin dans la cité épiscopale. Trouve le bâtiment pourvu de tourelles et d'un remarquable escalier couvert en bois.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Va vers la Marne et cherche l'ancien moulin.",
            coordinate: CLLocationCoordinate2D(latitude: 48.9560, longitude: 2.8770),
            goodToKnow: "Les moulins faisaient la richesse de Meaux au Moyen-Âge.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Traverse enfin la place et avance jusqu'au fleuve. Une structure en briques surplombant l'eau marquera la fin de ce chapitre de ton voyage.",
            validationPoints: 20
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Un roi de France"),
                .good("Un évêque et écrivain"),
                .bad("Un architecte"),
                .bad("Un général de Napoléon")
            ],
            badAnswerExplanation: "Bossuet n'a jamais manié l'épée, mais la plume et les mots avec brio.",
            goodAnswerFact: "Jacques-Bénigne Bossuet était l'évêque de Meaux, un immense orateur de l'époque de Louis XIV.",
            order: 1,
            question: "Qui était le célèbre 'Aigle de Meaux' ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Camembert"),
                .bad("Coulommiers"),
                .bad("Maroilles"),
                .good("Brie")
            ],
            badAnswerExplanation: "Le Coulommiers est proche, mais c'est bien l'autre qui a rendu Meaux mondialement célèbre.",
            goodAnswerFact: "Le Brie de Meaux est surnommé 'Le Prince des Fromages' depuis le Congrès de Vienne en 1815.",
            order: 2,
            question: "Quel fromage a rendu cette ville mondialement connue ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("André Le Nôtre"),
                .bad("Mansart"),
                .bad("Jean Le Loup")
            ],
            badAnswerExplanation: "Son style est typique des jardins à la française, souvent attribué au maître de Versailles.",
            goodAnswerFact: "Bien qu'il y ait des débats historiques, la conception originelle du jardin Bossuet lui est fortement attribuée.",
            order: 3,
            question: "À quel grand paysagiste est souvent attribué le dessin initial du Jardin Bossuet ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Première Guerre Mondiale (1916)"),
                .good("Première Guerre Mondiale (1914)"),
                .bad("Guerre Franco-Prussienne (1870)"),
                .bad("Seconde Guerre Mondiale (1940)")
            ],
            badAnswerExplanation: "L'avancée a été stoppée très tôt dans le premier conflit mondial.",
            goodAnswerFact: "La Bataille de la Marne en septembre 1914 a permis de sauver Paris grâce, notamment, aux fameux Taxis de la Marne.",
            order: 4,
            question: "Une bataille décisive ayant Meaux pour point de tension s'est déroulée lors de quel conflit ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Un voyage dans le temps au cœur du pouvoir religieux médiéval."
)

fileprivate let trekIleAuxArtistes = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [Badge(icon: Image(systemName: "figure.rowing"), name: "As de l'Aviron")],
    city: "Joinville-le-Pont",
    completion: nil,
    department: "Val-de-Marne",
    distance: Measurement<UnitLength>(value: 4.1, unit: .kilometers),
    duration: .seconds(1 * 3600 + 30 * 60),
    elevation: .low,
    goal: "Traverser les bras de la Marne et explorer l'île Fanac.",
    goodToKnow: ["Le chemin de halage est très agréable à vélo.", "L'île Fanac est sans voiture."],
    isLiked: true,
    name: "L'Île aux Artistes",
    picture: Image("joinville_marne"), // URL: https://upload.wikimedia.org/wikipedia/commons/e/eb/Joinville-le-Pont_-_Ile_Fanac_-_Guinguette.jpg
    riddles: [
        Riddle(
            clue: "Les deux premières lettres sont J et O.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8214, longitude: 2.4646),
            goodToKnow: "Cette gare permet d'accéder au bois de Vincennes tout proche.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3... Le total des deux premières lettres de cette ville donne 25. C'est l'endroit qui fait le 'pont' entre deux rives. Rends-toi devant sa gare RER.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Prends le grand pont de Joinville.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8190, longitude: 2.4680),
            goodToKnow: "L'ouvrage actuel a été reconstruit plusieurs fois au fil des guerres.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Marche vers l'est pour emprunter la structure qui permet aux véhicules d'enjamber la rivière. Un escalier caché t'attend au milieu de la traversée.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Descends sur l'Île Fanac.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8180, longitude: 2.4690),
            goodToKnow: "L'île est un havre de paix, totalement interdite aux véhicules motorisés.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Emprunte cet escalier descendant pour atterrir sur une île préservée. C'est un micro-monde silencieux au milieu de l'agitation.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Longe l'île jusqu'à l'école de musique.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8165, longitude: 2.4715),
            goodToKnow: "Le bâtiment a gardé tout son cachet architectural du XIXe.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Marche en amont du courant. Tu trouveras une grande et élégante demeure de briques et de bois qui fait résonner des notes de piano sur l'eau.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Repasse sur la rive sud et rejoins Chez Gégène.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8145, longitude: 2.4760),
            goodToKnow: "Chez Gégène a inspiré d'innombrables chansons populaires.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Quitte l'île et rejoins la terre ferme côté sud. Longe le quai jusqu'à tomber sur la plus célèbre guinguette de France aux auvents rouges et blancs.",
            validationPoints: 20
        ),
        Riddle(
            clue: "Finis au club d'aviron.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8130, longitude: 2.4780),
            goodToKnow: "Le club a formé plusieurs champions olympiques.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Poursuis ta route de quelques centaines de mètres : d'étroites et longues embarcations y reposent, attendant leurs pelles pour fendre l'eau.",
            validationPoints: 20
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Chez Marcel"),
                .bad("Le Moulin Rouge"),
                .good("Chez Gégène"),
                .bad("La Bonne Franquette")
            ],
            badAnswerExplanation: "Les autres sont des cabarets ou des guinguettes fictives.",
            goodAnswerFact: "Fondée par Eugène Favé, dit 'Gégène', dans les années 1930, c'est l'institution de Joinville.",
            order: 1,
            question: "Quelle est la plus mythique des guinguettes située sur les quais de Joinville ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Canoë-kayak"),
                .bad("Voile"),
                .good("Aviron")
            ],
            badAnswerExplanation: "Bien qu'on y pratique d'autres sports nautiques, ce club est historiquement lié à l'Aviron.",
            goodAnswerFact: "Le club Aviron Marne et Joinville, fondé en 1876, est un des plus anciens et titrés de France.",
            order: 2,
            question: "Quel sport nautique de compétition est la fierté locale historique de la ville ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .good("Bourvil"),
                .bad("Edith Piaf"),
                .bad("Jean Gabin"),
                .bad("Maurice Chevalier")
            ],
            badAnswerExplanation: "Il l'a popularisée avec son célèbre tube.",
            goodAnswerFact: "C'est bien Bourvil qui chantait la fameuse chanson 'À Joinville-le-Pont' en 1952.",
            order: 3,
            question: "Qui chantait 'À Joinville-le-Pont / Pon, pon ! / Tous les dimanches on s'en va...' ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Les cygnes"),
                .bad("Les brochets"),
                .bad("Les castors"),
                .good("Les chauves-souris")
            ],
            badAnswerExplanation: "Il y a un couloir de préservation très spécifique pour cet animal nocturne.",
            goodAnswerFact: "Des espaces sombres sous certains ponts de la Marne sont préservés pour permettre à des espèces protégées de chauves-souris de s'y loger.",
            order: 4,
            question: "La faune de la Marne est protégée, particulièrement une espèce présente sous les arches des ponts. Laquelle ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Plonge dans l'ambiance des Années Folles et de la culture nautique parisienne."
)

fileprivate let trekTresorsLagny = Trek(
    accessibility: Trek.Accessibility(bike: true, stroller: true, walking: true, wheelchair: true),
    badgesToUnlock: [Badge(icon: Image(systemName: "flame.fill"), name: "Miraculé des Ardents")],
    city: "Lagny-sur-Marne",
    completion: nil,
    department: "Seine-et-Marne",
    distance: Measurement<UnitLength>(value: 2.8, unit: .kilometers),
    duration: .seconds(1 * 3600 + 15 * 60),
    elevation: .low,
    goal: "Découvrir la place de la fontaine et les églises historiques au bord de l'eau.",
    goodToKnow: ["Le centre historique est presque entièrement piéton.", "Superbe marché le dimanche matin."],
    isLiked: false,
    name: "Les Trésors de Lagny",
    picture: Image("lagny_marne"), // URL: https://upload.wikimedia.org/wikipedia/commons/7/7b/Lagny-sur-Marne_-__Bords_de_Marne.jpg
    riddles: [
        Riddle(
            clue: "Le premier mot compte 5 lettres, L-A-G-N-Y.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8781, longitude: 2.7052),
            goodToKnow: "Cette gare relie Paris-Est en moins de 30 minutes.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Soit A = 1 ; B = 2 ; C = 3... Trouve la ville dont le total des lettres de son premier mot donne le même nombre que le département du Nord (59). Retrouvons-nous sur le parvis de sa gare.",
            validationPoints: 20
        ),
        Riddle(
            clue: "Cherche l'église principale au centre ville.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8770, longitude: 2.7040),
            goodToKnow: "Jeanne d'Arc s'y est rendue au 15ème siècle.",
            isCompleted: false,
            order: 2,
            picture: nil,
            photos: [],
            summary: "Marche droit dans la rue piétonne jusqu'à buter contre une immense façade en pierre. C'est l'Abbatiale Notre-Dame-des-Ardents.",
            validationPoints: 10
        ),
        Riddle(
            clue: "La Place de la Fontaine est le cœur battant de Lagny.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8760, longitude: 2.7035),
            goodToKnow: "L'ancienne fontaine Saint-Fursy date du XIIe siècle.",
            isCompleted: false,
            order: 3,
            picture: nil,
            photos: [],
            summary: "Contourne l'Abbatiale par la gauche. Tu déboucheras sur une grande place pavée où l'eau jaillit, entourée de maisons à colombages.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Rejoins les berges de la rivière.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8750, longitude: 2.7060),
            goodToKnow: "C'était autrefois un lieu de déchargement important de marchandises.",
            isCompleted: false,
            order: 4,
            picture: nil,
            photos: [],
            summary: "Quitte la place en suivant la déclivité de la route. L'air se fera plus humide et la Marne s'ouvrira devant toi. Trouve le petit quai en contrebas.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Longe les bords de Marne vers le sud.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8735, longitude: 2.7090),
            goodToKnow: "De nombreux cygnes y élisent domicile.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Longe la berge dans le sens inverse du courant. Tu passeras sous des saules majestueux, jusqu'à apercevoir un ancien lavoir restauré.",
            validationPoints: 15
        ),
        Riddle(
            clue: "L'arrivée est au Square Paul Tessier.",
            coordinate: CLLocationCoordinate2D(latitude: 48.8745, longitude: 2.7110),
            goodToKnow: "Ce parc abrite des vestiges sculptés très anciens.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Remonte sur la route pour clore ton aventure dans un square abritant des arcades en ruines, témoins d'une vieille abbaye oubliée.",
            validationPoints: 20
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("Elle a gagné une bataille"),
                .bad("Elle y a été couronnée"),
                .good("Elle y a ressuscité un enfant"),
                .bad("Elle y a perdu son épée")
            ],
            badAnswerExplanation: "Elle n'a pas perdu son épée ici (c'était à Saint-Denis) et n'a combattu aucune bataille majeure dans cette ville même.",
            goodAnswerFact: "La légende raconte que Jeanne d'Arc aurait miraculeusement ramené à la vie un enfant mort-né à l'Abbatiale de Lagny, juste le temps qu'il soit baptisé.",
            order: 1,
            question: "Quel miracle est historiquement attribué à Jeanne d'Arc lors de son passage à Lagny en 1430 ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Les Lagnards"),
                .good("Les Latignaciens"),
                .bad("Les Lagnéens"),
                .bad("Les Marnois")
            ],
            badAnswerExplanation: "L'étymologie remonte au nom latin de la ville 'Latiniacum'.",
            goodAnswerFact: "Les habitants s'appellent les Latignaciens !",
            order: 2,
            question: "Comment appelle-t-on les habitants de Lagny-sur-Marne ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Le sel"),
                .good("Le commerce (Foires de Champagne)"),
                .bad("La soie"),
                .bad("Le charbon")
            ],
            badAnswerExplanation: "Les foires réunissaient les marchands de toute l'Europe.",
            goodAnswerFact: "Au Moyen Âge, Lagny était l'une des 4 grandes villes accueillant les célèbres Foires de Champagne.",
            order: 3,
            question: "Qu'est-ce qui a fait la grande richesse de la ville de Lagny au Moyen-Âge ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Sur le parvis de l'abbatiale"),
                .bad("Au milieu du pont"),
                .bad("Dans l'hôtel de ville"),
                .good("Au fond de la Marne")
            ],
            badAnswerExplanation: "Selon la légende et les rumeurs historiques, elle y serait encore !",
            goodAnswerFact: "Une légende tenace prétend que l'épée brisée de Jeanne d'Arc (celle de Sainte-Catherine-de-Fierbois) aurait été jetée au fond de la Marne à Lagny, ou emmurée dans l'abbatiale.",
            order: 4,
            question: "Où se trouverait, selon certaines légendes locales, l'épée brisée de Jeanne d'Arc ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Explore une cité médiévale riche en mystères, ayant accueilli Jeanne d'Arc."
)

// MARK: - Golden Trek

fileprivate let badgePanorama = Badge(
    icon: AppImage.Badge.distanceLv1.image,
    name: "Panorama Conquis"
)

fileprivate let badgeStreetArt = Badge(
    icon: AppImage.Badge.durationLv2.image,
    name: "Œil de Street-Artiste"
)

fileprivate let badgeVoixDeBelleville = Badge(
    icon: AppImage.Badge.paname.image,
    name: "Voix de Belleville"
)

fileprivate let goldenTrekLesHauteursDeBelleville = Trek(
    accessibility: Trek.Accessibility(
        bike: false,
        stroller: false,
        walking: true,
        wheelchair: false
    ),
    badgesToUnlock: [badgePanorama, badgeStreetArt, badgeVoixDeBelleville],
    city: "Paris",
    completion: nil,
    department: "Paris",
    distance: Measurement(value: 4.2, unit: UnitLength.kilometers),
    duration: .seconds(2 * 3600 + 30 * 60),
    elevation: .high,
    goal: "Grimper la colline de Belleville sur les traces des vignerons, des artistes de rue et d'Édith Piaf, pour découvrir un Paris populaire loin des sentiers battus.",
    goodToKnow: [
        "Beaucoup d'escaliers et de pentes : prévoir de bonnes chaussures.",
        "Le street art de la rue Dénoyez change très régulièrement, ne t'étonne pas si une œuvre a disparu depuis la dernière mise à jour.",
        "L'intérieur du Regard de la Lanterne ne se visite qu'aux Journées européennes du Patrimoine ; le jardin, lui, est en accès libre toute l'année."
    ],
    isLiked: false,
    name: "Les Hauteurs de Belleville",
    picture: Image("trek_belleville_cover"), // https://commons.wikimedia.org/wiki/File:P1010851_Paris_XX_Parc_de_Belleville_reductwk.JPG
    riddles: [
        Riddle(
            clue: "Pense à ce que l'on voit depuis les hauteurs, et à ce qui rend un lieu agréable à regarder.",
            coordinate: CLLocationCoordinate2D(latitude: 48.87189, longitude: 2.37716),
            goodToKnow: "Belleville fut une commune indépendante jusqu'en 1860, année de son annexion par Paris, en même temps que Montmartre et Ménilmontant.",
            isCompleted: false,
            order: 1,
            picture: nil,
            photos: [],
            summary: "Ce quartier populaire du nord-est parisien fut longtemps une commune indépendante, réputée pour ses vignes et ses guinguettes, avant d'être annexée à Paris en 1860. Son nom illustre à la fois sa vue dégagée sur la capitale et son ancienne réputation de « beau village ». Rends-toi à la station de métro (lignes 2 et 11) qui porte aujourd'hui ce même nom : le rendez-vous est à l'extérieur, côté boulevard.",
            validationPoints: 10
        ),
        Riddle(
            clue: "Le nom de cette rue rime avec celui de ses anciens tenanciers de bal, les Dénoyez.",
            coordinate: CLLocationCoordinate2D(latitude: 48.87160, longitude: 2.37850),
            goodToKnow: "En mars 1918, un obus de la « Grosse Bertha » explosa au numéro 10 de cette rue, un souvenir aujourd'hui recouvert par les fresques.",
            isCompleted: false,
            order: 2,
            picture: Image("riddle_rue_denoyez"), // https://commons.wikimedia.org/wiki/File:Plaque_Rue_D%C3%A9noyez_-_Paris_XX_(FR75)_-_2021-06-10_-_1.jpg
            photos: [],
            summary: "Dans les années 1830, une famille du cru tenait ici un bal populaire surnommé la « Folie ». Aujourd'hui, ce sont des bombes de peinture, et non des violons, qui animent ses façades borgnes, changeant de visage presque chaque semaine. Trouve cette ruelle pavée de 150 mètres, tapie entre deux artères plus commerçantes, et immortalise le mur qui t'aura le plus marqué.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Cherche le numéro pair, à deux chiffres, sur la rue qui donne son nom au quartier.",
            coordinate: CLLocationCoordinate2D(latitude: 48.87330, longitude: 2.38230),
            goodToKnow: "C'est Maurice Chevalier qui fit apposer cette plaque en 1963, l'année de la mort d'Édith Piaf. Son acte de naissance indique qu'elle est en réalité née à l'hôpital Tenon, tout proche.",
            isCompleted: false,
            order: 3,
            picture: Image("riddle_plaque_piaf"), // https://commons.wikimedia.org/wiki/File:Plaque_%C3%89dith_Piaf,_72_rue_de_Belleville,_Paris_20e_1.jpg
            photos: [],
            summary: "Une plaque, posée par un autre monstre sacré de la chanson française, affirme qu'un bébé serait né sur les marches de cet immeuble en plein hiver 1915, « dans le plus grand dénuement ». Son état civil raconte une tout autre histoire, à l'hôpital voisin. Trouve l'adresse où la légende, plus belle que la vérité, continue de résonner.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Cherche un petit temple de pierre rond, coiffé d'une sorte de lanterne, au milieu d'un jardin public du 19e arrondissement.",
            coordinate: CLLocationCoordinate2D(latitude: 48.87880, longitude: 2.39350),
            goodToKnow: "Construit entre 1583 et 1613, le Regard de la Lanterne servait de tête de pont au grand aqueduc de Belleville, qui alimentait plusieurs fontaines de la rive droite. Il est classé monument historique depuis 1899.",
            isCompleted: false,
            order: 4,
            picture: Image("riddle_regard_lanterne"), // https://commons.wikimedia.org/wiki/File:Regard_de_la_Lanterne_01.jpg
            photos: [],
            summary: "Sous la colline de Belleville coule une eau qu'on ne voit plus. Depuis le XVIIe siècle, un petit édifice rond, coiffé d'un dôme et d'un lanternon, veille sur son passage : c'est lui qui a donné son nom au jardin qui l'abrite aujourd'hui, coincé entre des tours des années 1970. Trouve ce vestige, aussi discret que précieux.",
            validationPoints: 20
        ),
        Riddle(
            clue: "Cherche un nom d'eau qui tombe, au singulier ou au pluriel selon les cartes.",
            coordinate: CLLocationCoordinate2D(latitude: 48.87300, longitude: 2.38650),
            goodToKnow: "La rue des Cascades suit le tracé d'un ancien réseau d'aqueducs médiévaux et a longtemps été un lieu de villégiature prisé pour ses sources.",
            isCompleted: false,
            order: 5,
            picture: nil,
            photos: [],
            summary: "Cette rue en pente doit son nom aux flots qui, avant d'être canalisés, dévalaient autrefois la colline. Ses maisons basses et ses ateliers d'artistes n'ont rien d'haussmannien : ils rappellent plutôt un village qui aurait refusé de disparaître. Descends cette rue qui relie les hauteurs de Belleville aux abords de la place des Fêtes.",
            validationPoints: 15
        ),
        Riddle(
            clue: "L'une de ses grilles d'entrée porte le nom de délicates fleurs à cinq pétales, symbole de paix.",
            coordinate: CLLocationCoordinate2D(latitude: 48.86980, longitude: 2.38330),
            goodToKnow: "Inauguré en 1988 seulement, le Parc de Belleville a repris la tradition viticole de la colline, cultivée dès l'époque carolingienne par des moines.",
            isCompleted: false,
            order: 6,
            picture: nil,
            photos: [],
            summary: "Contrairement à son voisin des Buttes-Chaumont, ce jardin n'a rien d'haussmannien : il n'a même pas quarante ans. Construit sur d'anciennes carrières de gypse, il cultive pourtant, tout en haut, un souvenir bien plus ancien : une vigne. Entre par l'une de ses grilles, et prépare-toi à grimper.",
            validationPoints: 15
        ),
        Riddle(
            clue: "Le nom de ce point de vue rend hommage à un photographe humaniste du 20e arrondissement, célèbre pour ses clichés en noir et blanc de Paris.",
            coordinate: CLLocationCoordinate2D(latitude: 48.87083, longitude: 2.38472),
            goodToKnow: "Le belvédère fut renommé en 2015 en hommage à Willy Ronis (1910-2009), photographe qui vécut de nombreuses années dans le 20e arrondissement et immortalisa le Paris populaire.",
            isCompleted: false,
            order: 7,
            picture: Image("riddle_belvedere_willy_ronis"), // https://commons.wikimedia.org/wiki/File:Vue_depuis_le_Parc_de_Belleville.JPG
            photos: [],
            summary: "Tout en haut de la colline, à 108 mètres d'altitude, un pavillon domine tout Paris : la tour Eiffel, le Sacré-Cœur, et par temps clair, bien plus loin encore. Il porte le nom d'un photographe qui a consacré son œuvre au Paris populaire, et qui vivait justement dans cet arrondissement. Arrête-toi ici : c'est la plus belle vue gratuite de la capitale, et la fin de ce parcours.",
            validationPoints: 25
        )
    ],
    quizQuestions: [
        QuizQuestion(
            answers: [
                .bad("1789"),
                .bad("1900"),
                .good("1860"),
                .bad("1919")
            ],
            badAnswerExplanation: "Belleville a conservé son statut de commune jusqu'en 1860, année du grand agrandissement de Paris sous Napoléon III.",
            goodAnswerFact: "En 1860, Paris annexe plusieurs communes limitrophes, dont Belleville, Montmartre et Auteuil, faisant passer la capitale de 12 à 20 arrondissements.",
            order: 1,
            question: "Jusqu'en quelle année Belleville fut-il une commune indépendante avant d'être annexé par Paris ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Le plus grand parc de Paris"),
                .good("Le plus haut parc de Paris"),
                .bad("Le plus ancien parc de Paris")
            ],
            badAnswerExplanation: "Avec ses 4,5 hectares, le Parc de Belleville est plutôt modeste en taille, et il fut inauguré seulement en 1988 : ni le plus grand, ni le plus ancien de la capitale.",
            goodAnswerFact: "Culminant à 108 mètres, le Parc de Belleville offre le point de vue en plein air le plus élevé de la capitale, devançant même la Butte Montmartre.",
            order: 2,
            question: "Avec ses 108 mètres d'altitude, que peut-on dire du Parc de Belleville par rapport aux autres jardins parisiens ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("D'un ancien maire de Belleville"),
                .bad("D'un peintre qui y avait son atelier"),
                .good("D'une famille qui tenait un bal populaire, la Folie Dénoyez"),
                .bad("D'une variété de vigne locale")
            ],
            badAnswerExplanation: "Aucun de ces éléments n'est à l'origine du nom : c'est bien une famille de tenanciers de bal qui a légué son nom à la rue, bien avant l'arrivée du street art.",
            goodAnswerFact: "Dans les années 1830, la famille Dénoyez tenait un bal public très populaire, la « Folie Dénoyez », qui a donné son nom à la rue.",
            order: 3,
            question: "D'où vient le nom de la rue Dénoyez, aujourd'hui célèbre pour son street art ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Dans une roulotte de cirque"),
                .good("À l'hôpital Tenon, rue de la Chine"),
                .bad("Sur les marches du 72 rue de Belleville"),
                .bad("À l'hôpital Necker")
            ],
            badAnswerExplanation: "La légende de la naissance sur les marches, entretenue par Piaf elle-même puis par la plaque commémorative, n'est pas corroborée par l'état civil.",
            goodAnswerFact: "Son acte de naissance indique qu'Édith Giovanna Gassion est née le 19 décembre 1915 à l'hôpital Tenon, situé rue de la Chine, à quelques centaines de mètres du 72 rue de Belleville.",
            order: 4,
            question: "Selon son acte de naissance officiel, où Édith Piaf est-elle réellement née ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("À stocker des grains pendant les famines"),
                .bad("À observer les astres depuis la colline"),
                .good("À surveiller et capter les eaux de l'aqueduc de Belleville"),
                .bad("À abriter les gardes de l'octroi")
            ],
            badAnswerExplanation: "Ce petit édifice n'a jamais eu de fonction militaire, agricole ou astronomique : sa forme et son emplacement sont directement liés à la gestion de l'eau.",
            goodAnswerFact: "Construit entre 1583 et 1613, le Regard de la Lanterne permettait de surveiller et de collecter les eaux souterraines de la colline de Belleville, acheminées ensuite vers les fontaines parisiennes.",
            order: 5,
            question: "À quoi servait historiquement le Regard de la Lanterne, dans le jardin du même nom ?",
            result: .undefined
        )
    ],
    region: "Île-de-France",
    summary: "Un parcours vallonné entre le 19e et le 20e arrondissement, entre vignes urbaines, fresques éphémères, vestiges hydrauliques médiévaux et légende de la môme Piaf, jusqu'au plus haut belvédère gratuit de la capitale."
)
