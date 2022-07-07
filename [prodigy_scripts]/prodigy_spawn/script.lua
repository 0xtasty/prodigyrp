-- Configurações para quando um jogador entrar
	-- XYZ coodenadas
	local joinX = 1480.705
	local joinY = -1768.473    
	local joinZ = 18.796
	-- Armas e tiros
	--local joinWeapon = 100
	--local joinAmmo = 90
	-- Menssagem para o jogador
	--local joinMessage = "~>[S]ilver!"
	-- Pele do jogador
	--local joinSkin = 19

-- Configurações para quando um jogador morrer
	-- XYZ coördinates
	local spawnX = 2037.885
	local spawnY = -1412.131
	local spawnZ = 17.164
	-- Armas e tiros
	--local spawnWeapon = 31
	--local spawnAmmo = 100
	-- Pele do jogador
	--local spawnSkin = 27

-- Definições para as quantidades de dinheiro
	-- Dinheiro por matar um jogador
	--local killerMoney = 500
	-- O dinheiro retirado do jogador quando morrem
	--local deadPlayerMoney = 50
	-- Dinheiro ganho quando entra no server
	local joinMoney = 9000

-- Functions
-- This function spawns players when they join
function spawnOnJoin()
	spawnPlayer(source, joinX, joinY, joinZ, 0 , joinSkin)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox(joinMessage, source)
	giveWeapon(source, joinWeapon, joinAmmo)
	givePlayerMoney(source, joinMoney)
end

-- This function spawns players after they died
function spawnOnDead(ammo, killer, weapon, bodypart)
	outputChatBox(getPlayerName(source).." died.")
	takePlayerMoney(source, deadPlayerMoney)
	if (killer) and (killer ~= source) then
		givePlayerMoney(killer, killerMoney)
	end
	setTimer(spawnPlayer, 3000, 1, source, spawnX, spawnY, spawnZ, 0, spawnSkin)
	setCameraTarget(source, source)
	setTimer(giveWeapon, 3000, 1, source, spawnWeapon, spawnAmmo)
end

-- Event handlers
addEventHandler("onPlayerJoin", getRootElement(), spawnOnJoin)
addEventHandler("onPlayerWasted", getRootElement(), spawnOnDead)