--[[
CodeBlock filter – Convert a Div block into a CodeBlock
Copyright: © 2022 Abhishek Ulayil
License:   MIT – see LICENSE file for details
--]]

--[[
CodeBlock wrapper for Div block data 
--]]
function CodeBlock(block)
    -- Code attribute for programming language
    local attributes= pandoc.Attr("", {'r'}, {{}})
    -- Replacing SoftBreak with \n and stringifying it
    local code=pandoc.utils.stringify(block.content:walk {SoftBreak  = function(_) return pandoc.Str('\n') end})
   return pandoc.CodeBlock(code,attributes)
end

--[[
These are a list of classes a div tag could have, add/remove your own classes here
--]]
ENV_CLASSES = { 'example', 'example*', 'Sinput', 'Soutput', 'Sin','Sout','Scode'}

--[[ 
(Legacy function)
This will create a pandoc RawBlock of markdown type,
which the markdown writer will use to transform.
--]]
local function markdown(s)
  return pandoc.RawBlock('markdown', s)
end


--[[
Checks the current element against the class list for filteration
--]]
local function get_env_class(elem)
    if elem.classes then
        for i = 1, #elem.classes do
            for j = 1, #ENV_CLASSES do
                if elem.classes[i] == ENV_CLASSES[j] then
                    return ENV_CLASSES[j]
                end
            end
         end
    else
        error('function has_class used on an element of type ' ..elem.t .. ' that cannot have classes.')
    end
end

--[[
This function will walk through all Div elements in pandoc AST and apply CodeBlock only to
class matched elements. 
--]]
function Div(el)
  local env_class = get_env_class(el) -- nil if there is none
  if env_class then -- false if env_class is nil
    -- Using CodeBlock function
    return {CodeBlock(el)}
    --return { markdown('```R\n'), el, markdown('\n```') }
  end
end



