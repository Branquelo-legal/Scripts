local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
   Name = "TEK - Boss Farm",
   LoadingTitle = "Carregando TEK...",
   LoadingSubtitle = "Por Branquelo & Tek",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "TEKConfig",
      FileName = "KingLegacyUI"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("⚔️ Boss Farm", 4483362458)

local AutoFarm = MainTab:CreateToggle({
   Name = "Auto Farm Boss",
   CurrentValue = false,
   Flag = "AutoFarmBoss",
   Callback = function(Value)
      getgenv().AutoFarmBoss = Value
   end
})

local BossDropdown = MainTab:CreateDropdown({
   Name = "Selecionar Boss",
   Options = {"Hydra", "King Samurai", "Dark Beard", "Snow Demon"},
   CurrentOption = "Hydra",
   Flag = "SelecionarBoss",
   Callback = function(Value)
      getgenv().BossSelecionado = Value
   end
})

local WeaponDropdown = MainTab:CreateDropdown({
   Name = "Selecionar Arma",
   Options = {"Sword", "Combat"},
   CurrentOption = "Sword",
   Flag = "SelecionarArma",
   Callback = function(Value)
      getgenv().TipoArma = Value
   end
})

-- Configurações de Farm
local FarmTab = Window:CreateTab("⚙️ Farm Settings", 4483362458)

FarmTab:CreateSlider({
   Name = "Distance (1-20)",
   Range = {1, 20},
   Increment = 1,
   Suffix = "distância",
   CurrentValue = 5,
   Flag = "DistanceFarm",
   Callback = function(Value)
      getgenv().FarmDistance = Value
   end
})

FarmTab:CreateSlider({
   Name = "Set Distance (Bug Fix)",
   Range = {1, 20},
   Increment = 1,
   Suffix = "offset",
   CurrentValue = 3,
   Flag = "SetBugDistance",
   Callback = function(Value)
      getgenv().BugFixDistance = Value
   end
})

FarmTab:CreateDropdown({
   Name = "Posição de ataque",
   Options = {"Above", "Below", "Side"},
   CurrentOption = "Above",
   Flag = "FarmPosition",
   Callback = function(Value)
      getgenv().FarmPosition = Value
   end
})
