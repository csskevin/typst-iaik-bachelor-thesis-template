# IAIK Master's Project Template

Install with
```sh
git clone https://github.com/ecomaikgolf/typst-iaik-master-project-template   ~/.local/share/typst/packages/local/iaik-master-project-template/1.0.0
```

Init project with template
```sh
typst init @local/iaik-master-project-template:1.0.0
```

Use template with import statement
```typst
#import "@local/iaik-master-project-template:1.0.0": conf
#show: conf.with(
  title: "Your Title",
  author: "Your Name",
  keywords: ("Side-Channel", "Hardware"),
  supervisors: ("Supervisor Name", "Maybe another supervisor"),
  institute: "Institute of Applied Information Processing and Communications",
  university: "Graz University of Technology",
  curriculum: "Curriculum Name",
  location_date: "Graz, Month Year",
  abstract: [
   #lorem(400)
  ]
)

#outline()
#pagebreak()

= Introduction
#lorem(200)
```
