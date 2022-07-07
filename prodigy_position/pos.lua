local lp = getLocalPlayer ()
--Window
win = guiCreateWindow(317, 256, 494, 281, "Você Localização", false)
guiWindowSetSizable(win, false)
tabpanel = guiCreateTabPanel(9, 19, 475, 252, false, win)
--Posição Tab
tabPos = guiCreateTab("Posição", tabpanel)
memo = guiCreateEdit(51, 66, 317, 43, "", false, tabPos)
Label = guiCreateLabel(44, 33, 326, 39, "Sua Posição a Baixo ", false, tabPos)
guiSetFont(Label, "default-bold-small")
buttonClose = guiCreateButton(408, 197, 57, 20, "Fecha", false, tabPos)
guiSetProperty(buttonClose, "NormalTextColour", "FFAAAAAA")
buttonCopy = guiCreateButton(240, 119, 98, 38, "Copiar", false, tabPos)
guiSetProperty(buttonCopy, "NormalTextColour", "FFAAAAAA")
buttonClear = guiCreateButton(72, 119, 98, 38, "Limpar", false, tabPos)
guiSetProperty(buttonClear, "NormalTextColour", "FFAAAAAA")
buttonGetPos = guiCreateButton(342, 4, 123, 48, "Minha Posição", false, tabPos)
guiSetProperty(buttonGetPos, "NormalTextColour", "FFAAAAAA")
checkbox = guiCreateCheckBox(10, 196, 197, 15, "Arredondado Milésima", false, false, tabPos)
--Rotation Tab
tabRot = guiCreateTab("rotação", tabpanel)
memoTwo = guiCreateEdit(51, 66, 317, 43, "", false, tabRot)
guiEditSetReadOnly(memoTwo, true)
buttonGetRot = guiCreateButton(340, 4, 123, 48, "Minha Cordenadas !", false, tabRot)
guiSetProperty(buttonGetRot, "NormalTextColour", "FFAAAAAA")
checkboxTwo = guiCreateCheckBox(10, 196, 197, 15, "Rounded  (nearest thousandth)", false, false, tabRot)
buttonClose2 = guiCreateButton(408, 197, 57, 20, "Fechar", false, tabRot)
guiSetProperty(buttonClose, "NormalTextColour", "FFAAAAAA")
buttonClearTwo = guiCreateButton(72, 119 , 98, 38, "Limpar", false, tabRot)
guiSetProperty(buttonClearTwo, "NormalTextColour", "FFAAAAAA")
buttonCopyTwo = guiCreateButton(240, 119, 98, 38, "Copiar", false, tabRot)
guiSetProperty(buttonCopyTwo, "NormalTextColour", "FFAAAAAA")
LabelTwo = guiCreateLabel(44, 33, 326, 39, "Formato \"X,Y,Z\"", false, tabRot)
guiSetFont(LabelTwo, "default-bold-small")
--Location Tab
tabLoc = guiCreateTab("Minha Localisação", tabpanel)
LabelThree = guiCreateLabel(44, 33, 326, 39, "Você Localização", false, tabLoc)
guiSetFont(LabelThree, "default-bold-small")
memoThree = guiCreateEdit(51, 66, 317, 43, "", false, tabLoc)
guiEditSetReadOnly(memoThree, true)
buttonGetLoc = guiCreateButton(340, 4, 123, 48, "Minha Localização", false, tabLoc)
guiSetProperty(buttonGetLoc, "NormalTextColour", "FFAAAAAA")
buttonClearThree = guiCreateButton(72, 119, 98, 38, "Limpar", false, tabLoc)
guiSetProperty(buttonClearThree, "NormalTextColour", "FFAAAAAA")
buttonCopyThree = guiCreateButton(240, 119, 98, 38, "Copiar", false, tabLoc)
guiSetProperty(buttonCopyThree, "NormalTextColour", "FFAAAAAA")
buttonClose3 = guiCreateButton(408, 197, 57, 20, "Fechar", false, tabLoc)
guiSetProperty(buttonClose, "NormalTextColour", "FFAAAAAA")
-- obter Localização Tab
tabGetLoc = guiCreateTab("obter Localização", tabpanel)
editX = guiCreateEdit(125, 23, 212, 20, "", false, tabGetLoc)
editY = guiCreateEdit(125, 54, 212, 20, "", false, tabGetLoc)
editZ = guiCreateEdit(125, 86, 212, 20, "", false, tabGetLoc)
LabelX = guiCreateLabel(102, 23, 37, 21, "x =", false, tabGetLoc)
LabelY = guiCreateLabel(102, 53, 37, 21, "y =", false, tabGetLoc)
LabelZ = guiCreateLabel(102, 84, 37, 21, "z =", false, tabGetLoc)
buttonGetLocTwo = guiCreateButton(149, 116, 144, 41, "Obter Localização!", false, tabGetLoc)
guiSetProperty(buttonGetLocTwo, "NormalTextColour", "FFAAAAAA")
memoFour = guiCreateEdit(71, 167, 317, 43, "", false, tabGetLoc)
guiEditSetReadOnly(memoFour, true)
buttonAddBlip = guiCreateButton(369, 43, 56, 46, "Adicionar Blip", false, tabGetLoc)
guiSetProperty(buttonAddBlip, "NormalTextColour", "FFAAAAAA")
buttonClose4 = guiCreateButton(408, 197, 57, 20, "Fechar", false, tabGetLoc)
guiSetProperty(buttonClose, "NormalTextColour", "FFAAAAAA")
buttonClearFour = guiCreateButton(260, 1, 77, 22, "Limpar", false, tabGetLoc)
guiSetProperty(buttonClearFour, "NormalTextColour", "FFAAAAAA")
guiSetVisible(win,false)

