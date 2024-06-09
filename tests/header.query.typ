#import "../typearea.typ": *

#show: typearea.with(
  width: 100pt,
  height: 100pt,
  div: 5,
  header-include: false,
  header-height: 10pt,
  header-sep: 5pt,
  header: context [
    #layout(size => [
      #metadata(here().position() + size + (align: align.alignment))<result>
    ])
  ]
)

#metadata((
  page: 1,
  x: 20pt,
  y: 15pt, // Because the header is align(bottom) our y position includes the height of the header
  width: 40pt,
  height: 10pt,
  align: start + bottom,
))<expected>
