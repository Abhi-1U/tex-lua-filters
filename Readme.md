# Pandoc Lua filters for LaTeX --> Markdown / Rmarkdown
![Pandoc](https://img.shields.io/badge/pandoc-2.15+-red?style=for-the-badge&logo=haskell)
![lua](https://img.shields.io/badge/lua-filter-darkblue?style=for-the-badge&logo=lua)
![Pandoc](https://img.shields.io/badge/license-MIT-black?style=for-the-badge&logo=)

I have worked on some of the filters which try to do certain customizations (filtering) to Pandoc's AST during conversion from LaTeX to Markdown.


These also serve as examples for creating other/similar filters.

## How to use 

append the pandoc command with this option `--lua-filter \path\to\filter` 

## Tested Software versions

1. pandoc 2.18
2. R version 3.6.3 (2020-02-29) -- "Holding the Windsock" / R version 4.0.0 (2020-04-24) -- "Arbor Day"
3. Linux Mint 20.3 x86_64 / Windows 10 21H2
4. kernel 5.4.0-107-generic / Windows kernel
5. Rstudio 2022.07.0 Build 548
6. pdfTeX 3.141592653-2.6-1.40.24 (TeX Live 2022)