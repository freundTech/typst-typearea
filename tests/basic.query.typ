#import "../typearea.typ": *

#show: typearea.with(
  width: 100pt,
  height: 100pt,
  div: 10,
)

#context [
  #layout(size => [
    #metadata(here().position() + size)<result>
  ])
]

#metadata((
  page: 1,
  x: 10pt,
  y: 10pt,
  width: 70pt,
  height: 70pt,
))<expected>
