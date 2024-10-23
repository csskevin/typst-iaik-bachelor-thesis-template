// ----------------------------
// TEMPLATE
#let conf(
  title: "",
  author: "",
  keywords: (),
  supervisors: (),
  institute: "",
  university: "",
  curriculum: "",
  abstract: none,
  location_date: "Graz, Month Year",
  doc
) = {
  // ----------------
  // Document Default Style
  // ----------------
  set document(
    title: title,
    author: author,
    keywords: keywords
  )

  set text(
    font: "New Computer Modern",
    size: 11pt,
    hyphenate: false
  )

  show raw: set text(size: 11pt)

  set par(spacing: 0.55em, leading: 0.55em, first-line-indent: 1.8em, justify: true)
  show figure: set par(justify: false)
  show raw: set text(font: "New Computer Modern Mono")
  show heading: set block(above: 1.4em, below: 1em)

  set list(tight: false, spacing: 15pt)
   
  show heading.where(level: 1): set block(below: 30pt)
  show heading.where(level: 1): set text(size: 20.74pt)

  show heading.where(level: 2): set block(below: 20pt)
  show heading.where(level: 2): set text(size: 14.4pt)

  show heading.where(level: 3): set block(below: 15pt)
  show heading.where(level: 3): set text(size: 12pt)

  show heading.where(level: 4): set heading(numbering: none)
  show heading.where(level: 4): set text(size: 10.95pt)

  // ("test") gets interpreted as string
  // ("test",) gets interpreted as array
  // We therefore convert ("test") to ("test",) so we can use in
  //  for array manipulation functions
  let str_to_array(content) = {
    if type(content) == str { return (content,) }
    else if type(content) == array { return content }
    else { panic("Type " + type(content) + " provided. Only str or array types are allowed.") }
  }
  // ----------------
  // COVER PAGE
  // ----------------

  set page(
    paper: "a4",
    margin: (
      top: 82.2pt,
      bottom: 151.65pt
    )
  )

  set heading(numbering: none)
  set align(center)

  block(grid(
    columns: (20%, 60%, 20%), 
    align: (left, center, right), 
    inset: (0pt, (y: 42pt), (y: 25.5pt)),
    image("assets/iaik.svg", height: 107pt), 
    text(
      size: 8.5pt, font: "Noto Sans", tracking: 3.5pt, ("SCIENCE", "PASSION", "TECHNOLOGY").join(box(
        width: 30pt, height: 3.5pt, align(center, square(size: 2pt, fill: black)),
      )
    ),
    ), 
    image("assets/logo.svg", width: 80pt),
  ), below: 47pt)
  block(text(author, size: 14pt), below: 50.1pt)
  block(text(title, weight: "bold", size: 18pt), below: 35.4pt)

  set align(center + bottom)
  block(text("BACHELOR'S THESIS", weight: "bold"), below: 10pt)
  block(text("Bachelor's degree programme: " + curriculum), below: 44pt)
  // block(text(if str_to_array(supervisors).len() > 1 [Supervisors] else [Supervisor], size: 10pt, weight: "bold"), below: 11pt)
  str_to_array(supervisors).map(supervisor => block(text(supervisor), above: 7pt, below: 0pt)).join("")
  v(13pt)
  block(text(institute), below: 7pt)
  block(text(university), below: 51pt)
  block(text(location_date, size: 8pt))


  // ----------------
  // GENERAL PAGE
  // ----------------

  set align(left + top)
  set page(
    paper: "a4",
    margin: (
      left: 1in + 17pt,
      top: 154pt,
      right: 1in + 17pt,
      bottom: 1in + 88pt
    ),
    numbering: "1"
  )
  
  heading("Abstract", level: 1)
  block(text(abstract), below: 20pt)
  set par(first-line-indent: 0pt)  
  text("Keywords: ", weight: "bold")
  text(str_to_array(keywords).join([ $dot$ ]))

  set heading(numbering: "1.1")

  set cite(
    style: "alphanumeric"
  )

  pagebreak()
  text(doc)
}

