--[[
Bookdown Math Equation  Filter – Add Bookdown style equation numbering and labels from LaTeX
format \label{eq:xyz} to bookdown format (\#eq:xyz)
pandoc generated sample : $$\label{eq:EB} LE = R_n - G - H$$
filter generated equation : $$\label{eq:EB} LE = R_n - G - H(\#eq:EB)$$
Conversion type : LaTeX --> Markdown
Copyright: © 2022 Abhishek Ulayil
License:   MIT – see LICENSE file for details
--]]

--[[
Converts LaTeX label to bookdown label format in the Math element
--]]
function Math(el)
    if el.text:match('label') then
        local text = pandoc.utils.stringify(el.text)
        s, e, l =string.find(text,"\\label{(.-)}")
        el.text = text .. [[(\#]] .. l .. [[)]]
    else
        --pass
    end
    return(el)
end