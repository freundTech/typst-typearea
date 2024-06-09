#import "../typearea.typ": *

#show: typearea.with(
  width: 110pt,
  height: 100pt,
  div: 10,
  binding-correction: 10pt,
)

#context [
  #layout(size => [
    #metadata(here().position() + size)<result>
  ])
]

#metadata((
  page: 1,
  x: 20pt,
  y: 10pt,
  width: 70pt,
  height: 70pt,
))<expected>
