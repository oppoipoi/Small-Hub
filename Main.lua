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

local List = loadstring(game:HttpGet('https://raw.githubusercontent.com/oppoipoi/Small-Hub/main/ScriptList.lua'))()
List:list()
