radioSound = {}
addEventHandler("onClientResourceStart", resourceRoot,
	function()
		bindKey("r", "down", clientToggleRadio)
	end
)
addEventHandler("onClientSoundStream", root,
	function(success, length, streamName)
		if streamName then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			if veh then
				if radioSound[veh] == nil then return end
				if radioSound[veh].soundElement == source then
					outputChatBox("#696969R�dio: #22AA22 " .. streamName, 0, 0, 0, true)
				end
			end
		end
	end
)
function pegar_jbl (button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
    triggerServerEvent("one:pegarjbl", getLocalPlayer(), getLocalPlayer(), clickedElement)
end
addEventHandler ( "onClientClick", root, pegar_jbl )
addEventHandler("onClientSoundChangedMeta", root,
	function(streamTitle)
		if streamTitle then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			if veh then
				if radioSound[veh] == nil then return end
				if radioSound[veh].soundElement == source then
					outputChatBox("#696969M�sica: #AA2222 " .. streamTitle, 0, 0, 0, true)
				end
			end
		end
	end
)
addEvent("onServerToggleRadio", true)
addEventHandler("onServerToggleRadio", getLocalPlayer(), 
	function(toggle, url, veh, volume)
		if not isElement(veh) then
			if radioSound[veh] ~= nil then
				stopSound(radioSound[veh].soundElement)
				radioSound[veh].soundElement = nil
			end
			return
		end
		
		if toggle == true then
			local x, y, z = getElementPosition(veh)
            print(radioSound[veh])
			if radioSound[veh] ~= nil then
				stopSound(radioSound[veh].soundElement)
                
				local sound = playSound3D(url, x, y, z)
				if volume ~= nil then
					setSoundVolume(sound, volume)
				end
				setSoundMinDistance(sound, 5.0)
				setSoundMaxDistance(sound,10.0)
				attachElements(sound, veh)
				
				radioSound[veh] = { }
				radioSound[veh].soundElement = sound
			else
				local sound = playSound3D(url, x, y, z)
                print('entrei??')
				if volume ~= nil then
					setSoundVolume(sound, volume)
				end
				setSoundMinDistance(sound, 5.0)
				setSoundMaxDistance(sound, 10.0)
				attachElements(sound, veh)
				
				radioSound[veh] = { }
				radioSound[veh].soundElement = sound
			end
		else
			if radioSound[veh] ~= nil then
				stopSound(radioSound[veh].soundElement)
				radioSound[veh].soundElement = nil
			end
		end
	end
)
addEvent("onServerRadioURLChange", true)
addEventHandler("onServerRadioURLChange", getLocalPlayer(), 
	function(newurl, veh, volume)
		if radioSound[veh] ~= nil then
			stopSound(radioSound[veh].soundElement)
		
			local x, y, z = getElementPosition(veh)
            print(x,y,z)
			local sound = playSound3D(newurl, x, y, z)
			if volume ~= nil then
				setSoundVolume(sound, volume)
			end
			setSoundMinDistance(sound, 5)
			setSoundMaxDistance(sound, 10.0)
			attachElements(sound, veh)
		
			radioSound[veh] = { }
			radioSound[veh].soundElement = sound
		end
	end
)
addEvent("onServerVolumeChangeAccept", true)
addEventHandler("onServerVolumeChangeAccept", getLocalPlayer(), 
	function(veh, newVolume)
		if veh then
			if radioSound[veh] ~= nil then
				setSoundVolume(radioSound[veh].soundElement, newVolume)
			end
		end
	end
)
function clientToggleRadio()
	triggerServerEvent("onPlayerToggleRadio", getLocalPlayer())
end