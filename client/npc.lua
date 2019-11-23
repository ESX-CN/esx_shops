-------------------------------------------------------------------------------------------------
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

local generalLoaded = false
local PlayingAnim = false

-------------------------------------------------------------------------------------------------
----------------------------------- YOU CAN EDIT THIS LINES -------------------------------------
-------------------------------------------------------------------------------------------------

local StoreClerk = {
-- ID: id of NPC | name: Name of Blip | BlipID: Icone of Blip | VoiceName: NPC Talk When near it | Ambiance: Ambiance of Shop | Weapon: Hash of Weapon | modelHash: Model | X: Position x | Y: Position Y | Z: Position Z | heading: Where Npc look
	{id = 1, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 372.61041259766, y = 326.48727416992, z = 103.56646728516, heading = 238.55166625977},
	{id = 2, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 2557.3112792969, y = 380.75778198242, z = 108.62294006348, heading = 355.44396972656},
	{id = 3, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -3038.7014160156, y = 584.57464599609, z = 7.9089293479919, heading = 19.759059906006},
	{id = 4, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -3242.23046875, y = 999.96301269531, z = 12.830704689026, heading = 354.52578735352},
	{id = 5, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 549.01898193359, y = 2671.5053710938, z = 42.15648651123, heading = 91.560562133789},
	{id = 6, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1959.7720947266, y = 3739.767578125, z = 32.343761444092, heading = 294.44964599609},
	{id = 7, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 2678.0900878906, y = 3279.392578125, z = 55.241134643555, heading = 318.38003540039},
	{id = 8, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1727.8017578125, y = 6415.1284179688, z = 35.037212371826, heading = 242.38659667969},
	{id = 9, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1134.1727294922, y = -982.27307128906, z = 46.415794372559, heading = 272.37396240234},
	{id = 10, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -1222.2886962891, y = -908.50872802734, z = 12.326345443726, heading = 30.502151489258},
	{id = 11, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -1486.0783691406, y = -378.10931396484, z = 40.163387298584, heading = 143.47743225098},
	{id = 12, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -2966.4389648438, y = 390.63397216797, z = 15.043314933777, heading = 77.244613647461},
	{id = 13, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1166.4864501953, y = 2710.84765625, z = 38.157676696777, heading = 160.8677520752},
	{id = 14, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1392.5931396484, y = 3606.3950195313, z = 34.980930328369, heading = 190.97395324707},
	{id = 15, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 129.38829040527, y = -1284.0344238281, z = 29.274105072021, heading = 113.49025726318},
	{id = 16, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -1391.6488037109, y = -605.70904541016, z = 30.31954574585, heading = 115.13928985596},
	{id = 17, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -561.71826171875, y = 287.06121826172, z = 82.176536560059, heading = 250.47801208496},
	{id = 18, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1164.9278564453, y = -324.18096923828, z = 69.205047607422, heading = 103.89968109131},
	{id = 19, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1164.9278564453, y = -324.18096923828, z = 69.205047607422, heading = 103.89968109131},
	{id = 20, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -1819.4888916016, y = 793.48083496094, z = 138.08595275879, heading = 123.9951934814},
	{id = 21, name = "Storeclerk", BlipID = 393, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1697.0340576172, y = 4923.6323242188, z = 42.063678741455, heading = 319.85842895508}
}

-------------------------------------------------------------------------------------------------
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

-- Spawn NPC
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if (not generalLoaded) then
		
		for i=1, #StoreClerk do
			RequestModel(GetHashKey(StoreClerk[i].modelHash))
			while not HasModelLoaded(GetHashKey(StoreClerk[i].modelHash)) do
			Wait(1)
			end
			
			StoreClerk[i].id = CreatePed(2, StoreClerk[i].modelHash, StoreClerk[i].x, StoreClerk[i].y, StoreClerk[i].z, StoreClerk[i].heading, true, true)
			SetPedFleeAttributes(StoreClerk[i].id, 0, 0)
			SetAmbientVoiceName(StoreClerk[i].id, StoreClerk[i].Ambiance)
			SetPedDropsWeaponsWhenDead(StoreClerk[i].id, false)
			SetPedDiesWhenInjured(StoreClerk[i].id, false)
			GiveWeaponToPed(StoreClerk[i].id, StoreClerk[i].Weapon, 2800, false, true)
			
		end
		generalLoaded = true
			
		end
		
	end
end)

-------------------------------------------------------------------------------------------------
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

-- Action when player Near NPC (or not)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		RequestAnimDict("amb@world_human_guard_patrol@male@idle_a")
		while (not HasAnimDictLoaded("amb@world_human_guard_patrol@male@idle_a")) do 
			Citizen.Wait(0) 
		end

		RequestAnimDict("random@shop_clothes@mid")
		while (not HasAnimDictLoaded("random@shop_clothes@mid")) do 
			Citizen.Wait(0) 
		end
		
		for i=1, #StoreClerk do
			distance = GetDistanceBetweenCoords(StoreClerk[i].x, StoreClerk[i].y, StoreClerk[i].z, GetEntityCoords(GetPlayerPed(-1)))
			if distance < 4 and PlayingAnim ~= true then
				TaskPlayAnim(StoreClerk[i].id,"random@shop_gunstore","_greeting", 1.0, -1.0, 4000, 0, 1, true, true, true)
				PlayAmbientSpeech1(StoreClerk[i].id, StoreClerk[i].VoiceName, "SPEECH_PARAMS_FORCE", 1)
				PlayingAnim = true
				Citizen.Wait(4000)
				if PlayingAnim == true then
					TaskPlayAnim(StoreClerk[i].id,"random@shop_gunstore","_idle_b", 1.0, -1.0, -1, 0, 1, true, true, true)
					Citizen.Wait(40000)
				end
			else
				--don't touch this
				--TaskPlayAnim(StoreClerk[i].id,"random@shop_gunstore","_idle", 1.0, -1.0, -1, 0, 1, true, true, true)
			end
			if distance > 5.5 and distance < 6 then
				PlayingAnim = false
			end


		end
	end
end)