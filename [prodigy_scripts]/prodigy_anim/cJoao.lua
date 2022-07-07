local screen = {guiGetScreenSize()}
local x, y = (screen[1]/1366), (screen[2]/768)

local font = dxCreateFont("files/fonts/Roboto-Regular.ttf", x*10)
local font2 = dxCreateFont("files/fonts/Roboto-Regular.ttf", x*10, false, "cleartype_natural")
local font3 = dxCreateFont("files/fonts/Roboto-Regular.ttf", x*13, false, "cleartype_natural")

local proxPage = 0
local selectButton = 0
local selectAnim = 0
local selectFav = {}
local buttonSelect = nil
local proxPageSelect = 0

playersAnim = {}

local Buttons = {
    {x * 21, y * 262, x * 301, y * 37},
    {x * 21, y * 303, x * 301, y * 37},
    {x * 21, y * 344, x * 301, y * 37},
    {x * 21, y * 384, x * 301, y * 37},
    {x * 21, y * 425, x * 301, y * 37},
    {x * 21, y * 466, x * 301, y * 37},
    {x * 21, y * 507, x * 301, y * 37},
}

local ButtonsIcon = {
    {x * 281, y * 269, x * 24, y * 24},
    {x * 281, y * 309, x * 24, y * 24},
    {x * 281, y * 350, x * 24, y * 24},
    {x * 279, y * 391, x * 26, y * 26},
    {x * 279, y * 432, x * 24, y * 24},
    --{x * 275, y * 471, x * 36, y * 28},
    {x * 279, y * 471, x * 24, y * 24},
}

local ButtonsName = {
    {x * 26, y * 267, x * 201, y * 294},
    {x * 26, y * 308, x * 201, y * 335},
    {x * 26, y * 349, x * 201, y * 376},
    {x * 26, y * 390, x * 201, y * 417},
    {x * 26, y * 431, x * 201, y * 458},
    {x * 26, y * 472, x * 201, y * 499},
    {x * 26, y * 513, x * 201, y * 540},
}

local ButtonsAnim = {
    {x  * 334, y * 262, x * 435, y * 38},
    {x  * 334, y * 303, x * 435, y * 38},
    {x  * 334, y * 344, x * 435, y * 38},
    {x  * 334, y * 384, x * 435, y * 38},
    {x  * 334, y * 425, x * 435, y * 38},
    {x  * 334, y * 466, x * 435, y * 38},
    {x  * 334, y * 507, x * 435, y * 38},
}

local ButtonsAnimUse = {
    {x * 695, y * 267, x * 29, y * 30},
    {x * 695, y * 308, x * 29, y * 30},
    {x * 695, y * 348, x * 29, y * 30},
    {x * 695, y * 389, x * 29, y * 30},
    {x * 695, y * 430, x * 29, y * 30},
    {x * 695, y * 471, x * 29, y * 30},
    {x * 695, y * 511, x * 29, y * 30},
}

local ButtonsAnimFavorite = {
    {x * 730, y * 270, x * 23, y * 21},
    {x * 730, y * 311, x * 23, y * 21},
    {x * 730, y * 351, x * 23, y * 21},
    {x * 730, y * 392, x * 23, y * 21},
    {x * 730, y * 433, x * 23, y * 21},
    {x * 730, y * 474, x * 23, y * 21},
    {x * 730, y * 515, x * 23, y * 21},
}

local Favorites = {
    {x * 657, y * 187},
    {x * 777, y * 236},
    {x * 828, y * 330},
    {x * 803, y * 449},
    {x * 653, y * 527},
    {x * 510, y * 449},
    {x * 488, y * 333},
    {x * 533, y * 238},
}

local ButtonsAnimName = {
    {x * 340, y * 268, x * 609, y * 291},
    {x * 340, y * 311, x * 609, y * 334},
    {x * 340, y * 351, x * 609, y * 374},
    {x * 340, y * 392, x * 609, y * 415},
    {x * 340, y * 431, x * 609, y * 454},
    {x * 340, y * 473, x * 609, y * 496},
    {x * 340, y * 516, x * 609, y * 539},
}

