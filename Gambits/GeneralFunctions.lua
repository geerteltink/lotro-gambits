function Debug(o)
    if o == nil or o == "" then
        return
    end
    Turbine.Shell.WriteLine("<rgb=#FF5555>" .. Dump(o) .. "</rgb>");
end

-- Dump table function for checking tables on the fly ---------------
function Dump(o)
    if type(o) == 'table' then
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '  [' .. k .. '] = ' .. Dump(v) .. '\n'
        end
        return s .. '}\n'
    else
        return tostring(o)
    end
end

function RGBA(r, g, b, a)
    r = r / 255;
    g = g / 255;
    b = b / 255;

    return Turbine.UI.Color(a, r, g, b);
end
