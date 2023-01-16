local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Small Hub",
   LoadingTitle = "Small Hub",
   LoadingSubtitle = "A Hub for small Games",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Small Hub"
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Small Hub",
      Subtitle = "Verification System",
      Note = "A Hub for small games",
      FileName = "RayfieldKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Small"
   }
})

local scriptlist = {["Pet Family 2"] = "https://raw.githubusercontent.com/oppoipoi/Small-Hub/main/Scripts/Pet%20Family%202.lua ",["Pet Race Clicker!"] = "https://raw.githubusercontent.com/oppoipoi/Small-Hub/main/Scripts/Pet%20Race%20Clicker!.lua"}
local Tab = Window:CreateTab("Script", 4483362458)
for i,v in pairs(scriptlist) do
   local Section = Tab:CreateSection(i)
local Button = Tab:CreateButton({
   Name = " Run",
   Callback = function()
    local run = loadstring(game:HttpGet(v))()

   end,
})
end
   local Section = Tab:CreateSection("Exit")
local Button = Tab:CreateButton({
   Name = "Exit",
   Callback = function()
        Rayfield:Destroy()
   end,
})

