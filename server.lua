ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('headphone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	
	TriggerClientEvent('esx_headphone:place_headphone', source)
	TriggerClientEvent('esx:showNotification', source, ('You Use HeadPhone Enjoy :)'))
end)


RegisterCommand('headphone', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
	local id = args[1]       
	if xPlayer.getInventoryItem('headphone').count >= 1 then

	TriggerClientEvent('esx_headphone:play',source, id)
	
	else
	TriggerClientEvent('esx:showNotification', source, ('~r~Shoma HeadPhone Nadarid'))
	
    end
end)

RegisterNetEvent('esx_amin:play_musics')
AddEventHandler('esx_amin:play_musics', function(id)

	TriggerClientEvent('esx_headphone:playss',source, id)


end)
