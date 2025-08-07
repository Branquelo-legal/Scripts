-- T-K Hub for King Legacy -- Hub personalizado com todas as funções completas de auto farm -- Inclui suporte a bosses, raids, Sea King, Ghost Ship, Hydra e muito mais

-- Configurações Iniciais (globais) getgenv().TK_AutoFarmLevel = true             -- Auto farm de level getgenv().TK_AutoFarmBoss  = true             -- Auto farm de bosses getgenv().TK_AutoRaidUI    = false            -- Raid Interface (desativada por padrão) getgenv().TK_AutoSeaKing   = true             -- Ativar Sea King auto farm getgenv().TK_AutoGhostShip = true             -- Ghost Ship auto farm getgenv().TK_AutoHydra     = true             -- Hydra auto farm getgenv().TK_ResetFirstLoad = true            -- Reset ao entrar no jogo getgenv().TK_CustomDistance = 15              -- Distância customizada de ataque getgenv().TK_UseSword = true                  -- Usar espada como método de ataque getgenv().TK_UseCombat = false                -- Usar estilo de luta (combat) getgenv().TK_AttackPos = "Above"              -- Posição de ataque: "Above", "Below", "Side" getgenv().TK_SetHeight = 10                   -- Altura para voar durante o farm (1 a 20)

-- Função principal: Carregar Script local function loadTK() local success, response = pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Branquelo-legal/Scripts/main/tk_core.lua"))() end)

if not success then
    warn("[T-K Hub] Falha ao carregar script principal: ", response)
else
    print("[T-K Hub] Script carregado com sucesso!")
end

end

-- Executa quando o jogo estiver totalmente carregado repeat wait() until game:IsLoaded()

