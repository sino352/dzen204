DB = {
    storage = {}
}

function DB:readDBTable(tableName)
    print("DB:readDBTable(tableName) tableName", tableName)
    local f = dofile(Config.scriptFolder.."DB/" .. tableName .. ".luatable")
    local loadedTable = self.storage[tableName];
    return loadedTable;
end

function DB:saveDBTable(tableName, tableData)
    print("DB:saveDBTable() tableName, tableData", tableName, tableData)
    local strData = "DB.storage." .. tableName .. " = " .. tableToString(tableData)
    WriteFile(Config.scriptFolder.."DB/" .. tableName .. ".luatable", strData)
end


