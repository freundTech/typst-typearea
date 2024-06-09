#import "../typearea.typ": *

#show: typearea.with(
  width: 100pt,
  height: 100pt,
  div: 5,
  header-include: false,
  header-height: 10pt,
  header-sep: 5pt,
  bcor: 0pt,
  header: context [
    #layout(size => [
      #metadata(here().position() + size)<result>
    ])
  ]
)

#metadata((
  page: 1,
  x: 20pt,
  y: 5pt,
  width: 40pt,
  height: 10pt,
))<expected>
