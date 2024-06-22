function data()
return {
    info = {
        minorVersion = 0,
        severityAdd = "NONE",
        severityRemove = "WARNING",
        name = _("mod_name"),
        description = _("mod_desc"),
        authors = {
            {
                name = "ModWerkstatt",
                role = "CREATOR",
            },
        },
        tags = { "europe", "germany", "bahn", "skoday", "dostos", "coach", "nim" },
        params = {
            {
                key = "show_single_cars",
                name = _("Show single cars?"),
                uiType = "CHECKBOX",
                values = { "No", "Yes", },
                defaultIndex = 0,
                tooltip = _("Show only fixed combination or also cars separately?"),
            },
        },
    },

    runFn = function (settings, modParams)
    local function SingleCarModifier(fileName, data)
        if data.metadata and data.metadata.skoda_dosto and data.metadata.transportVehicle and data.metadata.transportVehicle.multipleUnitOnly then
            data.metadata.transportVehicle.multipleUnitOnly = false
        end
        return data
    end

    if modParams[getCurrentModId()] ~= nil then
    	local params = modParams[getCurrentModId()]
      	if params["show_single_cars"] == 1 then
        	addModifier("loadModel", SingleCarModifier)
        end
    else
      	addModifier("loadModel", SingleCarModifier)
    end
end
}
end
