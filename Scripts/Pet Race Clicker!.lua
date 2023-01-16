local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Not a cheat") -- Creates the window

local b = w:CreateFolder("AutoPlay") -- Creates the folder(U will put here your buttons,etc)

local run = false
local rebirth = true
local distance = -1

b:Label("AutoRun",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 


b:Toggle("AutoRun",function(bool)
    run = bool
end)


b:Toggle("AutoRebirth",function(bool)
    rebirth = bool
end)

b:Slider("Distance",{
    min = -0.1; -- min value of the slider
    max = -100; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    distance = value
end)



b:DestroyGui()





local plr = game:GetService("Players").LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local hum = character:FindFirstChild("Humanoid")
	
local uis = game:GetService("UserInputService")
game:GetService("RunService").RenderStepped:Connect(function()
local plr = game:GetService("Players").LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local hum = character:FindFirstChild("Humanoid")    
    if game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.Position.Z >= -70 then
        if rebirth == true then
           game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
        end    
        for i,v in pairs(character:GetChildren()) do
            local a = pcall(function()
              v.Position = Vector3.new(-5161,-4,-99)
            end)    
        end
    end
    game:GetService("ReplicatedStorage").Events.PlayerClicks:FireServer()
    if run == true then
        hum.WalkSpeed = hum.WalkSpeed + 5
        local success, err = pcall(function()
        	plr:Move(Vector3.new(0,0,distance))
        end)
    end	
end)

while wait() do
    local esf = pcall(function()
    if game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.Position.Z >= -70 then
        for i,v in pairs(character:GetChildren()) do
            local a = pcall(function()
            print("tp")
            v.Position = Vector3.new(-5161,-4,-99)
            end)    
        end
        end
        end)
end    






