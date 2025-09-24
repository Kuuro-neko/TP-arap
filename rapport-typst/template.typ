// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let numberingH(c)={
  return numbering("1.",..counter(heading).at(c.location()))
}

#let currentH(level: 1)={
  let elems = query(selector(heading.where(level: level)).after(here()))

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    if numberingH(elems.first()) != "0." {
      return [#numberingH(elems.first()) #elems.first().body] 
    } else {
      return [#elems.first().body] 
    }
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return [#numberingH(elems.last()) #elems.last().body] 
    }
  }
  return ""
}

#let project(
  fds: "Faculté des sciences de Montpellier",
  title: "",
  secondarytitle :"",
  doctitle :"",
  authors: (),
  encadrants: (), 
  ate : datetime.today,
  body
) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set heading(numbering: "1.1)") // Style de numérotation
  set text(font: "New Computer Modern", lang: "fr") // Style de texte
  show math.equation: set text(weight: 400) // Style des maths
  set page(
    numbering: none,
    number-align: center,

    // Style des headers
    header: context{
    // Only display the header if we are past the first page
      if counter(page).get().first() > 1 {
          align(end, currentH())
          line(length: 100%)
      }
    }
  )
  
  // Style des tableaux avec bordures
  set table( 
    fill: (x, y) =>
      if x == 0 or y == 0 {
        gray.lighten(60%)
      } else {
        if (x > 0 and calc.rem(y,2) == 0) {
          gray.lighten(90%)
        }
      },
  )
  // ======= MISE EN FORME PAGE DE GARDE =============
  v(0.6fr)
  grid(
      columns: (1fr,1fr),     // 2 means 2 auto-sized columns
      gutter: 20mm,    // space between columns
      align(right, image("assets/fds.jpg", width: 50%)),
      align(left, image("assets/um.png", width: 50%)),
  )
  v(1fr)
  align(center,text(2em, weight: 500, fds))
  v(1fr)
  align(center,text(2em, weight: 500, doctitle))
  v(1fr)
  line(length: 100%)
  align(center,text(2em, weight: 700, secondarytitle))
  line(length: 100%)
  v(1fr)
  grid(
    columns: (2fr, 1fr),
    gutter: 1em,
      text(size: 1.5em, authors.at(0), weight: 700),
      align(end,text(size: 1.5em, encadrants.at(0), weight: 700)),
      text(size: 1.2em, authors.at(1), weight: 500),
      align(end,text(size: 1.2em, encadrants.at(1), weight: 500)),
      text(size: 1.2em, authors.at(2), weight: 500),
      align(end,text(size: 1.2em, encadrants.at(2), weight: 500)),
      text(size: 1.2em, authors.at(3), weight: 500),
      align(end,text(size: 1.2em, encadrants.at(3), weight: 500)),
  )
  text("Template created by Gilles Gonzalez Oropeza", fill: white)
  v(1fr)
  align(center, text(1.5em,datetime.today().display()))
  pagebreak()
  set cite(style: "alphanumeric")
  set page(numbering: "1")
  counter(page).update(1)
  body
}