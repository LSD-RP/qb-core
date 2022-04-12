-- Player load and unload handling
-- New method for checking if logged in across all scripts (optional)
-- if LocalPlayer.state['isLoggedIn'] then
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    ShutdownLoadingScreenNui()
    LocalPlayer.state:set('isLoggedIn', true, false)
    if not QBConfig.Server.PVP then return end
    SetCanAttackFriendly(PlayerPedId(), true, false)
    NetworkSetFriendlyFireOption(true)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    LocalPlayer.state:set('isLoggedIn', false, false)
end)

RegisterNetEvent('QBCore:Client:PvpHasToggled', function(pvp_state)
    SetCanAttackFriendly(PlayerPedId(), pvp_state, false)
    NetworkSetFriendlyFireOption(pvp_state)
end)
-- Teleport Commands

RegisterNetEvent('QBCore:Command:TeleportToPlayer', function(coords)
    local ped = PlayerPedId()
    SetPedCoordsKeepVehicle(ped, coords.x, coords.y, coords.z)
end)

RegisterNetEvent('QBCore:Command:TeleportToCoords', function(x, y, z)
    local ped = PlayerPedId()
    SetPedCoordsKeepVehicle(ped, x, y, z)
end)

RegisterNetEvent('QBCore:Command:GoToMarker', function()
    local ped = PlayerPedId()
    local blip = GetFirstBlipInfoId(8)
    if not DoesBlipExist(blip) then return end
    local blipCoords = GetBlipCoords(blip)
    for height = 1, 1000 do
        SetPedCoordsKeepVehicle(ped, blipCoords.x, blipCoords.y, height + 0.0)
        local foundGround, zPos = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, height + 0.0)
        if foundGround then
            SetPedCoordsKeepVehicle(ped, blipCoords.x, blipCoords.y, height + 0.0)
            break
        end
        Wait(0)
    end
end)

-- Vehicle Commands

RegisterNetEvent('QBCore:Command:SpawnVehicle', function(vehName)
    local ped = PlayerPedId()
    local hash = GetHashKey(vehName)
    local veh = GetVehiclePedIsUsing(ped)
    if not IsModelInCdimage(hash) then return end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
        
     if IsPedInAnyVehicle(ped) then 
        DeleteVehicle(veh)
    end
        
    local vehicle = CreateVehicle(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1)
    SetVehicleFuelLevel(vehicle, 100.0)
    SetModelAsNoLongerNeeded(hash)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end)

RegisterNetEvent('QBCore:Command:DeleteVehicle', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    if veh ~= 0 then
        SetEntityAsMissionEntity(veh, true, true)
        DeleteVehicle(veh)
    else
        local pcoords = GetEntityCoords(ped)
        local vehicles = GetGamePool('CVehicle')
        for k, v in pairs(vehicles) do
            if #(pcoords - GetEntityCoords(v)) <= 5.0 then
                SetEntityAsMissionEntity(v, true, true)
                DeleteVehicle(v)
            end
        end
    end
end)

-- Other stuff

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    QBCore.PlayerData = val
end)

RegisterNetEvent('QBCore:Player:UpdatePlayerData', function()
    TriggerServerEvent('QBCore:UpdatePlayer')
end)

RegisterNetEvent('QBCore:Notify', function(text, type, length)
    QBCore.Functions.Notify(text, type, length)
end)

RegisterNetEvent('QBCore:Client:TriggerCallback', function(name, ...)
    if QBCore.ServerCallbacks[name] then
        QBCore.ServerCallbacks[name](...)
        QBCore.ServerCallbacks[name] = nil
    end
end)

RegisterNetEvent('QBCore:Client:UseItem', function(item)
    TriggerServerEvent('QBCore:Server:UseItem', item)
end)

-- Me command