bindKey ( "=", "down", function( )
        local tostate = not guiGetVisible ( win )
        guiSetVisible ( win, tostate )
        showCursor ( tostate )
end
)

addEventHandler ("onClientGUIClick",root, function ()
	if ( source == buttonClose ) then 
         guiSetVisible ( win, false )
         showCursor ( false )
	elseif ( source == buttonClose2 ) then 
         guiSetVisible ( win, false )
         showCursor ( false )
	elseif ( source == buttonClose3 ) then 
         guiSetVisible ( win, false )
         showCursor ( false )
	elseif ( source == buttonClose4 ) then 
         guiSetVisible ( win, false )
         showCursor ( false )
	elseif ( source == buttonGetPos ) then
			local x,y,z = getElementPosition (lp)
		if (guiCheckBoxGetSelected (checkbox) == false) then
			local x,y,z = getElementPosition (lp)
			guiSetText(memo,x..","..y..","..z)
		else
			guiSetText(memo,table.concat ( { math.round ( x, 3 ), math.round ( y, 3 ), math.round ( z, 3 ), int }, ', ' ) )
			end
	elseif ( source == buttonCopy ) then
		if (guiGetText(memo) == "") then return end
			pos = guiGetText (memo)
			setClipboard ( pos )
			outputChatBox("Position copied to clipboard.")
	elseif ( source == buttonClear ) then
		guiSetText(memo,"")
	elseif( source == buttonGetRot) then
			local rx,ry,rz = getElementRotation(lp)
		if (guiCheckBoxGetSelected(checkboxTwo) == false) then
			guiSetText(memoTwo,rx..", "..ry..", "..rz) 
		else
			guiSetText(memoTwo,table.concat ( { math.round ( rx, 3 ), math.round ( ry, 3 ), math.round ( rz, 3 ), int }, ', ' ) )
			end
	elseif ( source == buttonCopyTwo ) then
		if (guiGetText(memoTwo) == "") then return end
		rot = guiGetText (memoTwo)
		setClipboard ( rot ) 
		outputChatBox("Posição Copiada Só Colar")
	elseif ( source == buttonClearTwo) then
		guiSetText(memoTwo,"")
	elseif ( source == buttonGetLoc ) then
		local x,y,z = getElementPosition (lp)
		city = getZoneName ( x, y, z, true)
		location = getZoneName (x, y, z)
		guiSetText(memoThree,location..", "..city)
	elseif ( source == buttonCopyThree ) then
	if (guiGetText(memoThree) == "") then return end
		loc = guiGetText (memoThree)
		setClipboard ( loc ) 
		outputChatBox("Localização Copiada so colar")
	elseif ( source == buttonClearThree ) then
		guiSetText(memoThree,"")
	elseif ( source == buttonGetLocTwo ) then
		if ( guiGetText ( editX ) == '' or guiGetText ( editY ) =='' or guiGetText ( editZ ) == '' ) then return end
		xx = guiGetText(editX)
		yy = guiGetText (editY)
		zz = guiGetText(editZ)
		city_ = getZoneName ( xx, yy, zz, true)
		location_ = getZoneName (xx, yy, zz)
		guiSetText(memoFour,location_..", "..city_)
	elseif ( source == buttonAddBlip ) then
		if ( guiGetText ( editX ) == '' or guiGetText ( editY ) =='' or guiGetText ( editZ ) == '' ) then return end
		xx = guiGetText(editX)
		yy = guiGetText (editY)
		zz = guiGetText(editZ)
		if (isElement(blip) == true) then
		destroyElement(blip)
		blip = createBlip (xx,yy,zz,41)
		else
		blip = createBlip (xx,yy,zz,41)
		end
	elseif ( source == buttonClearFour) then
		guiSetText(editX,"")
		guiSetText(editY,"")
		guiSetText(editZ,"")
		guiSetText(memoFour,"")
	end
	end
)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end