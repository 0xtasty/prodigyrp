modelObject = {} boneAnimation = {} convitesPlayer = {}
db = dbConnect("sqlite", "Animations.db")
dbExec(db, "CREATE TABLE IF NOT EXISTS AnimationsSave(Conta, Animations)")

addEvent('MeloSCR:SaveFavoritesAnim', true)
addEventHandler('MeloSCR:SaveFavoritesAnim', root, 
    function (tableanim)
        local sql = dbPoll(dbQuery(db, "SELECT *  FROM AnimationsSave WHERE Conta=?", getAccountName(getPlayerAccount(source))), -1)
        if #sql > 0 then 
            dbExec(db, "UPDATE AnimationsSave SET Animations=? WHERE Conta=?", toJSON(tableanim), getAccountName(getPlayerAccount(source)))
        else 
            dbExec(db, "INSERT INTO AnimationsSave(Conta, Animations) VALUES(?,?)", getAccountName(getPlayerAccount(source)), toJSON(tableanim))
        end 
    end 
)

addEvent('MeloSCR:SendConvitePlayer', true)
addEventHandler('MeloSCR:SendConvitePlayer', root, 
    function (playerconvite, aba, animacao)
        if not convitesPlayer[source] then 
            convitesPlayer[source] = {}
            setTimer( 
                function (responsavelconvite, aba, animacao)
                    if responsavelconvite and isElement(responsavelconvite) then 
                        variavelrecusar = false
                        for i,v in pairs(convitesPlayer[responsavelconvite]) do 
                            if not v and i and isElement(i) then 
                                notifyS(responsavelconvite, "O Jogador "..removeHex (getPlayerName(i)).." não aceitou o convite", "error")
                                variavelrecusar = true
                            elseif not v then 
                                variavelrecusar = true
                                notifyS(responsavelconvite, "Um Jogador convidado se desconectou!", "error")
                            end 
                        end 
                        if not variavelrecusar then 
                            for i,v in pairs(convitesPlayer[responsavelconvite]) do 
                                if i and isElement(i) then 
                                    setAnim(i, config['Animations'][aba][animacao][1], config['Animations'][aba][animacao][3], aba, config['Animations'][aba][animacao][4])
                                else 
                                    notifyS(responsavelconvite, "Um Jogador convidado se desconectou!", "error")
                                    return 
                                end 
                            end 
                            setAnim(responsavelconvite, config['Animations'][aba][animacao][1], config['Animations'][aba][animacao][3], aba, config['Animations'][aba][animacao][4])
                        end 
                    end 
                end, config.TempoParaAceitarConvite, 1, source, aba, animacao
            )
        end 
        convitesPlayer[source][playerconvite]  =  false
        triggerClientEvent(playerconvite, 'MeloSCR:OpenConvidadoAnim', playerconvite, source)
    end 
)

addEvent('MeloSCR:AceitarConvitePlayer', true)
addEventHandler('MeloSCR:AceitarConvitePlayer', root, 
    function (playerconvite)
        if not convitesPlayer[playerconvite][source] then 
            convitesPlayer[playerconvite][source] = true
        end 
    end 
)

addEventHandler("onPlayerLogin", root, 
function ()
    local sql = dbPoll(dbQuery(db, "SELECT *  FROM AnimationsSave WHERE Conta=?", getAccountName(getPlayerAccount(source))), -1)
    if #sql > 0 then 
        triggerClientEvent(source, "MeloSCR:LoadFavoritesAnim", source, fromJSON(sql[1].Animations))
    end 
end)

addEventHandler("onResourceStart", getResourceRootElement(), 
function ()
    setTimer(
        function ( )
            for i,v in ipairs(getElementsByType("player")) do 
                local sql = dbPoll(dbQuery(db, "SELECT *  FROM AnimationsSave WHERE Conta=?", getAccountName(getPlayerAccount(v))), -1)
                if #sql > 0 then 
                    triggerClientEvent(v, "MeloSCR:LoadFavoritesAnim", v, fromJSON(sql[1].Animations))
                end 
            end 
        end, 1000, 1
    )
    
end)

addEvent('Schootz.onPararAnimation', true)
addEventHandler('Schootz.onPararAnimation', root, function ()
    if isElement(modelObject[source]) then
        destroyElement(modelObject[source])
    end
    toggleControl(source, 'fire', true)
    toggleControl(source, 'jump', true)
    toggleControl(source, 'enter_passenger', true)
    setPedAnimation(source, nil)
    triggerClientEvent(root, 'Schootz.onPararAnimationsClient', root, source)
end)

function setAnim(player, nome, anim, tipo, int)
    if tipo == 'ESTILO DE ANDAR' then
        if not isPedInVehicle(player) then
            setPedWalkingStyle(player, tonumber(anim))
            notifyS(player, 'Você mudou seu estilo de andar para '..nome..'.', 'info')
        end
    elseif tipo ~= 'ESTILO DE ANDAR' then 
        if int == 'IFP' then 
            triggerClientEvent(root, 'Schootz.onSetAnimation', root, player, anim)
            notifyS(player, 'Você ativou a animação '..nome..'.', 'info')
    elseif int == 'Custom' then
        local table = CUSTOM_ANIMATIONS[anim[1]][anim[2]]
        if table then
            if table.blockAttack then
                toggleControl(player, 'fire', false)
            end
            if table.blockJump then
                toggleControl(player, 'jump', false)
            end
            if table.blockVehicle then
                toggleControl(player, 'enter_passenger', false)
            end
            if table.BonesRotation then
                if boneAnimation[player] then
                    triggerClientEvent(root, 'Schootz.onPararAnimationsClient', root, player)
                    boneAnimation[player] = false
                end
                boneAnimation[player] = true
                triggerClientEvent(root, 'Schootz.onSetBonePosition', root, player, table.BonesRotation)
                notifyS(player, 'Você ativou a animação '..nome..'.', 'info')
            end
            if table.Object then
                if isElement(modelObject[player]) then
                    destroyElement(modelObject[player])
                end
                modelObject[player] = createObject(table.Object.Model, getElementPosition(player))
                if table.Object.Scale then
                    setObjectScale(modelObject[player], table.Object.Scale)
                end
                setElementCollisionsEnabled(modelObject[player], false)
                exports['pAttach']:attach(modelObject[player], player, unpack(table.Object.Offset))
                notifyS(player, 'Você pegou o objeto '..nome..'.', 'info')
            end
        end
        elseif int == 'Padrao' then
            setPedAnimation(player, unpack(anim))
            notifyS(player, 'Você ativou a animação '..nome..'.', 'info')
        end
    end
end
addEvent('Schootz.setAnim', true)
addEventHandler('Schootz.setAnim', root, setAnim)

addEventHandler('onPlayerWasted', root, function ()
    if isElement(modelObject[source]) then
        destroyElement(modelObject[source])
    end
    toggleControl(source, 'fire', true)
    toggleControl(source, 'jump', true)
    toggleControl(source, 'enter_passenger', true)
    setPedAnimation(source, nil)
    triggerClientEvent(root, 'Schootz.onPararAnimationsClient', root, source)
end)

addEventHandler('onPlayerQuit', root, function ()
    if isElement(modelObject[source]) then
        destroyElement(modelObject[source])
    end
    toggleControl(source, 'fire', true)
    toggleControl(source, 'jump', true)
    toggleControl(source, 'enter_passenger', true)
    setPedAnimation(source, nil)
    triggerClientEvent(root, 'Schootz.onPararAnimationsClient', root, source)
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end