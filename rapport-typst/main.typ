#import "template.typ": *
#import "@preview/wrap-it:0.1.0": wrap-content // rap contenders
#show link: set text(blue)
#show: project.with(
  title: "TITRE",
  doctitle: "HAI911 Développement d’applications interactives ",
  secondarytitle: "TP ARAP",
  authors: (
    "Gilles Gonzalez Oropeza",
    "",
    "",
    "",
  ),
  encadrants: (
    "",
    "",
    "",
    "",
  )
)
#include "includes/codlyConfig.typ"

// ======= TABLE DES MATIERES =============
#set text(size: 11pt) // Taille texte du reste

// ======= DEBUT DU RAPPORT =============
#let config = (amount: 0em, all: true)

#set par(
  justify: true,
  first-line-indent: config.amount,
  spacing: 1.9em
)


#pagebreak()
= Système linéaires
== Exercice 1

Système d'équations :

$ cases(
  x_0 + x_1 = 1,
  x_1 + x_2 = 0,
  x_0 + x_2 = 0
) $

Solution à la main :

$ cases(
  x_0 = 0.5,
  x_1 = 0.5,
  x_2 = -0.5
) $

== Exercice 2

$ A vec(x_0, x_1, x_2, delim: "[") = b $

$ A = mat(1, 1, 0; 0, 1, 1; 1, 0, 1; delim: "[") $

$ b = vec(1, 0, 0, delim: "[") $

== Exercice 3

J'obtiens bien la même solution qu'à la main.

#pagebreak()

= ARAP

// Matrice A taille (3 x nb sommets) x (3 x nb aretes + 3 x nb handle)

#grid(columns: 2, column-gutter: 1%, row-gutter: 1%,
image("assets/arap1.png", width: 100%),
image("assets/arap2.png", width: 100%),
image("assets/arap3.png", width: 100%),
image("assets/arap4.png", width: 100%)
)

J'ai implémenté avec succès ARAP.

= Dépôt Github
\
https://github.com/Kuuro-neko/TP-arap

