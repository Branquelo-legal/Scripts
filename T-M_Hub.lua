-- T-M Hub com Rayfield Customizado - Feito por Tech
-- Tema: Botão de abrir/fechar, Auto Clicker e Auto Hatch com toggles redondos

-- Carregar Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local WindowVisible = true
local Window = Rayfield:CreateWindow({
    Name = "T-M Hub | Tapping Mayhem",
    LoadingTitle = "Carregando T-M Hub...",
    LoadingSubtitle = "Feito por Tech",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Botão preto com bordas finas brancas para abrir/fechar interface
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
toggleButton.BorderSizePixel = 1
toggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Abrir/Fechar"
toggleButton.Parent = game.CoreGui

toggleButton.MouseButton1Click:Connect(function()
    WindowVisible = not WindowVisible
    for _, gui in pairs(game.CoreGui:GetChildren()) do
        if gui.Name:find("Rayfield") then
            gui.Enabled = WindowVisible
        end
    end
end)

-- Variáveis globais
getgenv().AutoClick = false
getgenv().AutoHatch = false

-- Toggle: Auto Click
Rayfield:CreateToggle({
    Name = "🖱️ Auto Click",
    CurrentValue = false,
    Flag = "AutoClickFlag",
    Callback = function(Value)
        getgenv().AutoClick = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoClick do
                    pcall(function()
                        game:GetService("ReplicatedStorage").Events.Click:FireServer()
                    end)
                    task.wait()
                end
            end)
        end
    end,
})

-- Toggle: Auto Hatch (Basic Egg)
Rayfield:CreateToggle({
    Name = "🐣 Auto Hatch (Basic Egg)",
    CurrentValue = false,
    Flag = "AutoHatchFlag",
    Callback = function(Value)
        getgenv().AutoHatch = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoHatch do
                    pcall(function()
                        game:GetService("ReplicatedStorage").Functions.Hatch:InvokeServer("Basic", "Single")
                    end)
                    task.wait(1.5)
                end
            end)
        end
    end,
})
