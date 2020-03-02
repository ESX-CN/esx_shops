ESX             = nil
local ShopItems = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(shopResult)
		for i=1, #shopResult, 1 do
			if shopResult[i].name thenESX             = nil
			local ShopItems = {}
			
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			
			MySQL.ready(function()
				MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(shopResult)
					for i=1, #shopResult, 1 do
						if shopResult[i].name then
							if ShopItems[shopResult[i].store] == nil then
								ShopItems[shopResult[i].store] = {}
							end
			
							table.insert(ShopItems[shopResult[i].store], {
								label 		= shopResult[i].label,
								label_sc 	= shopResult[i].label_sc,
								label_tc 	= shopResult[i].label_tc,
								item  		= shopResult[i].item,
								price 		= shopResult[i].price,
							})
						else
							print(('esx_shops: invalid item "%s" found!'):format(shopResult[i].item))
						end
					end
				end)
			end)
			
			ESX.RegisterServerCallback('esx_shops:requestDBItems', function(source, cb)
				cb(ShopItems)
			end)
			
			RegisterServerEvent('esx_shops:buyItem')
			AddEventHandler('esx_shops:buyItem', function(itemName, amount, zone)
				local _source = source
				local xPlayer = ESX.GetPlayerFromId(_source)
			
				amount = ESX.Math.Round(amount)
			
				-- is the player trying to exploit?
				if amount < 0 then
					print('esx_shops: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
					return
				end
			
				-- get price
				local price = 0
				local itemLabel = ''
			
				for i=1, #ShopItems[zone], 1 do
					if ShopItems[zone][i].item == itemName then
						price = ShopItems[zone][i].price
						itemLabel = ShopItems[zone][i].label
						itemLabel_cn = ShopItems[zone][i].label_cn
						itemLabel_zh = ShopItems[zone][i].label_zh
						break
					end
				end
			
				price = price * amount
			
				-- can the player afford this item?
				if xPlayer.getMoney() >= price then
					-- can the player carry the said amount of x item?
					if xPlayer.canCarryItem(itemName, amount) then
						xPlayer.removeMoney(price)
						xPlayer.addInventoryItem(itemName, amount)
						TriggerClientEvent('esx:showShopsNotification', xPlayer.source, 'bought', amount, itemLabel, ESX.Math.GroupDigits(price))
					else
						TriggerClientEvent('esx:showShopsNotification', xPlayer.source, 'player_cannot_hold')
					end
				else
					local missingMoney = price - xPlayer.getMoney()
					TriggerClientEvent('esx:showShopsNotification', xPlayer.source, 'not_enough', ESX.Math.GroupDigits(missingMoney))
				end
			end)
			
				if ShopItems[shopResult[i].store] == nil then
					ShopItems[shopResult[i].store] = {}
				end

				table.insert(ShopItems[shopResult[i].store], {
					label 		= shopResult[i].label,
					label_sc 	= shopResult[i].label_sc,
					label_tc 	= shopResult[i].label_tc,
					item  		= shopResult[i].item,
					price 		= shopResult[i].price,
				})
			else
				print(('esx_shops: invalid item "%s" found!'):format(shopResult[i].item))
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_shops:requestDBItems', function(source, cb)
	cb(ShopItems)
end)

RegisterServerEvent('esx_shops:buyItem')
AddEventHandler('esx_shops:buyItem', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		print('esx_shops: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			itemLabel_cn = ShopItems[zone][i].label_cn
			itemLabel_zh = ShopItems[zone][i].label_zh
			break
		end
	end

	price = price * amount

	-- can the player afford this item?
	if xPlayer.getMoney() >= price then
		-- can the player carry the said amount of x item?
		if xPlayer.canCarryItem(itemName, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemName, amount)
			xPlayer.showNotification('bought', amount, itemLabel, ESX.Math.GroupDigits(price))
		else
			xPlayer.showNotification('player_cannot_hold')
		end
	else
		local missingMoney = price - xPlayer.getMoney()
		xPlayer.showNotification('not_enough', ESX.Math.GroupDigits(missingMoney))
	end
end)
