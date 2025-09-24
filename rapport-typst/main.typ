#import "template.typ": *
#import "@preview/wrap-it:0.1.0": wrap-content // rap contenders
#show link: set text(blue)
#show: project.with(
  title: "TITRE",
  doctitle: "DOC TITLE",
  secondarytitle: "SECONDARY TITLE",
  authors: (
    "Author(s)",
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
#set text(size: 11pt) // Taille texte table des matières
#outline(depth: 3, indent: auto)
#set text(size: 11pt) // Taille texte du reste

// ======= DEBUT DU RAPPORT =============
#let config = (amount: 0em, all: true)

#set par(
  justify: true,
  first-line-indent: config.amount,
  spacing: 1.9em
)


#pagebreak()
= Exercice 1

Système d'équations :

$ x_0 + x_1 = 1 $
$ x_1 + x_2 = 0 $
$ x_0 + x_2 = 0 $

Solution à la main :
$ x_0 = 0.5 $
$ x_1 = 0.5 $
$ x_2 = -0.5 $

= Exercice 2

$ A vec(x_0, x_1, x_2, delim: "[") = b $

$ A = vec(x_0, x_1, x_2, delim: "[") $

$ b = vec(1, 0, 0, delim: "[") $

#pagebreak()



#heading("Table des figures", numbering: none)
#v(2%)
#outline(title: none, target: figure.where(kind: image, numbering: "1"))

#v(4%)

#heading("Table des tableaux", numbering: none)
#v(2%)
#outline(title: none, target: figure.where(kind: table, numbering: "1"))

#pagebreak()

#set par(spacing: 1.6em, leading: 1.2em)
#heading("Bibliographie", numbering: none)
#v(2%)
#bibliography("includes/bibliographie.bib", full: true, title: none)

