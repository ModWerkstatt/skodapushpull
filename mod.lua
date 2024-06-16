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
	      },
        },
	},

	runFn = function (settings, modParams)
      local function legacyFilter(fileName, data)
        if data.metadata.transportVehicle.multipleUnitOnly then
            data.metadata.transportVehicle.multipleUnitOnly = false
        end
		    return data
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["show_single_cars"] == 1 then
				addModifier("loadModel", legacyFilter)
			end

      else
			addModifier("loadModel", legacyFilter)
     end
	end
	}
end
