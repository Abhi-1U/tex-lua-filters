--[[
Bookdown Math Equation  Filter – Add Bookdown style equation numbering and labels from LaTeX
format \label{eq:xyz} to bookdown format (\#eq:xyz)
pandoc generated sample : $$\label{eq:EB} LE = R_n - G - H$$
filter generated equation : $$\label{eq:EB} LE = R_n - G - H(\#eq:EB)$$
Conversion type : LaTeX --> Markdown
Copyright: © 2022 Abhishek Ulayil
License:   MIT – see LICENSE file for details
--]]
-- table to store all equation labels
equation_labels = {}
--[[
Converts LaTeX label to bookdown label format in the Math element
--]]
function Math(el)
    if el.text:match('label') then
        local text = pandoc.utils.stringify(el.text)
        s, e, l =string.find(text,"\\label{(.-)}")
        table.insert(equation_labels,l)
        -- Bookdown does not support period in equations hence substituting them as hyphen
        l = string.gsub(l, "%.", "-")
        el.text = text .. [[(\#]] .. l .. [[)]]
    else
        --pass
    end
    return(el)
end

--[[
Converts Links to equations to modified format
--]]
function Link(el)
    is_bkdwn = false
    for _,label in pairs(equation_labels) do
        if ("#"..label) == el.target then
            print(label)
            local link_text = el.target
            -- Bookdown does not support period in equations hence substituting them as hyphen
            link_text = string.gsub(link_text, "%.", "-")
            label = string.gsub(label, "%.", "-")
            el.target = link_text
            --bookdown type reference constructor
            bkdwn = [[\@ref(]] .. label .. [[)]]
            is_bkdwn = true
            break
        end
    end
    if is_bkdwn then
        return pandoc.RawInline('markdown', bkdwn)
    else
        return(el)
    end
end
