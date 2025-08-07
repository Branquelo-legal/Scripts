local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "T-M Hub",
   LoadingTitle = "Carregando T-M Hub",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- Auto Clicker
getgenv().AutoClick = false

Rayfield:CreateToggle({
    Name = "Auto Click",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().AutoClick = Value
        while getgenv().AutoClick do
            game:GetService("ReplicatedStorage").Events.Click:FireServer()
            task.wait()
        end
    end
})

-- Lista de ovos
local SelectedEgg = "Basic"

Rayfield:CreateDropdown({
    Name = "Selecionar Ovo",
    Options = {"Basic", "Mossy", "Sakura", "Chocolate", "Gummy"},
    CurrentOption = "Basic",
    Callback = function(Value)
        SelectedEgg = Value
    end
})

-- Auto Hatch
getgenv().AutoHatch = false

Rayfield:CreateToggle({
    Name = "Auto Hatch (Triple)",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().AutoHatch = Value
        while getgenv().AutoHatch do
            game:GetService("ReplicatedStorage").Functions.Hatch:InvokeServer(SelectedEgg, "Triple")
            wait(1.5)
        end
    end
})
