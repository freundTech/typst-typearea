#import "../typearea.typ": *

#show: typearea.with(
  header-include: true,
  footer-include: true,
  header: block(width: 100%, height: 100%, above: 0pt, below: 0pt, fill: red),
  footer: block(width: 100%, height: 100%, above: 0pt, below: 0pt, fill: blue),
)

#block(width: 100%, height: 100%, above: 0pt, below: 0pt, fill: green)
