#import "../typearea.typ": *

#show: typearea.with(
  width: 100pt,
  height: 100pt,
  div: 10,
  header-include: true,
  header-height: 10pt,
  header-sep: 5pt,
)

#context [
  #layout(size => [
    #metadata(here().position() + size)<result>
  ])
]

#metadata((
  page: 1,
  x: 10pt,
  y: 25pt,
  width: 70pt,
  height: 55pt,
))<expected>
