--[[
image-to-knitr-graphics-filter – change pandoc Image.to R-markdown knitr image
Copyright: © 2022 Abhishek Ulayil
License:   MIT – see LICENSE file for details
--]]



function KnitrBlock(img_src,img_caption,img_title,img_attr)
    local attr_construct='{r ' .. pandoc.utils.stringify(img_title) ..', echo=FALSE , fig.cap='.. pandoc.utils.stringify(img_caption) ..'}'
    local knitr_command='knitr::include_graphics('.. img_src ..')'
    local attributes= pandoc.Attr("", {attr_construct}, {{}}) 
    return pandoc.CodeBlock(knitr_command,attributes)
end

--[[ 
(Legacy function)
This will create a pandoc RawBlock of markdown type,
which the markdown writer will use to transform.
--]]
function markdown(s)
  return pandoc.RawBlock('markdown', s)
end


function Image(img)

  -- CodeBlock method
  local image = KnitrBlock(img.src,img.caption,img.title,img.attr)
  
  -- original Image format
  -- local image = pandoc.Image(img.caption, img.src, img.title, img.attr)
  
  -- alternate way of creating a raw block
  --local attr_construct='```{r' .. img_title ..', echo=FALSE , fig.cap='.. img_caption .. ', fig.subcap='.. img_caption ..', fig.ncol = 2, fig.align="center", out.width=".49\\linewidth"}\n'
  --local knitr_command='knitr::include_graphics('.. pandoc.utils.stringify(img_src) ..')'
  --local image = markdown(attr_construct .. knitr_command..'\n```')
  return image
end