local maxLinhasSelect = #ButtonsAnim

local maxLinhas = #Buttons

local soundPlayed = {}

local ConviteEnviado = {}

function dx()
    local alpha = interpolateBetween(0, 0, 0, 255, 100, 0, (getTickCount() - tick)/250, "Linear")

    if window == "index" then
        dxDrawImage(x * 21, y * 215, x * 304, y * 337, "files/imgs/index/base.png", 0, 0, 0, tocolor(255, 255, 255, alpha))
        dxDrawText("PAINEL DE ANIMAÇÃO", x * 21, y * 221, x * 323, y * 255, tocolor(196, 196, 196, alpha), 1.00, font, "center", "center", false, false, false, false, false)
        linha = 0
        for i, v in ipairs(config["Interações"]) do
            if (i > proxPage and linha < maxLinhas) then
                linha = linha + 1
                if isMouseInPosition(Buttons[linha][1], Buttons[linha][2], Buttons[linha][3], Buttons[linha][4]) or selectButton == i then
                    dxDrawRectangle(Buttons[linha][1], Buttons[linha][2], Buttons[linha][3], Buttons[linha][4], tocolor(31, 31, 31, alpha))
                else
                    dxDrawRectangle(Buttons[linha][1], Buttons[linha][2], Buttons[linha][3], Buttons[linha][4], tocolor(19, 20, 21, alpha))
                end
                dxDrawText(v[1], ButtonsName[linha][1], ButtonsName[linha][2], ButtonsName[linha][3], ButtonsName[linha][4], tocolor(196, 196, 196, alpha), 1.00, font, "left", "center", false, false, false, false, false)
                dxDrawImage(ButtonsIcon[linha][1], ButtonsIcon[linha][2], ButtonsIcon[linha][3], ButtonsIcon[linha][4], "files/imgs/"..v[2]..".png", 0, 0, 0, tocolor(255, 255, 255, alpha))
            end
        end
    elseif window == "favorites" then 
        dxDrawImage(x * 468, y * 169, x * 429, y * 429, "files/imgs/favorites.png")
        local linhafavoritos = 0
        for i,v in pairs(selectFav) do 
            for indx,conteudo in pairs(v) do  
                linhafavoritos = linhafavoritos + 1
                if linhafavoritos <= #Favorites then 
                    if isMouseInPosition(Favorites[linhafavoritos][1], Favorites[linhafavoritos][2], x * 51, y * 51) then
                        if not soundPlayed[linhafavoritos] then
                            soundPlayed[linhafavoritos] = true
                            playSound('files/sfx/select_interactions.mp3')
                        end 
                        dxDrawImage(Favorites[linhafavoritos][1], Favorites[linhafavoritos][2], x * 51, y * 51, "files/imgs/"..config["ImgInterações"][i]..".png", 0, 0, 0, tocolor(31, 31, 31))
                        dxDrawText(string.upper(removeAccents(conteudo)) ,x * 573,y * 320, x * 791, y * 445, tocolor(255, 255, 255, 255), 1, font3, "center", "center")
                    else 
                        soundPlayed[linhafavoritos] = nil
                        dxDrawImage(Favorites[linhafavoritos][1], Favorites[linhafavoritos][2], x * 51, y * 51, "files/imgs/"..config["ImgInterações"][i]..".png")
                    end 
                end  
            end 
        end 
    elseif window == "convites" then 
        dxDrawImage(x * 533, y * 237, x * 300, y * 293.22, "files/imgs/base_convites.png")
        local linha = 0
        for i,v in ipairs(getElementsByType("player")) do 
            if --[[v ~= localPlayer and]] getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)), Vector3(getElementPosition(v))) <= 5 and not ConviteEnviado[v] then 
                linha = linha + 1
                dxDrawRectangle(x * 533, y * (245.61+linha*37.32), x * 297.13, y * 33.01, tocolor(19,20,21))
                if isMouseInPosition(x * 797.11, y * (250.61+linha*37.32), x * 21.53, y * 21.53) then 
                    dxDrawImage(x * 797.11-1, y * (250.61+linha*37.32)-1, x * 21.53+2, y * 21.53+2, "files/imgs/adicionar_danca.png", 0, 0, 0, tocolor(109, 0 ,255))
                else 
                    dxDrawImage(x * 797.11, y * (250.61+linha*37.32), x * 21.53, y * 21.53, "files/imgs/adicionar_danca.png")
                end 
                
                dxDrawText(removeHex(getPlayerName(v)).."("..(getElementData(v, "ID") or "N/A")..")", x * 545.92, y * (254.61+linha*37.32), x * 54.55, y * 17.22, tocolor(255, 255, 255), 1, font2)
            end 
        end 
    elseif window == "convite" then 
        dxDrawImage(x * 551, y * 336, x * 264, y * 95, "files/imgs/base_convidado.png")
        dxDrawText(textoconvidado, x * 580, y * 349, x * 167, y * 37, tocolor(255, 255, 255), 1, font2)
    end
    if buttonSelect and window ~= "convites" and window ~= "convite" then
        dxDrawImage(x * 334, y * 215, x * 438, y * 337, "files/imgs/base.png", 0, 0, 0, tocolor(255, 255, 255, alpha))
        linha = 0
        for i, v in ipairs(config["Animations"][buttonSelect]) do
            if (i > proxPageSelect and linha < maxLinhasSelect) then
                linha = linha + 1
                if isMouseInPosition(ButtonsAnim[linha][1], ButtonsAnim[linha][2], ButtonsAnim[linha][3], ButtonsAnim[linha][4]) then 
                    dxDrawRectangle(ButtonsAnim[linha][1], ButtonsAnim[linha][2], ButtonsAnim[linha][3], ButtonsAnim[linha][4], tocolor(31, 31, 31, alpha))
                else
                    dxDrawRectangle(ButtonsAnim[linha][1], ButtonsAnim[linha][2], ButtonsAnim[linha][3], ButtonsAnim[linha][4], (AnimSelecionada == i and tocolor(31, 31, 31, alpha) or tocolor(19, 20, 21, alpha)))
                end
                if isMouseInPosition(ButtonsAnimUse[linha][1], ButtonsAnimUse[linha][2], ButtonsAnimUse[linha][3], ButtonsAnimUse[linha][4]) or selectAnim == i then
                    dxDrawImage(ButtonsAnimUse[linha][1], ButtonsAnimUse[linha][2], ButtonsAnimUse[linha][3], ButtonsAnimUse[linha][4], "files/imgs/use.png", 0, 0, 0, tocolor(31, 31, 31, alpha))
                else
                    dxDrawImage(ButtonsAnimUse[linha][1], ButtonsAnimUse[linha][2], ButtonsAnimUse[linha][3], ButtonsAnimUse[linha][4], "files/imgs/use.png", 0, 0, 0, tocolor(255, 255, 255, alpha))
                end
                if isMouseInPosition(ButtonsAnimFavorite[linha][1], ButtonsAnimFavorite[linha][2], ButtonsAnimFavorite[linha][3], ButtonsAnimFavorite[linha][4]) or selectFav[buttonSelect][i] then
                    dxDrawImage(ButtonsAnimFavorite[linha][1], ButtonsAnimFavorite[linha][2], ButtonsAnimFavorite[linha][3], ButtonsAnimFavorite[linha][4], "files/imgs/favorite.png", 0, 0, 0, tocolor(31, 31, 31, alpha))
                else
                    dxDrawImage(ButtonsAnimFavorite[linha][1], ButtonsAnimFavorite[linha][2], ButtonsAnimFavorite[linha][3], ButtonsAnimFavorite[linha][4], "files/imgs/favorite.png", 0, 0, 0, tocolor(255, 255, 255, alpha))
                end
                dxDrawText(v[1], ButtonsAnimName[linha][1], ButtonsAnimName[linha][2], ButtonsAnimName[linha][3], ButtonsAnimName[linha][4], tocolor(196, 196, 196, alpha), 1.00, font, "left", "center", false, false, false, false, false)
                dxDrawText(buttonSelect, x * 334, y * 222, x * 770, y * 256, tocolor(196, 196, 196, alpha), 1.00, font, "center", "center", false, false, false, false, false)
            end
        end
    end
