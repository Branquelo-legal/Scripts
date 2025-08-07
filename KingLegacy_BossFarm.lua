-- T-K Hub - King Legacy Auto Farm Bosses
-- Interface: Rayfield UI (estilo ArcHub)
-- T = Tech, K = King Legacy

-- Carregar Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "T-K Hub", LoadingTitle = "T-K Hub Script", 
    LoadingSubtitle = "by Branquelo Legal & ChatGPT", 
    ConfigurationSaving = {Enabled=false}, Discord={Enabled=false}, KeySystem=false
})

local Tab = Window:CreateTab("Auto Farm Bosses", 4483362458)

-- Bosses organizados por tipo
local bosses = {
    Normal = {"Smoker", "Tashi", "Captain Clown", "Captain", "The Barbaric", "Karate Fishman", "Shark Man",
              "Dark Leg", "Dory", "King of Snow", "Chopper", "Candle Man", "Bomb Man", "King of Sand",
              "Ball Man", "Rumble Man", "Leader", "Pasta", "Wolf", "Giraffe", "Leo"},
    Raid = {"Oars", "Expert Swordsman", "Santa", "Dragon", "Oden", "King Samurai", "Mrs. Mother", "Jack o Lantern"},
    Golden = {"Boss Man", "Bella", "Green Hair Man", "King Man", "Giant Fighter", "Drill Headman", "Inferno Man", "Captain String"}
}

-- Detectar SEA
local placeId = game.PlaceId
local currentSea = (placeId == 4520749081 and "Normal")
                or (placeId == 6381829480 and "Raid")
                or ((placeId == 5931540094 or placeId == 15759515082) and "Raid") or "Normal"

-- Variáveis de controle
local autoEnabled = false
local selectedBoss = bosses[currentSea][1]
local attackKey = "Z"

-- Interface
Tab:CreateToggle({ Name="Ativar Auto Farm", CurrentValue=false, Callback=function(v) autoEnabled = v end })
Tab:CreateDropdown({ Name="Selecionar Boss", Options=bosses[currentSea], CurrentOption=selectedBoss,
    Callback=function(v) selectedBoss = v end })
Tab:CreateDropdown({ Name="Tipo Ataque", Options={"Z", "X"}, CurrentOption="Z", Callback=function(v) attackKey = v end })

Rayfield:Notify({ Title="T‑K Hub", Content="Interface iniciada com sucesso!", Duration=5, Actions={Ignore={Name="OK",Callback=function() end}}})

-- Lógica de Farm
task.spawn(function()
    while task.wait(0.3) do
        if autoEnabled then
            for _,v in pairs(workspace:GetDescendants()) do
                if v.Name == selectedBoss and v:FindFirstChild("HumanoidRootPart") then
                    local plr = game.Players.LocalPlayer
                    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, attackKey, false, game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, attackKey, false, game)
                    end
                end
            end
        end
    end
end)