local ped = PlayerPedId()
local cooldown = 30000 -- Hvor lang tid der går mellem hver gang den tager chancen om personen glider. Standard 30 sekunder. Kan blive ændret. (Skrives i millisekunder)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(2)
    local weather = GetWeatherTypeTransition()

    player = PlayerId()

    if weather == 0x54A69840 or weather == -1233681761 then
      if IsPlayerClimbing(player) or IsPedWalking(ped) or IsPedRunning(ped) or IsPedSprinting(ped) then -- Checker om spilleren løber, går eller sprinter
        Wait(cooldown)
        local chance = math.random(1,6) -- Vælger et tal mellem 1 og 6.
        if chance == 1 then -- Hvis tallet bliver 1 glider man.
          local ForwardVector = GetEntityForwardVector(ped)
          SetPedToRagdollWithFall(ped, 1500, 2000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
          exports['mythic_notify']:DoHudText('error', 'Du glider!')
          Wait(cooldown)
        end
      end
    end
  end
end)
