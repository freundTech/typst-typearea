#import "../typearea.typ": *

#show: typearea.with(
  width: 100pt,
  height: 100pt,
  div: 5,
  footer-include: false,
  footer-height: 10pt,
  footer-sep: 5pt,
  footer: context [
    #layout(size => [
      #metadata(here().position() + size + (align: align.alignment))<result>
    ])
  ]
)

#metadata((
  page: 1,
  x: 20pt,
  y: 65pt,
  width: 40pt,
  height: 10pt,
  align: start + top,
))<expected>
