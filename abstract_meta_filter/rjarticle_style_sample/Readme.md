# Pandoc Command --to native

### The issues and results
1. \abstract{} part of the latex source is missing in ast itself

### full command 

```
pandoc +RTS -K512m -RTS RJtemplate.tex --to native --output rjtemplate-ast.txt -s --lua-filter ~/Documents/tex-lua-filters/abstract_meta_filter/abstract-to-meta.lua  --citeproc
```

# Pandoc Command --to markdown

### The issues and results
1. The same result
### full command

```
pandoc +RTS -K512m -RTS RJtemplate.tex --to markdown --output rjtemplate.md -s --lua-filter ~/Documents/tex-lua-filters/abstract_meta_filter/abstract-to-meta.lua  --citeproc
```

