ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
		end
    end)
	

	
	local playerPed = PlayerPedId(source)
    local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	
RegisterNetEvent('esx_headphone:place_headphone')
AddEventHandler('esx_headphone:place_headphone', function(source)
	setheadphone(source)


end)


RegisterNetEvent('esx_headphone:play')
AddEventHandler('esx_headphone:play', function(source)
        OpenMenu()



end)
------------------------------------



local menuOpen = false
function OpenMenu()
    menuOpen = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Headphone', {
        title   = 'HeadPhone Menu',
        align   = 'top-left',
        elements = {
            {label = ('Play Your Music'), value = 'play'},
            {label = ('Stop Music'), value = 'stop'},
			{label = ('Close Menu'), value = 'close'}
        }
    }, function(data, menu)

        if data.current.value == 'play' then
            play()


        elseif data.current.value == 'close' then
		
            menu.close()
        elseif data.current.value == 'stop' then
		
		    SendNUIMessage({
            transactionType = 'stopSound'
            })

end
   end)
       end

function play()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'play',
        {
            title = ('play'),
        }, function(data, menu)
            TriggerServerEvent('esx_amin:play_musics', data.value)
            menu.close()
        end, function(data, menu)
            menu.close()
        end)
end



RegisterNetEvent('esx_headphone:playss')
AddEventHandler('esx_headphone:playss', function(id)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
	local objCoords = GetEntityCoords(object)
	local distance  = GetDistanceBetweenCoords(coords, coords, true)	
		
   if distance < Config.distance then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionData = id
        })
		
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(100)
                if distance > Config.distance then
                    SendNUIMessage({
                        transactionType = 'stopSound'
                    })
                    break
                end
            end
        end)
end
end)




function distance(object)
    local playerPed = PlayerPedId()
    local lCoords = GetEntityCoords(playerPed)
    local distance  = GetDistanceBetweenCoords(lCoords, object, true)
    return distance
end


function setheadphone(source)
	TriggerEvent('skinchanger:getSkin', function(skin)
	if tonumber(skin.sex) == 0 then
		if Config.Uniforms.male ~= nil then
		TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.male)
		else
				ESX.ShowNotification(('no_outfit'))
		end
	elseif tonumber(skin.sex) == 1 then

			if Config.Uniforms.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.male)
			else
				ESX.ShowNotification(('no_outfit'))
			end
	end
	
	end)
end