end

addEventHandler("onClientClick", root,
function(button, state)
    if button == "left" and state == "down" then
        if isEventHandlerAdded("onClientRender", root, dx) then
            
            if window == "index"  then
                linha = 0
                for i, v in ipairs(config["Interações"]) do 
                    if (i > proxPage and linha < maxLinhas) then
                        linha = linha + 1
                        if isMouseInPosition(Buttons[linha][1], Buttons[linha][2], Buttons[linha][3], Buttons[linha][4]) then 
                            selectButton = i
                            buttonSelect = v[1]
                            if not selectFav[buttonSelect] then selectFav[buttonSelect] = {} end
                        end
                    end
                end
            elseif window == "favorites" then 
                local linhafavoritos = 0
                for i,v in pairs(selectFav) do 
                    for indx,conteudo in pairs(v) do  
                        linhafavoritos = linhafavoritos + 1
                        if linhafavoritos <= #Favorites then 
                            if isMouseInPosition(Favorites[linhafavoritos][1], Favorites[linhafavoritos][2], x * 51, y * 51) then 
                                local indx = tonumber(indx)
                                triggerServerEvent('Schootz.setAnim', localPlayer, localPlayer, config.Animations[i][indx][1], config.Animations[i][indx][3], i, config.Animations[i][indx][4])
                                playSound('files/sfx/select_animations.mp3')
                            end 
                        end  
                    end 
                end 
            elseif window == "convites" then 
                local linha = 0
                for i,v in ipairs(getElementsByType("player")) do 
                    if --[[v ~= localPlayer and]] getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)), Vector3(getElementPosition(v))) <= 5 then 
                        linha = linha + 1
                        if isMouseInPosition(x * 797.11, y * (250.61+linha*37.32), x * 21.53, y * 21.53) then 
                            ConviteEnviado[v] = true
                            setTimer(
                                function ()
                                    ConviteEnviado[v] = false
                                end, config.TempoParaAceitarConvite, 1
                            )
                            triggerServerEvent('MeloSCR:SendConvitePlayer', localPlayer, v, buttonSelect, selectAnim)
                        end 
                    end 
                end 
            elseif window == "convite" then 
                if isMouseInPosition(x * 611, y * 402, x * 70, y * 20) then 
                    removeEventHandler("onClientRender", root, dx)
                    showCursor(false)
                    triggerServerEvent('MeloSCR:AceitarConvitePlayer', localPlayer, responsavel)
                elseif isMouseInPosition(x * 684, y * 402, x * 70, y * 20) then 
                    removeEventHandler("onClientRender", root, dx)
                    showCursor(false)
                end 
            end
            
            if buttonSelect and window == "index" then
                linha = 0
                for i, v in ipairs(config["Animations"][buttonSelect]) do 
                    if (i > proxPageSelect and linha < maxLinhasSelect) then
                        linha = linha + 1
                        if isMouseInPosition(ButtonsAnimUse[linha][1], ButtonsAnimUse[linha][2], ButtonsAnimUse[linha][3], ButtonsAnimUse[linha][4]) then 
                            selectAnim = i
                            window = "convites"
                            return 
                        elseif isMouseInPosition(ButtonsAnimFavorite[linha][1], ButtonsAnimFavorite[linha][2], ButtonsAnimFavorite[linha][3], ButtonsAnimFavorite[linha][4]) then 
                            if not selectFav[buttonSelect] then selectFav[buttonSelect] = {} end
                            if not selectFav[buttonSelect][i] then 
                                selectFav[buttonSelect][i] = v[1]
                            else 
                                selectFav[buttonSelect][i] = nil 
                            end 
                            triggerServerEvent('MeloSCR:SaveFavoritesAnim', localPlayer, selectFav)
                            return
                        end
                    end
                end
                linha = 0 
                for i,v in ipairs(config['Animations'][buttonSelect]) do  
                    if (i > proxPageSelect and linha < maxLinhasSelect) then
                        linha = linha + 1
                        if isMouseInPosition(ButtonsAnim[linha][1], ButtonsAnim[linha][2], ButtonsAnim[linha][3], ButtonsAnim[linha][4]) then 
                            AnimSelecionada = i
                            triggerServerEvent('Schootz.setAnim', localPlayer, localPlayer, v[1], v[3], buttonSelect, v[4])
                        end
                    end
                end
            end
        end
    end
