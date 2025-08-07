-- T-M Hub - Tocando Caos Auto Click
-- Interface: Rayfield UI (estilo ArcHub)
-- T = Tech, M = Mayhem

-- Carregar Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "T-M Hub",
    LoadingTitle = "T-M Hub Script",
    LoadingSubtitle = "by Branquelo Legal & ChatGPT",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = false},
    KeySystem = false,
})

local Tab = Window:CreateTab("Auto Click", 4483362458)
local vim = game:GetService("VirtualInputManager")

-- Auto Click
getgenv().AutoClick = false

Tab:CreateToggle({
    Name = "Ativar Auto Click",
    CurrentValue = false,
    Callback = function(v)
        getgenv().AutoClick = v
        task.spawn(function()
            while getgenv().AutoClick do
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                wait()
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                wait()
            end
        end)
    end
})

-- Notificação de sucesso
Rayfield:Notify({
    Title = "T-M Hub",
    Content = "Auto Click carregado com sucesso!",
    Duration = 5,
    Actions = {
        Ignore = {Name = "OK", Callback = function() end}
    }
})
