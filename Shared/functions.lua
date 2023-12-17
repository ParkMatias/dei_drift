-- Calcula el bono basado en el valor anterior
CalculateBonus = function (previous)
    local points = math.floor(previous)
    if points == nil then
        return 0
    end
    return points
end

-- Calcula el ángulo de un vehículo
Angle = function (veh)
    if not veh then return false end
    local velocityX, velocityY, velocityZ = table.unpack(GetEntityVelocity(veh))
    local velocityMagnitude = math.sqrt(velocityX*velocityX + velocityY*velocityY)

    local rotationX, rotationY, rotationZ = table.unpack(GetEntityRotation(veh,0))
    local sineRotationZ, cosineRotationZ = -math.sin(math.rad(rotationZ)), math.cos(math.rad(rotationZ))

    if GetEntitySpeed(veh)* 3.6 < 30 or GetVehicleCurrentGear(veh) == 0 then return 0, velocityMagnitude end

    local cosX = (sineRotationZ*velocityX + cosineRotationZ*velocityY)/velocityMagnitude
    if cosX > 0.966 or cosX < 0 then return 0, velocityMagnitude end
    return math.deg(math.acos(cosX))*0.5, velocityMagnitude
end

DrawHudText = function (text, colour, coordsX, coordsY, scaleX, scaleY)
    SetTextFont(7)
    SetTextProportional(true)
    SetTextScale(scaleX, scaleY)
    local colourR, colourG, colourB, colourA = table.unpack(colour)
    SetTextColour(colourR, colourG, colourB, colourA)
    SetTextDropshadow(0, 0, 0, 0, colourA)
    SetTextEdge(1, 0, 0, 0, colourA)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayText(coordsX, coordsY)
end