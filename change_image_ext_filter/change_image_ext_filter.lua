--[[
change-image-extension-filter – change pandoc Image.src extension from pdf to png
Copyright: © 2022 Abhishek Ulayil
License:   MIT – see LICENSE file for details
--]]

--[[
Removes .pdf from a string and returns it
--]]
function removePDFExtensions(src)
  return src:gsub("%.pdf", "")
end
--[[
Checks for .pdf in a string and returns true or false
--]]
function checkPDFextension(src)
  return src:match("%.pdf")
end
--[[
if image extension is pdf then 
    change .pdf extension to ,png
    create new image block
    return that block
end
otherwise return the original block 
--]]
function Image(img)
  if(checkPDFextension(img.src)) then
    local img_old_src = removePDFExtensions(img.src)
    local new_src = img_old_src .. ".png"
    local image = pandoc.Image(img.caption, new_src, img.title, img.attr)
    return image
  end
  return img
end
