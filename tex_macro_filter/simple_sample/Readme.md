# Pandoc Command --from latex

### The issues and results
1. \pkg{} part of the latex source is missing


### full command 

```
pandoc +RTS -K512m -RTS --from latex  example.tex -s --to markdown --output example-latex.md --citeproc --lua-filter ~/Documents/tex-lua-filters/tex_macro_filter/pkg_filter.lua
```

# Pandoc Command --from latex+raw_tex

### The issues and results
1. The filter works which adds the pkg name as raw text
2. But there is a code block around \maketitle command like this 

```{=latex}
\maketitle
```


### full command

```
pandoc +RTS -K512m -RTS --from latex+raw_tex  example.tex -s --to markdown --output example-latex+raw_tex.md --citeproc --lua-filter ~/Documents/tex-lua-filters/tex_macro_filter/pkg_filter.lua 
```