local function Draw3DText(coords, str)
    local onScreen, worldX, worldY = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords = GetGameplayCamCoord()
	local scale = 200 / (GetGameplayCamFov() * #(camCoords - coords))
    if onScreen then
        SetTextScale(1.0, 0.5 * scale)
        SetTextFont(4)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(2, 0, 0, 0, 150)
		SetTextProportional(1)
		SetTextOutline()
		SetTextCentre(1)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(str)
        EndTextCommandDisplayText(worldX, worldY)
    end
end

RegisterNetEvent('QBCore:Command:ShowMe3D', function(senderId, msg)
    local sender = GetPlayerFromServerId(senderId)
    CreateThread(function()
        local displayTime = 5000 + GetGameTimer()
        while displayTime > GetGameTimer() do
            local targetPed = GetPlayerPed(sender)
            local tCoords = GetEntityCoords(targetPed)
            Draw3DText(tCoords, msg)
            Wait(0)
        end
    end)
end)

-- Stop vehicles from spawning naturally
SetVehicleModelIsSuppressed(`rubble`, true)
SetVehicleModelIsSuppressed(`dump`, true)
SetVehicleModelIsSuppressed(`taco`, true)
SetVehicleModelIsSuppressed(`biff`, true)
SetVehicleModelIsSuppressed(`hydra`, true)
SetVehicleModelIsSuppressed(`rhino`, true)
SetVehicleModelIsSuppressed(`polmav`, true)
SetVehicleModelIsSuppressed(`blimp`, true)
SetVehicleModelIsSuppressed(`blimp2`, true)
SetVehicleModelIsSuppressed(`lazer`, true)
SetVehicleModelIsSuppressed(`policeb`, true)
SetVehicleModelIsSuppressed(`buzzard2`, true)
SetVehicleModelIsSuppressed(`cargoplane`, true)
SetVehicleModelIsSuppressed(`buzzard`, true)
SetVehicleModelIsSuppressed(`cargobob`, true)


--  -----------------Pause menu overrides--------------------------
Citizen.CreateThread(function()
    AddTextEntry('FE_THDR_GTAO', 'Welcome to Little Seoul District - You are Id ' ..GetPlayerServerId(PlayerId()).. ' ')
    AddTextEntry('PM_PANE_LEAVE', '~r~Return to the server list.')
    AddTextEntry('PM_PANE_QUIT', '~r~Quit')
    AddTextEntry('PM_SCR_MAP', '~r~Map')
    AddTextEntry('PM_SCR_GAM', '~r~Take the plane')
    AddTextEntry('PM_SCR_INF', '~r~Logs')
    AddTextEntry('PM_SCR_SET', '~r~Settings')
    AddTextEntry('PM_SCR_STA', '~r~Stats')
    SetMissionName_2(true, "Welcome to the city, Have fun dont be a jerk")
    AddTextEntry('PM_SCR_RPL', '~r~∑ Editor')
  end)

  -----------------Weapon damage overrides------------------------
Citizen.CreateThread(function()
	SetWeaponDamageModifier(`WEAPON_UNARMED`, 0.25)
	SetWeaponDamageModifier(`WEAPON_NIGHTSTICK`, 0.3)
	SetWeaponDamageModifier(`WEAPON_GRENADE`, 0.3)
	SetWeaponDamageModifier(`WEAPON_MOLOTOV`, 0.3)
	SetWeaponDamageModifier(`WEAPON_STICKYBOMB`, 0.3)
	SetWeaponDamageModifier(`WEAPON_PIPEBOMB`, 0.3)
	SetWeaponDamageModifier(`WEAPON_BALL`, 0.3)
	SetWeaponDamageModifier(`WEAPON_FLARE`, 0.3)
	SetWeaponDamageModifier(`WEAPON_RAYPISTOL`, 0.01)
    SetWeaponDamageModifier(`WEAPON_STUNGUN`, 0.00)
	-- SetWeaponDamageModifier(`WEAPON_RPG`, 0.1)
end)
  

local knockedOut = false
local wait = 15
local count = 25

Citizen.CreateThread(function()
	while true do
		Wait(10)
		local myPed = PlayerPedId()
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 115 then
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                QBCore.Functions.Notify("You've been knocked out!")
				wait = 15
				knockedOut = true
				SetEntityHealth(myPed, 116)
			end
		end
		if knockedOut == true then
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 25
					wait = wait - 1
					SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
			end
		end
	end

end)
-- Listen to Shared being updated
RegisterNetEvent('QBCore:Client:OnSharedUpdate', function(tableName, key, value)
    QBCore.Shared[tableName][key] = value
    TriggerEvent('QBCore:Client:UpdateObject')
end)

RegisterNetEvent('QBCore:Client:OnSharedUpdateMultiple', function(tableName, values)
    for key, value in pairs(values) do
        QBCore.Shared[tableName][key] = value
    end
    TriggerEvent('QBCore:Client:UpdateObject')
end)
