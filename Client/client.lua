local score, screenScore, idleTime, mult, total, curAlpha, cash = 0, 0, 0, 0.2, 0, 0, 0

local playerPed = PlayerPedId()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    local currentTick = GetGameTimer()
        if not IsPedDeadOrDying(playerPed, false) then
            local vehicle = GetVehiclePedIsUsing(playerPed)
            if vehicle and GetPedInVehicleSeat(vehicle, -1) == playerPed and IsVehicleOnAllWheels(vehicle) and not IsPedInFlyingVehicle(playerPed) then
                local angle, velocity = Angle(vehicle)
                local tempBool = currentTick - (idleTime or 0) < 1850
                if not tempBool and score ~= 0 then
                    local previousScore = CalculateBonus(score)
                    total = total + previousScore
                    cash = math.floor(total)
                    local player = GetPlayerServerId(PlayerId())
                    TriggerServerEvent("dei_drift:GiveCash", player, cash)
                    score = 0
					total = 0
                end
                if angle ~= 0 then
                    if score == 0 then
                        local drifting = true
                        local driftTime = currentTick
                    end
                    score = tempBool and score + math.floor(angle * velocity * mult) or math.floor(angle * velocity * mult)
                    screenScore = CalculateBonus(score)
                    idleTime = currentTick
                end
            end
        end
        curAlpha = currentTick - (idleTime or 0) < 3000 and math.min(255, curAlpha + 10) or math.max(0, curAlpha - 10)
        screenScore = screenScore or 0

        DrawHudText(string.format("\n+%s", tostring(screenScore)), {255, 191, 0, curAlpha}, 0.5, 0.0, 0.7, 0.7)
    end
end)
