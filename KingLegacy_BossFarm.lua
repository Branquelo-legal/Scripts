-- TEK Hub - King Legacy Auto Boss Farm GUI
-- Desenvolvido com carinho por ChatGPT ♥

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3"))()
local window = library:CreateWindow("TEK - King Legacy", Vector2.new(500, 400), Enum.KeyCode.RightControl)

local FarmTab = window:CreateTab("Auto Farm Boss")
local SettingsTab = window:CreateTab("Farm Settings")

-- Variáveis de configuração
_G.SelectedWeapon = "Sword"
_G.FarmDistance = 5
_G.FarmPosition = "Above"

-- Função para detectar Bosses
function getBoss()
    for _, v in pairs(game:GetService("Workspace").Enemy:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            local bossNames = {"Hydra", "Kong", "Captain Elephant", "Snow Lurker", "Sea King", "Dark Beard", "Kaido", "Flame User"}
            for _, name in ipairs(bossNames) do
                if string.find(v.Name, name) then
                    return v
                end
            end
        end
    end
    return nil
end

-- Função de ataque
function attackBoss(boss)
    local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local offset = Vector3.new(0, 0, 0)
    if _G.FarmPosition == "Above" then
        offset = Vector3.new(0, _G.FarmDistance, 0)
    elseif _G.FarmPosition == "Below" then
        offset = Vector3.new(0, -_G.FarmDistance, 0)
    elseif _G.FarmPosition == "Side" then
        offset = Vector3.new(_G.FarmDistance, 0, 0)
    end

    root.CFrame = boss.HumanoidRootPart.CFrame + offset

    local tool = nil
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, _G.SelectedWeapon) then
            tool = v
            break
        end
    end
    if tool then
        tool.Parent = game.Players.LocalPlayer.Character
        tool:Activate()
    end
end

-- Loop de farm
_G.AutoFarmBoss = false
function autoFarmLoop()
    while _G.AutoFarmBoss do
        local boss = getBoss()
        if boss then
            attackBoss(boss)
        end
        wait(0.3)
    end
end

-- Botão principal
FarmTab:CreateToggle("Auto Farm Bosses", nil, function(state)
    _G.AutoFarmBoss = state
    if state then
        autoFarmLoop()
    end
end)

-- Dropdown para arma
SettingsTab:CreateDropdown("Select Weapon", {"Sword", "Combat"}, function(value)
    _G.SelectedWeapon = value
end)

-- Slider para distância
SettingsTab:CreateSlider("Set Distance", 1, 20, function(value)
    _G.FarmDistance = value
end)

-- Dropdown para posição
SettingsTab:CreateDropdown("Select Position", {"Above", "Below", "Side"}, function(value)
    _G.FarmPosition = value
end)

-- Créditos
local InfoTab = window:CreateTab("About")
InfoTab:CreateLabel("TEK - Boss AutoFarm")
InfoTab:CreateLabel("Inspired by ArcHub")
InfoTab:CreateLabel("Created by Branquelo Legal & ChatGPT")