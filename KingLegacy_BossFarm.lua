-- King Legacy - Super Auto Farm Boss - Mobile Delta UI
-- Feito para Executor Delta (funciona mobile)

-- CONFIGURAÇÃO
local AttackMode = "Sword" -- "Sword" ou "Fighting"
local FlightHeight = 5 -- Altura padrão (1 a 20)

-- Detectar SEA
local sea = "Sea 1"
if game.PlaceId == 10519227869 then
    sea = "Sea 2"
elseif game.PlaceId == 13210813857 then
    sea = "Sea 3"
end

-- Bosses
local bosses = {
    ["Sea 1"] = {
        {name = "Gorilla King", level = 30},
        {name = "Tashi", level = 100},
        {name = "Mob Leader", level = 180},
        {name = "Saw", level = 250},
        {name = "Vice Admiral", level = 350},
        {name = "Anubis", level = 500},
        {name = "Captain Z", level = 675},
        {name = "Dark Beard", level = 800},
    },
    ["Sea 2"] = {
        {name = "Marco", level = 1100},
        {name = "Oars", level = 1200},
        {name = "Kanjuro", level = 1350},
        {name = "Kaido", level = 1500},
        {name = "Whitebeard", level = 1650},
        {name = "Shanks", level = 1800},
    },
    ["Sea 3"] = {
        {name = "Zeus", level = 2000},
        {name = "Big Mom", level = 2100},
        {name = "Enma Zoro", level = 2200},
        {name = "Katakuri", level = 2300},
        {name = "Im", level = 2500},
    }
}

local farming = false

-- Funções de ataque
function attack()
    if AttackMode == "Sword" then
        -- Espada usa Z e X
        local keys = {"Z", "X"}
        for _,k in pairs(keys) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, k, false, game)
            wait(0.3)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, k, false, game)
        end
    elseif AttackMode == "Fighting" then
        -- Estilo de luta usa Z,X,C,V,B
        local keys = {"Z","X","C","V","B"}
        for _,k in pairs(keys) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, k, false, game)
            wait(0.3)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, k, false, game)
        end
    end
end

function teleportTo(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, FlightHeight, 0))
end

function farmBoss(name)
    for _,v in pairs(game:GetService("Workspace").Enemy:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v.Name == name then
            repeat
                teleportTo(v.HumanoidRootPart.Position)
                attack()
                wait(0.5)
            until not v or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or farming == false
        end
    end
end

-- GUI
local ScreenGui = Instance.new("ScreenGui")
local OpenButton = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local BossList = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local HeightBox = Instance.new("TextBox")
local AttackModeDropdown = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "BossFarmGUI"
ScreenGui.ResetOnSpawn = false

-- Botão vermelho Delta
OpenButton.Name = "OpenButton"
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.fromRGB(200,0,0)
OpenButton.Position = UDim2.new(0,10,0.4,0)
OpenButton.Size = UDim2.new(0,50,0,50)
OpenButton.Text = "≡"
OpenButton.TextColor3 = Color3.fromRGB(255,255,255)
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.TextSize = 24
OpenButton.Draggable = true

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50,50,50)
Frame.BackgroundTransparency = 0.2
Frame.Position = UDim2.new(0.02,0,0.3,0)
Frame.Size = UDim2.new(0,260,0,320)
Frame.Visible = false
Frame.Draggable = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "Auto Farm Boss"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

BossList.Name = "BossList"
BossList.Parent = Frame
BossList.BackgroundTransparency = 1
BossList.Position = UDim2.new(0,10,0,40)
BossList.Size = UDim2.new(1,-20,0,150)
BossList.TextColor3 = Color3.fromRGB(200,200,200)
BossList.Font = Enum.Font.SourceSans
BossList.TextSize = 15
BossList.TextXAlignment = Enum.TextXAlignment.Left
BossList.TextYAlignment = Enum.TextYAlignment.Top
BossList.TextWrapped = true
BossList.Text = ""

-- Preencher lista de bosses
for _, boss in pairs(bosses[sea]) do
    BossList.Text = BossList.Text.."- "..boss.name.." (Lv."..boss.level..")\n"
end

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(80,80,80)
ToggleButton.Position = UDim2.new(0.1,0,0.7,0)
ToggleButton.Size = UDim2.new(0.8,0,0,40)
ToggleButton.Text = "Iniciar Farm"
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 18

HeightBox.Name = "HeightBox"
HeightBox.Parent = Frame
HeightBox.BackgroundColor3 = Color3.fromRGB(70,70,70)
HeightBox.Position = UDim2.new(0.1,0,0.55,0)
HeightBox.Size = UDim2.new(0.8,0,0,30)
HeightBox.PlaceholderText = "Altura (1-20)"
HeightBox.TextColor3 = Color3.fromRGB(255,255,255)
HeightBox.Font = Enum.Font.SourceSans
HeightBox.TextSize = 16
HeightBox.Text = tostring(FlightHeight)

AttackModeDropdown.Name = "AttackMode"
AttackModeDropdown.Parent = Frame
AttackModeDropdown.BackgroundColor3 = Color3.fromRGB(100,100,100)
AttackModeDropdown.Position = UDim2.new(0.1,0,0.85,0)
AttackModeDropdown.Size = UDim2.new(0.8,0,0,30)
AttackModeDropdown.Text = "Modo Ataque: "..AttackMode
AttackModeDropdown.TextColor3 = Color3.fromRGB(255,255,255)
AttackModeDropdown.Font = Enum.Font.SourceSans
AttackModeDropdown.TextSize = 16

-- Botões
OpenButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

ToggleButton.MouseButton1Click:Connect(function()
    farming = not farming
    ToggleButton.Text = farming and "Parar Farm" or "Iniciar Farm"
    if farming then
        spawn(function()
            while farming do
                for _, boss in pairs(bosses[sea]) do
                    farmBoss(boss.name)
                    wait(1)
                    if not farming then break end
                end
            end
        end)
    end
end)

HeightBox.FocusLost:Connect(function()
    local val = tonumber(HeightBox.Text)
    if val and val >=1 and val <=20 then
        FlightHeight = val
    else
        HeightBox.Text = tostring(FlightHeight)
    end
end)

AttackModeDropdown.MouseButton1Click:Connect(function()
    AttackMode = (AttackMode=="Sword") and "Fighting" or "Sword"
    AttackModeDropdown.Text = "Modo Ataque: "..AttackMode
end)
