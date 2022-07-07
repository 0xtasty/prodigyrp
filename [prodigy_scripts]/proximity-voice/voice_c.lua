--+----------------------------------------------------------------------------------------------------------------------------------------
--|   Script by K "Addlibs" Stasiak, downloaded from MTA community.
--|
--|   Licensed under Creative Commons Attribution 4.0 International Public License
--|   https://creativecommons.org/licenses/by/4.0/
--|
--|   You are free to copy and redistribute the script, to remix, transform, and build upon the script for any purpose, even commercially.
--|   You must give appropriate credit, provide a link to the license, and indicate if changes were made.
--|   You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
--+-----------------------------------------------------------------------------------------------------------------------------------
local streamedOut = {}

addEventHandler("onClientPreRender", root,
	function ()
        local players = getElementsByType("player", root, true) -- table of sounds which will be transformed into 3D

        for k, v in ipairs(players) do
            -- Modify the sound's volume and pan to make it seem 3D, based on MTA source code
            
            local vecSoundPos = v.position
            local vecCamPos = Camera.position
            local fDistance = (vecSoundPos - vecCamPos).length
            local fMaxVol = v:getData("maxVol") or 7
            local fMinDistance = v:getData("minDist") or 5
            local fMaxDistance = v:getData("maxDist") or 25

            -- Limit panning when getting close to the min distance
            local fPanSharpness = 1.0
            if (fMinDistance ~= fMinDistance * 2) then
                fPanSharpness = math.max(0, math.min(1, (fDistance - fMinDistance) / ((fMinDistance * 2) - fMinDistance)))
            end

            local fPanLimit = (0.65 * fPanSharpness + 0.35)

            -- Pan
            local vecLook = Camera.matrix.forward.normalized
            local vecSound = (vecSoundPos - vecCamPos).normalized
            local cross = vecLook:cross(vecSound)
            local fPan = math.max(-fPanLimit, math.min(-cross.z, fPanLimit))

            local fDistDiff = fMaxDistance - fMinDistance;

            -- Transform e^-x to suit our sound
            local fVolume
            if (fDistance <= fMinDistance) then
                fVolume = fMaxVol
            elseif (fDistance >= fMaxDistance) then
                fVolume = 0.0
            else
                fVolume = math.exp(-(fDistance - fMinDistance) * (5.0 / fDistDiff)) * fMaxVol
            end
            setSoundPan(v, fPan)

            -- Additionally add a compressor effect if there's occlusion (something in the way of line of sight) (todo: make the volume change smoother)
            if isLineOfSightClear(localPlayer.position, vecSoundPos, true, true, false, true, false, true, true, localPlayer) then -- line of sight clear
                setSoundVolume(v, fVolume)
                setSoundEffectEnabled(v, "compressor", false)
            else
                local fVolume = fVolume * 0.5 -- reduce volume by half
                local fVolume = fVolume < 0.01 and 0 or fVolume -- treshold of 0.01 (anything below is forced to 0)
                setSoundVolume(v, fVolume)
                setSoundEffectEnabled(v, "compressor", true)
            end
        end
    end
, false)

tipo = getElementData(localPlayer, "ONE:VOZ") or "Normal"
texto = "Voz: "

addEventHandler('onClientResourceStart', root, function()
    addEventHandler('onClientRender', root, function()
        dxDrawText(texto..""..tipo.."", 100,200,100,100, tocolor(255, 255, 255, 255), x(1.00), "default", "left", "top", false, false, false, true, false)
    end)
    if tipo == "Normal" then
        tipo = "Gritando"
        setElementData(localPlayer, "ONE:VOZ", "Gritando")
        setElementData(localPlayer, "minDist", 5)
        setElementData(localPlayer, "maxDist", 25)
        setElementData(localPlayer, "maxVol", 18)
    elseif tipo == "Gritando" then
        tipo = "Sussurrando"
        setElementData(localPlayer, "ONE:VOZ", "Sussurrando")
        setElementData(localPlayer, "minDist", 5)
        setElementData(localPlayer, "maxDist", 6)
        setElementData(localPlayer, "maxVol", 5)
    elseif tipo == "Sussurrando" then
        tipo = "Normal"
        setElementData(localPlayer, "ONE:VOZ", "Normal")
        setElementData(localPlayer, "minDist", 5)
        setElementData(localPlayer, "maxDist", 10)
        setElementData(localPlayer, "maxVol", 12)
    end
end)

function alterarVoz()
    if tipo == "Normal" then
        tipo = "Gritando"
        setElementData(localPlayer, "ONE:VOZ", "Gritando")
        setElementData(localPlayer, "minDist", 5)
        setElementData(localPlayer, "maxDist", 25)
        setElementData(localPlayer, "maxVol", 18)
    elseif tipo == "Gritando" then
        tipo = "Sussurrando"
        setElementData(localPlayer, "ONE:VOZ", "Sussurrando")
        setElementData(localPlayer, "minDist", 5)
        setElementData(localPlayer, "maxDist", 6)
        setElementData(localPlayer, "maxVol", 5)
    elseif tipo == "Sussurrando" then
        tipo = "Normal"
        setElementData(localPlayer, "ONE:VOZ", "Normal")
        setElementData(localPlayer, "minDist", 5)
        setElementData(localPlayer, "maxDist", 10)
        setElementData(localPlayer, "maxVol", 12)
    end
end
bindKey("x", "down", alterarVoz)

function changeMaxDis()
    fMaxDistance = 2
end
addCommandHandler("change", changeMaxDis)

addEventHandler("onClientElementStreamIn", root,
    function ()
        if source:getType() == "player" then
            triggerServerEvent("proximity-voice::broadcastUpdate", localPlayer, getElementsByType("player", root, true))
        end
    end
)

addEvent("proximity-voice::change-color-start", true)
addEventHandler("proximity-voice::change-color-start", root,
    function () -- client has streamed in or out another player and the broadcast list has changed
        texto = "Voz: #00FF00"
    end
)

addEvent("proximity-voice::change-color-stop", true)
addEventHandler("proximity-voice::change-color-stop", root,
    function () -- client has streamed in or out another player and the broadcast list has changed
        texto = "Voz: #FFFFFF"
    end
)

addEventHandler("onClientElementStreamOut", root,
    function ()
        if source:getType() == "player" then
            triggerServerEvent("proximity-voice::broadcastUpdate", localPlayer, getElementsByType("player", root, true))
            setSoundPan(source, 0)
            setSoundVolume(source, 0)
        end
    end
)

addEventHandler("onClientResourceStart", resourceRoot,
    function ()
        triggerServerEvent("proximity-voice::broadcastUpdate", localPlayer, getElementsByType("player", root, true)) -- request server to start broadcasting voice data once the resource is loaded (to prevent receiving voice data while this script is still downloading)
    end
, false)

-- Only remove the following lines if you provide credit another way like through an F1 panel or something.
addCommandHandler("sver",
    function ()
        outputConsole("[VOICE] Server is running (modified) proximity-voice by Addlibs. Licensed under https://creativecommons.org/licenses/by/4.0/")
    end
)
