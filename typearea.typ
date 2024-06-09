#let typearea(
  div: 9,
  bcor: 0mm,
  two-sided: true,
  font-size: 11pt,
  header-include: false,
  footer-include: false,
  header-height: 1.25em,
  header-sep: 1.5em,
  footer-height: 1.25em,
  footer-sep: 1.5em,
  ..rest,
  body
) = {
  if div < 4 {
    panic("div must be at least 4. Was " + div)
  }
  let width = 100% - bcor
  let height = 100%
  let content-height = height / div * (div - 3)
  let header-space = header-height + header-sep

  let overwrite = (:)
  if "header" in rest.named() {
    overwrite.insert(
      "header", 
      block(
        above: 0pt,
        below: 0pt,
        breakable: false,
        height: header-height,
        rest.named().at("header"),
      )
    )
  }

  set page(
    ..rest,
    ..overwrite,
    header-ascent: header-sep,
    margin: if two-sided {
      (
        "top": height / div  +  if header-include { header-space } else { 0pt },
        "bottom": height / div * 2,
        "inside": width / div + bcor,
        "outside": width / div * 2,
      )
    // Auto currently defaults to left, as there is no way to check the text language
    } else if rest.named().at("binding", default: auto) != right {
      (
        "top": height / div,
        "bottom": height / div * 2,
        "left": width / div * 1.5 + bcor,
        "right": width / div * 1.5,
      )
    } else {
      (
        "top": height / div,
        "bottom": height / div * 2,
        "left": width / div * 1.5,
        "right": width / div * 1.5 + bcor,
      )

    }
  )

  body
}

