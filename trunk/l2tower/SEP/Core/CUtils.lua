-- CUtils
function dump(t)
    local res = tableToString(t)

    RAW_OUT = RAW_OUT .. res
    return res
end

function tableToString(t, shift, dumpedTables)
    shift = shift or 0;
    dumpedTables = dumpedTables or {};
    local res;

    if "table" == type(t) then
        if not dumpedTables[t] then
            dumpedTables[t] = true;
            res = {"{\n"};
            shift = shift + 1;
            local shiftOut = string.rep("    ", shift);
            for key, val in pairs(t) do
                local keyOut = "table" == type(key) and tostring(key) or key;
                local valOut = tableToString(val, shift, dumpedTables)
                table.insert(res, string.format("%s[%s] = %s;\n", shiftOut, keyOut, valOut));
            end
            shift = shift - 1;
            table.insert(res, string.format("%s}", shiftOut));
            return table.concat(res, "")
        end
    elseif "number" == type(t) or "boolean" == type(t) then
        return tostring(t) -- numbers here can be represented as decimals by string.format("$f.4", t)
    elseif "string" == type(t) then
        return "\"" .. t .. "\""
    end

    return ""
end


function inc(obj, index)
    obj[index] = obj[index] + 1
    return obj[index];
end
function dec(a)
    a = a + 1
    return a;
end

function IsPointInRect(pX, pY, rectX, rectY, rectW, rectH)
    return (pX > rectX and pX < (rectX + rectW))
        and (pY > rectY and pY < (rectY + rectH))
end

function SetColor(color)
    if "black" == color then
        love.graphics.setColor( 0, 0, 0, 255 )
    elseif "white" == color then
        love.graphics.setColor( 255, 255, 255, 255 )
    elseif "mapGeneral" == color then
        love.graphics.setColor( 255, 128, 255, 255 )
    end
end

function WriteFile(file, str)
    print(file, str)
    local f, err = io.open(file, "a+")
    f:write(str)
    f:flush()
    f:close()
end

function scandir(dirname)
        callit = os.tmpname()
        os.execute("dir /B "..dirname .. " >"..callit)
        f = io.open(callit,"r")
        rv = f:read("*all")
        f:close()
        os.remove(callit)

        tabby = {}
        local from  = 1
        local delim_from, delim_to = string.find( rv, "\n", from  )
        while delim_from do
                table.insert( tabby, string.sub( rv, from , delim_from-1 ) )
                from  = delim_to + 1
                delim_from, delim_to = string.find( rv, "\n", from  )
                end
        -- table.insert( tabby, string.sub( rv, from  ) )
        -- Comment out eliminates blank line on end!
        return tabby
        end