end)

bindKey("backspace", "down",
function ()
    if isEventHandlerAdded("onClientRender", root, dx) and window and window == "convites" then
        removeEventHandler("onClientRender", root, dx)
        showCursor(false)
    end 
end)

bindKey("F3", "down",
function()
    if isEventHandlerAdded("onClientRender", root, dx) then
        removeEventHandler("onClientRender", root, dx)
        showCursor(false)
    else
        addEventHandler("onClientRender", root, dx)
        showCursor(true)
        window  = "index"
        proxPage = 0
        selectButton = 0
        selectAnim = 0
        if not selectFav then selectFav = {} end
        buttonSelect = nil
        AnimSelecionada = nil
        proxPageSelect = 0
        tick = getTickCount()
    end
end)

addEvent('MeloSCR:OpenConvidadoAnim', true)
addEventHandler('MeloSCR:OpenConvidadoAnim', root, 
    function (convidador)
        if isEventHandlerAdded("onClientRender", root, dx) then
            window  = "convite"
            tick = getTickCount()
            responsavel = convidador
            local textobase = "O Jogador, "..(removeHex(string.gsub(getPlayerName(responsavel), "_", " "))).."("..(getElementData(responsavel, "ID") or "N/A")..") está lhe convidando para compartilhar uma dança com ele"
            textoconvidado = formatTextMelo(textobase, font2, x*200--[[MaxLargura]], 3--[[MaxLinhasFormatação]])   
        else 
            addEventHandler("onClientRender", root, dx)
            showCursor(true)
            window  = "convite"
            tick = getTickCount()
            responsavel = convidador
            local textobase = "O Jogador, "..(removeHex(string.gsub(getPlayerName(responsavel), "_", " "))).."("..(getElementData(responsavel, "ID") or "N/A")..") está lhe convidando para compartilhar uma dança com ele"
            textoconvidado = formatTextMelo(textobase, font2, x*200--[[MaxLargura]], 3--[[MaxLinhasFormatação]])
        end 
    end 
)

