--- Checks if an item is present in a list.
-- @param list table	- The table to be searched.
-- @param item any		- The item to search for in the table.
-- @return bool 		- Returns true if the item is found, otherwise returns false.
function Contains(list, item)
    for i, object in ipairs(list) do
        if object == item then
            return true
        end  
    end
    return false
end


--- Retrieves the index of a specified item within a list.
-- @param list table  - The table to be searched.
-- @param item any    - The item whose index is to be found.
-- @return integer    - Returns the index of the item if found, otherwise nil.
function GetIndex(list, item)
    for i, object in ipairs(list) do
        if object == item then
            return i
        end
    end
end

--- Retrieves the key associated with a specified item in a map.
-- @param map table   - The map to be searched.
-- @param item any    - The item whose key is to be found.
-- @return key        - Returns the key of the item if found, otherwise nil.
function GetKey(map, item)
    for key, object in pairs(map) do
        if object == item then
            return key
        end
    end
    return nil
end

--- Extracts the UUID from a unique map key.
-- @param uniqueMapkey string - The unique map key that contains a UUID.
-- @return string             - Returns the UUID extracted from the end of the unique map key.
function GetUUID(uniqueMapkey)
    if uniqueMapkey then
        local startPosition = #uniqueMapkey - 35
        local uuid = string.sub(uniqueMapkey, startPosition)
        return uuid
    end
end

--- Retrieves the name portion from a unique map key.
-- @param uniqueMapkey string - The unique map key from which the name is to be extracted.
-- @return string             - Returns the name portion extracted from the unique map key, before the UUID.
function GetNameByUniqueMapkey(uniqueMapkey)
    local endPosition = #uniqueMapkey - 37
    local strippedString = string.sub(uniqueMapkey, 1, endPosition)
    return strippedString
end


--- Retrieves the value of a specified property from an object or returns a default value if the property doesn't exist.
-- @param obj           The object from which to retrieve the property value.
-- @param propertyName  The name of the property to retrieve.
-- @param defaultValue  The default value to return if the property is not found.
-- @return              The value of the property if found; otherwise, the default value.
function GetPropertyOrDefault(obj, propertyName, defaultValue)
    local success, value = pcall(function() return obj[propertyName] end)
    if success then
        return value or defaultValue
    else
        return defaultValue
    end
end


-- Checks if the substring 'sub' is present within the string 'str'.
-- @param str string 	-  The string to search within.
-- @param sub string 	- The substring to look for.
-- @return bool			- Returns true if 'sub' is found within 'str', otherwise returns fals
function StringContains(str, sub)
    -- Make the comparison case-insensitive
    str = str:lower()
    sub = sub:lower()
    return (string.find(str, sub, 1, true) ~= nil)
end


-- Helper function to convert a list to a set
-- @param list 		- the list to be converted
-- @return 			- set from list
function ListToSet(list)
    local set = {}
    for _, v in ipairs(list) do
        set[v] = true
    end
    return set
end
