local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local player = game.Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")
local Window = OrionLib:MakeWindow({Name = "Pf2 Auto Farm", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local EggList = require(game.ReplicatedStorage.Pets.Eggs)
local EggCount = 0
local GiftCount = 0
local url = "https://discordapp.com/api/webhooks/1045402784985526272/cnsw7xYLrb1VFcc8SUYoS94VctQBscRdRwiq6KTXLtVvfaxGe6tsk4mP2walmuBIQUA9"
local http = game:GetService("HttpService")
local function discordmess(pet)

end
local Tab1 = Window:MakeTab({
	Name = "Informations",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab2 = Window:MakeTab({
	Name = "ChestBreak",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local args = {
    [1] = game:GetService("Players").LocalPlayer,
    [2] = game:GetService("Players").LocalPlayer.PlayerGui.Main.SettingsFrame.SettingsFrame.Inventory:FindFirstChild("5").MainText,
    [3] = false
}

game:GetService("ReplicatedStorage").RemoteEvents.ChangeSetting:FireServer(unpack(args))
local args = {
    [1] = game:GetService("Players").LocalPlayer,
    [2] = game:GetService("Players").LocalPlayer.PlayerGui.Main.SettingsFrame.SettingsFrame.Inventory:FindFirstChild("6").MainText,
    [3] = false
}

game:GetService("ReplicatedStorage").RemoteEvents.ChangeSetting:FireServer(unpack(args))

local Egg = nil
local Zone = nil
local Activate = false
local ChestAuto = false
local eggpara = Tab1:AddParagraph("Egg Count","0")
local giftpara = Tab1:AddParagraph("Gifts Brokens","0")
local petpara = Tab1:AddParagraph("Last Pets","")
local raritypara = Tab1:AddParagraph("Last Raritys","")
local Players = game.Players
	local VirtualUser = game:GetService("VirtualUser")
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		Players.LocalPlayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
	
    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    local Lighting = game:GetService("Lighting")
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 0
	Lighting.GlobalShadows = false
	Lighting.FogEnd = 9e9
	settings().Rendering.QualityLevel = 1
	for i,v in pairs(game:GetDescendants()) do
		if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		end
	end
	for i,v in pairs(Lighting:GetDescendants()) do
		if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end
	workspace.DescendantAdded:Connect(function(child)
		coroutine.wrap(function()
			if child:IsA('ForceField') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Sparkles') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Smoke') or child:IsA('Fire') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			end
		end)()
	end)
local list = {}
for i,v in pairs(game.Workspace.Eggs:GetChildren()) do
    table.insert(list, v.Name)
end    
Tab:AddDropdown({
	Name = "Egg",
	Default = "Banana",
	Options = list,
	Callback = function(Value)
		Egg = Value
	end    
})
local list = {}
for i,v in pairs(game.Workspace.Islands:GetChildren()) do
    table.insert(list, v.Name)
end    
Tab:AddDropdown({
	Name = "Zone",
	Default = "VIP Island",
	Options = list,
	Callback = function(Value)
		Zone = Value
	end    
})
local chesttog = Tab2:AddToggle({
	Name = "Activate",
	Default = false,
	Callback = function(Value)
		ChestAuto = Value
		if Activate == true then
	       Activate = false
	       autofarmtog:Set(false)
	    end 
	end    
})
local AutoZone = ""
Tab2:AddDropdown({
	Name = "Zone",
	Default = "VIP Island",
	Options = list,
	Callback = function(Value)
	    AutoZone = Value
	end    
})
local autofarmtog = Tab:AddToggle({
	Name = "Activate",
	Default = false,
	Callback = function(Value)
		Activate = Value
		if ChestAuto == true then
	       ChestAuto = false
	       chesttog:Set(false)
	    end 
	end    
})

local function GiftTurn(zone)
    for i,v in pairs(game.Workspace.Islands:FindFirstChild(zone).Presents:GetChildren()) do
        if Activate == true or ChestAuto == true then
            player.Character.HumanoidRootPart.CFrame = v.CFrame
            while player.Mining.Value == false do
                if Activate == true or ChestAuto == true then
                     VirtualInputManager:SendMouseButtonEvent(963, 553, 0, true, game, 1)
                     VirtualInputManager:SendMouseButtonEvent(963, 553, 0, false, game, 1)
                     wait(0.1)
                end     
            end 
            GiftCount =  GiftCount + 1
            giftpara:Set(GiftCount)
            repeat wait(1) until player.Mining.Value == false
        end
    end
end        
local function OpenEgg()
    if player.Improvements:FindFirstChild("31").Value == true then
     	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Eggs:FindFirstChild(Egg).EggStand.CFrame
        local args = {   
         [1] = Egg,
         [2] = "Triple"
         }
         game.ReplicatedStorage.RemoteEvents.EggOpened:InvokeServer(unpack(args))
    else    
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Eggs:FindFirstChild(Egg).EggStand.CFrame
        local args = {   
         [1] = Egg,
         [2] = "Double"
         }
        game.ReplicatedStorage.RemoteEvents.EggOpened:InvokeServer(unpack(args))
    end      
    for i,v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
        if v.Rarity.Value == "Basic" or v.Rarity.Value == "Rare" or v.Rarity.Value == "Epic" or v.Rarity.Value == "Legendary" then
            local args = {
            [1] = "Mass Delete",
            [2] = {
            ["Pets"] = {
            [1] = v.PetID.Value
                        }
                }
                        }
            game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest:InvokeServer(unpack(args))
        end
    end
end
local function HidePlayers()
    for i,v in pairs(game.Workspace.Players:GetChildren()) do
        if v.Name ~= player.Name then
           v:Destroy() 
        end    
    end
end
local function BuyLuck()
    for i = 1,50,1 do
    local args = {
    [1] = game:GetService("ReplicatedStorage").Assets.Potions:FindFirstChild("More Luck Potion"),
    [2] = "Coins"
    }

    game:GetService("ReplicatedStorage").RemoteEvents.BuyPotion:FireServer(unpack(args))
    local args = {
    [1] = game:GetService("ReplicatedStorage").Assets.Potions:FindFirstChild("Luck Potions Mix"),
    [2] = "Coins"
    }

    game:GetService("ReplicatedStorage").RemoteEvents.BuyPotion:FireServer(unpack(args))
    local args = {
    [1] = game:GetService("ReplicatedStorage").Assets.Potions:FindFirstChild("Double Coins Potion"),
    [2] = "Coins"
    }

    game:GetService("ReplicatedStorage").RemoteEvents.BuyPotion:FireServer(unpack(args))
    local args = {
    [1] = game:GetService("ReplicatedStorage").Assets.Potions:FindFirstChild("Faster Breaking Potion"),
    [2] = "Coins"
    }

    game:GetService("ReplicatedStorage").RemoteEvents.BuyPotion:FireServer(unpack(args))


    end
end    
HidePlayers()
OrionLib:Init()
BuyLuck()
BuyLuck()
while wait(5) do
    if Activate == true then
        if player.leaderstats:FindFirstChild(EggList[Egg]["Currency"]).Value < EggList[Egg]["Cost"]*3 then
            GiftTurn(Zone)
            BuyLuck()
        end   
        OpenEgg()
        EggCount = EggCount + 3
        eggpara:Set(EggCount)
    end
    if ChestAuto == true then
        GiftTurn(AutoZone)
    end    
    print(ChestAuto)
end    


