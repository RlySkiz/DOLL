-- get index by item directly
function getIndex(list, item)
    for i, object in ipairs(list) do
        if object == item then
            return i
        end
    end
end

-- for tables
function contains(list, item)
    for i, object in ipairs(list) do
        if object == item then
            return true
        end  
    end
    return false
end


-- for maps
function containsValue(map, item)
    for key, object in pairs(map) do
        if object == item then
            return true
        end
    end
    return false
end


-- gets uuid from the end
function getUUID(uniqueMapkey)

    if uniqueMapkey then
            local startPosition = #uniqueMapkey - 35
            local uuid = string.sub(uniqueMapkey, startPosition)
            return uuid
    end
end

function getNameByUniqueMapkey(uniqueMapkey)
    local endPosition = #uniqueMapkey - 37
    local strippedString = string.sub(uniqueMapkey, 1, endPosition)
    return strippedString
end