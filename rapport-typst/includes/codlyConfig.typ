#import "@preview/codly:1.0.0": *
#show: codly-init.with()
// Ajouter langages ici pour les blocs de code
#codly(
  zebra-fill: none,
  number-format: none,
  languages: (
    cpp: (
      name: "C++",
      color: rgb("#044F88")
    ),
    glsl: (
      name: "GLSL",
      color: rgb("#044A58")
    ),
    bash: (
      name: "Bash",
      color: gray
    )
  )
)