# Pandoc Command --to native

### The issues and results
1. \abstract{} is missing from the metadata in the ast itself
2. I dont expect the filter to work in this case as it is suppossed to work on AST.

### full command 

with filter
```
pandoc +RTS -K512m -RTS example.tex --to native --output example-ast.txt -s --lua-filter ~/Documents/tex-lua-filters/abstract_meta_filter/abstract-to-meta.lua  --citeproc
```

without filter
```
pandoc +RTS -K512m -RTS example.tex --to native --output example-ast.txt -s  --citeproc 
```
# Pandoc Command --to markdown

### The issues and results
1. The result is the same

### full command

```
pandoc +RTS -K512m -RTS example.tex --to markdown --output example.md -s --lua-filter ~/Documents/tex-lua-filters/abstract_meta_filter/abstract-to-meta.lua  --citeproc
```

# Pandoc Command -t gfm

### The issues and results
1. The result is no different


With filter
```
pandoc +RTS -K512m -RTS example.tex --output example-gfm-wf.md   -s -t gfm --lua-filter ~/Documents/tex-lua-filters/abstract_meta_filter/abstract-to-meta.lua  --citeproc 
```

without filter
```
pandoc +RTS -K512m -RTS example.tex --output example-gfm.md   -s -t gfm --citeproc
```


