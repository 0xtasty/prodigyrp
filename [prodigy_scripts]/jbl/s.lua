jbl = {}
local radioStreams = 0
local settingStreamLimit = 5
defaultRadio = "https://server1.mtabrasil.com.br/youtube/play?id=V3P_JWyMbgA"
addEventHandler("onResourceStart", resourceRoot,
	function()	
		for i,thePlayer in ipairs(getElementsByType("player")) do
			jbl[thePlayer] = { }
            jbl[thePlayer].segurando = false
            jbl[thePlayer].objeto = false
			jbl[thePlayer].radio = false
            jbl[thePlayer].owner = thePlayer
			jbl[thePlayer].radioStation = defaultRadio
			jbl[thePlayer].volume = 0.1
		end
	end
)
function criarjbl (thePlayer)
    if not jbl[thePlayer].objeto then
        bindKey(thePlayer,"n", "down", largarjbl )
        local x,y,z = getElementPosition(thePlayer)
        jbl[thePlayer].objeto = createObject ( 2226, x,y,z)
        jbl[thePlayer].segurando = true
        exports.bone_attach:attachElementToBone(jbl[thePlayer].objeto,thePlayer,12, 0,-0.08,0.38,200,0,0)
    else
        unbindKey(thePlayer,"n", "down", largarjbl )
        jbl[thePlayer].segurando = false
        exports.bone_attach:detachElementFromBone(jbl[thePlayer].objeto)
        destroyElement(jbl[thePlayer].objeto)
        jbl[thePlayer].objeto = false
    end
end
addCommandHandler('jbl', criarjbl)
function largarjbl (thePlayer)
    local px, py, pz = getElementPosition ( thePlayer )
    unbindKey(thePlayer,"n", "down", largarjbl )
    if jbl[thePlayer].objeto then
        if jbl[thePlayer].segurando then
            jbl[thePlayer].segurando = false
            showCursor(thePlayer, false)
            setElementRotation(jbl[thePlayer].objeto, 0,0,0)
            setElementPosition(jbl[thePlayer].objeto, px, py, pz - 0.86)
            exports.bone_attach:detachElementFromBone(jbl[thePlayer].objeto)
        end
    end
end
function pegarjbl (thePlayer, clickedElement)
    local px, py, pz = getElementPosition(thePlayer)
    local jx, jy, jz = getElementPosition(jbl[thePlayer].objeto)
    local distance = getDistanceBetweenPoints3D(px, py, pz, jx, jy, jz)
    if jbl[thePlayer].objeto then
        if clickedElement == jbl[thePlayer].objeto then
            if not jbl[thePlayer].segurando then
                if distance <= 1.5 then
                    bindKey(thePlayer,"n", "down", largarjbl )
                    jbl[thePlayer].segurando = true
                    exports.bone_attach:attachElementToBone(jbl[thePlayer].objeto,thePlayer,12, 0,-0.08,0.38,200,0,0)
                else
                    outputChatBox('Muito distante, chegue mais perto da caixa para pega-la', thePlayer)
                end
            end
        end
    end
end
addEvent("one:pegarjbl", true)
addEventHandler("one:pegarjbl", root, pegarjbl)
function toggleRadio(thePlayer)
    print(jbl[thePlayer].objeto)
	local veh = jbl[thePlayer].objeto
	if veh then
		if jbl[thePlayer].radio == false then
            print('entrei?')
			local idleTime = 100
			local x, y, z = getElementPosition(thePlayer)
			jbl[thePlayer].radio = true
			jbl[thePlayer].lastTick = getTickCount()
			jbl[thePlayer].turnedOnBy = getPlayerName(thePlayer)
			--jbl[thePlayer].radioMarker = createMarker(x, y, z, "corona", 0.05, 255, 0, 0)
			--attachElements(jbl[thePlayer].radioMarker, jbl[thePlayer].objeto)
			jbl[thePlayer].idleTimer = setTimer(radioIdleTimer, idleTime, 0, jbl[thePlayer].objeto)
			
			radioStreams = radioStreams + 1
            local x, y, z = getElementPosition(veh)
            print(x,y,z)
            print('aa')
			outputServerLog(getPlayerName(thePlayer) .. " has turned the radio on in his thePlayericle (streams: " .. radioStreams .. ")")

            triggerClientEvent("onServerToggleRadio", root, true, jbl[thePlayer].radioStation, jbl[thePlayer].objeto, jbl[thePlayer].volume)
		else
            print('tchau')
			jbl[thePlayer].radio = false
			killTimer(jbl[thePlayer].idleTimer)
			triggerClientEvent("onServerToggleRadio", root, false, nil, jbl[thePlayer].objeto, jbl[thePlayer].volume)
			radioStreams = radioStreams - 1
			outputServerLog(getPlayerName(thePlayer) .. " has turned the radio off in his thePlayericle (streams: " .. radioStreams .. ")")
		end
	end
end
function radioIdleTimer(veh)
	if not get("radioIdlePlayerDistanceCheck") then return end
	local settingDist = get("radioIdlePlayerDistanceCheck")
	
	if veh then		
		if g_VehicleList[veh] ~= nil then
			if g_VehicleList[veh].radio == true then
				local playerInRange = false

				local vx, vy, vz = getElementPosition(veh)
				for i,player in ipairs(getElementsByType("player")) do
					local px, py, pz = getElementPosition(player)
					local distance = getDistanceBetweenPoints3D(vx, vy, vz, px, py, pz)
					if distance ~= false and distance < settingDist then
						playerInRange = true
					end
				end
				
				if playerInRange == false then
					triggerClientEvent("onServerToggleRadio", root, false, nil, veh)
					g_VehicleList[veh].radio = false
					destroyElement(g_VehicleList[veh].radioMarker)
					killTimer(g_VehicleList[veh].idleTimer)
					if radioStreams ~= 0 then
						radioStreams = radioStreams - 1
					end
				
					outputServerLog("An " .. getVehicleName(veh) .. "'s radio has been idled (streams: " .. radioStreams .. ")")
				end
			end
		end
	end
end
addEvent("onPlayerToggleRadio", true)
addEventHandler("onPlayerToggleRadio", root,
	function()
		if source and getElementType(source) == "player" then
			toggleRadio(source)
		end
	end
)
function changejblradio(thePlayer, commandName, url)
	local veh = jbl[thePlayer].objeto
	if veh then
        if not url then
            outputChatBox("Usage: /setradio newurl", thePlayer, 255, 255, 255)
            return
        end
        if jbl[thePlayer].owner == thePlayer then
            jbl[thePlayer].radioStation = url
            if jbl[thePlayer].radio == true then
                triggerClientEvent("onServerRadioURLChange", root, jbl[thePlayer].radioStation, jbl[thePlayer].objeto, jbl[thePlayer].volume)
            end
            outputChatBox("você alterou a musica da JBL", thePlayer, 255, 255, 255, true)
        end
	else
        outputChatBox("Você não possuí nenhuma JBL", thePlayer)
    end
end
addCommandHandler("setjbl", changejblradio)