addEvent('MeloSCR:LoadFavoritesAnim', true)
addEventHandler('MeloSCR:LoadFavoritesAnim', root, 
    function (tableanim)
        selectFav = tableanim
    end 
)

bindKey("space", 'down', 
function()
    triggerServerEvent('Schootz.onPararAnimation', localPlayer)
end)

bindKey("mouse_wheel_up", "down", function()
	if (isEventHandlerAdded('onClientRender', root, dx)) then
        if isMouseInPosition(x * 21, y * 215, x * 304, y * 337) then
            if(proxPage > 0) then
                proxPage = proxPage - 1
            end
        end
        if isMouseInPosition(x * 334, y * 215, x * 438, y * 337) then
            if(proxPageSelect > 0) then
                proxPageSelect = proxPageSelect - 1
            end
        end
	end
end)

bindKey("mouse_wheel_down", "down", function()
	if (isEventHandlerAdded('onClientRender', root, dx)) then
        if isMouseInPosition(x * 21, y * 215, x * 304, y * 337) then
            proxPage = proxPage + 1
            if (proxPage > #config["Interações"] - maxLinhas) then
                proxPage = #config["Interações"] - maxLinhas
            end
        end
        if isMouseInPosition(x * 334, y * 215, x * 438, y * 337) then
            proxPageSelect = proxPageSelect + 1
            if (proxPageSelect > #config["Animations"][buttonSelect] - maxLinhasSelect) then
                proxPageSelect = #config["Animations"][buttonSelect] - maxLinhasSelect
            end
        end
	end 
end)

function isMouseInPosition(pos_x, pos_y, wigth, height)
	if (not isCursorShowing()) then
		return false
	end
	local cursor_x, cursor_y = getCursorPosition()
	local cursor_x, cursor_y = (cursor_x * screen[1]), (cursor_y * screen[2])
	return ((cursor_x >= pos_x and cursor_x <= pos_x + wigth) and (cursor_y >= pos_y and cursor_y <= pos_y + height))
end

function isEventHandlerAdded(eventName, attachedTo, handlerFunction)
	if (type(eventName) == "string") and (isElement(attachedTo)) and (type(handlerFunction) == "function") then
		local attachedFunction = getEventHandlers(eventName, attachedTo)
		if (type(attachedFunction) == "table") and (#attachedFunction > 0) then
			for i, v in ipairs(attachedFunction) do
				if (v == handlerFunction) then
					return true
				end
			end
		end
	end
	return false
end

addEventHandler("onClientKey", root, 
function (botton, press)
    if botton == "q" and press then 
        setTimer(
            function ()
                if getKeyState("q") then 
                    if not isEventHandlerAdded('onClientRender', root, dx) then 
                        addEventHandler("onClientRender", root, dx)
                    end 
                    showCursor(true)
                    window = 'favorites'
                    proxPage = 0
                    selectButton = 0
                    selectAnim = 0
                    if not selectFav then selectFav = {} end
                    buttonSelect = nil
                    AnimSelecionada = nil
                    proxPageSelect = 0
                    tick = getTickCount()
                end 
            end, 200, 1
        )
    elseif botton == "q" and not press and isEventHandlerAdded('onClientRender', root, dx) then 
        removeEventHandler("onClientRender", root, dx)
        playSound('files/sfx/close_animations.mp3')
        showCursor(false)
    end 
end)

ossos = {}
posNaTabela = {}

addEvent('Schootz.onPararAnimationsClient', true)
addEventHandler('Schootz.onPararAnimationsClient', root, function(player)
	if ossos[player] and #ossos[player] > 0 then
		if posNaTabela[player] then 
			table.remove(playersAnim, posNaTabela[player])
		end 
		ossos[player] = {}
		for i=1, #Ossos do 
			updateElementRpHAnim(player)
		end 
	end
end)

addEventHandler('onClientPedsProcessed', root, function()
	for indx,thePlayersAnim in ipairs(playersAnim) do 
		if thePlayersAnim and isElement(thePlayersAnim) then 
			if isElementStreamedIn(thePlayersAnim) then 
				if ossos[thePlayersAnim] and #ossos[thePlayersAnim] > 0 then
					for i, v in pairs(ossos[thePlayersAnim]) do 
						setElementBoneRotation(thePlayersAnim, v[1], v[2], v[3], v[4])		
						updateElementRpHAnim(thePlayersAnim)
					end
				else 
					table.remove(playersAnim, indx)
				end
			end 
		else 
			table.remove(playersAnim, indx)
		end 
	end 
end)

addEvent('Schootz.onSetBonePosition', true)
addEventHandler('Schootz.onSetBonePosition', root, function (player, position)
	if not ossos[player] then 
		ossos[player] = {}
	end 
	for i, v in pairs(position) do
		setElementBoneRotation(player, i, v[1], v[2], v[3])
		table.insert(ossos[player], {i, v[1], v[2], v[3], player})
		table.insert(playersAnim, player)
		posNaTabela[player] = #playersAnim
	end
end)

addEvent('Schootz.onSetAnimation', true)
addEventHandler('Schootz.onSetAnimation', root, function (player, animation)
	setPedAnimation(player, unpack(animation))
end)
 -- salve
ifp = {}

setTimer(function()
	for i, v in ipairs(IFPS) do
		ifp[i] = engineLoadIFP('files/ifp/'..v..'.ifp', v)
	end
end, 1000, 1)

engineImportTXD(engineLoadTXD("files/object/prancheta.txd", 1933), 1933)
engineReplaceModel(engineLoadDFF("files/object/prancheta.dff", 1933), 1933)
engineImportTXD(engineLoadTXD("files/object/maleta.txd", 1934), 1934)
engineReplaceModel(engineLoadDFF("files/object/maleta.dff", 1934), 1934)
engineImportTXD(engineLoadTXD("files/object/umbrella.txd", 14864), 14864)
engineReplaceModel(engineLoadDFF("files/object/umbrella.dff", 14864), 14864)
engineImportTXD(engineLoadTXD("files/object/camera.txd", 367), 367)
engineReplaceModel(engineLoadDFF("files/object/camera.dff", 367), 367)

local tableAccents = {["à"] = "a",["á"] = "a",["â"] = "a",["ã"] = "Ã",["ä"] = "a",["ç"] = "Ç",["è"] = "e",["é"] = "e",["ê"] = "e",["ë"] = "e",["ì"] = "i",["í"] = "i",["î"] = "i",["ï"] = "i",["ñ"] = "n",["ò"] = "o",["ó"] = "o", ["ô"] = "o",["õ"] = "o",["ö"] = "o",["ù"] = "u",["ú"] = "u",["û"] = "u",["ü"] = "u",["ý"] = "y",["ÿ"] = "y",["À"] = "A",["Á"] = "A",["Â"] = "A",["Ã"] = "A",["Ä"] = "A",["Ç"] = "C",["È"] = "E",["É"] = "E",["Ê"] = "E",["Ë"] = "E",["Ì"] = "I",["Í"] = "I",["Î"] = "I",["Ï"] = "I",["Ñ"] = "N",["Ò"] = "O",["Ó"] = "O",["Ô"] = "O",["Õ"] = "O",["Ö"] = "O",["Ù"] = "U",["Ú"] = "U",["Û"] = "U",["Ü"] = "U",["Ý"] = "Y"}
function removeAccents(str)
    local noAccentsStr = ""
    for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
        if (tableAccents[strChar] ~= nil) then
            noAccentsStr = noAccentsStr..tableAccents[strChar]
        else
            noAccentsStr = noAccentsStr..strChar
        end
    end
    return noAccentsStr
end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or ""
end

function formatTextMelo(text, fonte, maxlargura, qntdlinhas)   
    if qntdlinhas <= 1 then 
        while (dxGetTextWidth(text, 1.00, fonte)) > (maxlargura-dxGetTextWidth("...", 1.00, fonte)) do 
            text = string.sub(text, 1, string.len(text)-1) 
        end 
        text = text.."..." 
    else 
        local qntdlinhas = qntdlinhas - 1 
        for i=1, qntdlinhas do 
            local textonovo = tostring(text) 
            while dxGetTextWidth(textonovo, 1.00, fonte) > maxlargura do 
                textonovo = string.sub(textonovo, 1, string.len(textonovo)-1) 
            end 
            ultimotexto = textonovo
            ultimalinha = string.sub(text, string.len(textonovo)+1, string.len(text))
            text = textonovo.."\n"..ultimalinha
            if dxGetTextWidth(text, 1.00, fonte) <= maxlargura then 
                break
            else 
                if i == qntdlinhas then 
                    local textonovo = ultimalinha 
                    local novotexto = ultimotexto 
                    while (dxGetTextWidth(ultimalinha, 1.00, fonte)) > (maxlargura-dxGetTextWidth("...", 1.00, fonte)) do 
                        ultimalinha = string.sub(ultimalinha, 1, string.len(ultimalinha)-1)
                    end     
                    text = ultimotexto.."\n"..ultimalinha.."..."
                end 
            end 
        end 
    end 
    return text
end 

--salve