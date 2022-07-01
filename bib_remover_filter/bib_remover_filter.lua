--[[
bib-remover-filter – remove \thebibliography of latex source file
Copyright: © 2022 Abhishek Ulayil
License:   MIT – see LICENSE file for details
--]]

--[[
Creates an empty Block for Div with class 'thebibliography'
--]]
function Div(el)
    if el.classes[1] == 'thebibliography' then
        return { }
    end
end 
