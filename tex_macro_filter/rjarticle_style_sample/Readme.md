# Pandoc Command --from latex

### The issues and results
1. \pkg{} part of the latex source is missing
2. the metadata like title,author is also missing which was previously there in the simple tex file

### full command 

```
pandoc +RTS -K512m -RTS --from latex RJwrapper.tex  -s --to markdown --output rjarticle-latex.md --citeproc --lua-filter ~/Documents/tex-lua-filters/tex_macro_filter/pkg_filter.lua
```

# Pandoc Command --from latex+raw_tex

### The issues and results
1. Pandoc freaks out here and avoids linking previous document
2. And it generates output like this
```{=latex}
\sectionhead{Contributed research article}
```
```{=latex}
\volume{XX}
```
```{=latex}
\volnumber{YY}
```
```{=latex}
\year{20ZZ}
```
```{=latex}
\month{AAAA}
```
```{=latex}
\begin{article}
  \input{RJtemplate}
\end{article}
```
### full command

```
pandoc +RTS -K512m -RTS --from latex+raw_tex RJwrapper.tex  -s --to markdown --output rjarticle-latex+raw-tex.md --citeproc --lua-filter ~/Documents/tex-lua-filters/tex_macro_filter/pkg_filter.lua 
```

