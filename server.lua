local allowed =
{
    "ADMIN",
    "STEAM IDs",
    "GO",
    "HERE"
}

RegisterCommand("jumpscareon", function(source, args)
    -- Usage: /jumpscareon <ID>
    -- Creates a popup on the players screen and starts playing a sound.
    local identifier = GetPlayerIdentifiers(source)[1]
    if checkAllowed(identifier) then
      if args[1] == nil then
        print("^1Error, you must provide a player ID.")
      end
      local target = args[1]
      TriggerClientEvent("jumpscare:toggleNUI", target, true)
    end
end)

RegisterCommand("jumpscareoff", function(source, args)
    -- Usage: /jumpscareoff <ID>
    -- Removes the popup from the players screen.
    local identifier = GetPlayerIdentifiers(source)[1]
    if checkAllowed(identifier) then
        if args[1] == nil then
        print("^1Error, you must provide a player ID.")
        end

        local target = args[1]
        TriggerClientEvent("jumpscare:toggleNUI", target, false)
    end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
    end
    
	return false
end