-- ===== Dynamic VIP system via Pastebin =====
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer

local VIPUrl = "https://pastebin.com/raw/U4FNu3Vi"

local data
local success, err = pcall(function()
    for i = 1, 3 do
        data = game:HttpGet(VIPUrl)
        if data then break end
        wait(0.5)
    end
end)

if not success or not data then
    warn("Gagal mengambil daftar VIP dari Pastebin!")
    return
end

local vipList = {}
for name in string.gmatch(data, "[^\r\n]+") do
    name = name:gsub("^%s*(.-)%s*$", "%1")
    if name ~= "" then
        table.insert(vipList, name)
    end
end

local isVIP = false
for _, name in pairs(vipList) do
    if player.Name == name then
        isVIP = true
        break
    end
end

if not isVIP then
    warn("Script ini hanya untuk user VIP!")
    return
end

if _G.AutoFarm then _G.AutoFarm = false end
if _G.Toggles then
    for _, flag in pairs(_G.Toggles) do
        _G[flag] = nil
    end
end
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end
if _G.Events then
    for _, connection in pairs(_G.Events) do
        if connection.Connected then
            connection:Disconnect()
        end
    end
    _G.Events = {}
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "VIP SCRIPT BY XIIELL",
    LoadingTitle = "Memuat Script Vip Xiiell",
    LoadingSubtitle = "oleh Xiiell",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "DeltaUI",
       FileName = "ConfigDelta"
    },
    Discord = {Enabled = false},
    KeySystem = false,
})

local MainTab = Window:CreateTab("Utama", 4483362458)
MainTab:CreateSection("Fitur Utama")

_G.Toggles = _G.Toggles or {}
local function buatToggle(namaToggle, callback)
    table.insert(_G.Toggles, namaToggle)
    MainTab:CreateToggle({
        Name = namaToggle,
        CurrentValue = false,
        Flag = namaToggle,
        Callback = callback
    })
end

-- ===== Auto Summit (Gunung Yaudah) =====
buatToggle("Gunung Yaudah", function(Value)
    if Value then
        print("Auto Summit aktif")
        _G.AutoYaudah = true
        local player = game.Players.LocalPlayer
        
        spawn(function()
            local running = true
            while running and _G.AutoYaudah do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")
                
                local camps = {
                    Vector3.new(-40, 96, -77),
                    Vector3.new(554, 99, -162),
                    Vector3.new(629, 238, -118),
                    Vector3.new(667, 376, -543),
                    Vector3.new(292, 290, -891),
                    Vector3.new(341, 516, -896),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoYaudah then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoYaudah then
                    print("Mencapai summit, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)
        
    else
        _G.AutoYaudah = false
        print("Auto Summit nonaktif")
    end
end)

-- ===== Gunung Konoha =====
buatToggle("Gunung Konoha", function(Value)
    if Value then
        print("Gunung Konoha aktif")
        _G.AutoKonoha = true
        local player = game.Players.LocalPlayer

        spawn(function()
            local running = true
            while running and _G.AutoKonoha do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")

                local camps = {
                    Vector3.new(765, 288, -535),
                    Vector3.new(775, 522, -374),
                    Vector3.new(-73, 476, 383),
                    Vector3.new(190, 584, 728),
                    Vector3.new(342, 588, 818),
                    Vector3.new(831, 820, 565),
                    Vector3.new(923, 1003, 600),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoKonoha then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoKonoha then
                    print("Mencapai summit Konoha, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)

    else
        _G.AutoKonoha = false
        print("Gunung Konoha nonaktif")
    end
end)

-- ===== MT  Seminung ====
buatToggle("Gunung Seminung", function(Value)
    if Value then
        print("Gunung Seminung aktif")
        _G.AutoSeminung = true
        local player = game.Players.LocalPlayer

        spawn(function()
            local running = true
            while running and _G.AutoSeminung do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")

                local camps = {
                    Vector3.new(-445, 62, -754),
                    Vector3.new(-789, 124, -522),
                    Vector3.new(-455, 136, -371),
                    Vector3.new(-21, 111, -192),
                    Vector3.new(-118, 155, 575),
                    Vector3.new(-303, 305, 802),
                    Vector3.new(-498, 330, 910),
                    Vector3.new(-842, 182, 585),
                    Vector3.new(-403, 538, 215),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoSeminung then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoSeminung then
                    print("Mencapai summit Seminung, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)

    else
        _G.AutoSeminung = false
        print("Gunung Seminung nonaktif")
    end
end)

-- ===== Tab Menu Lain =====
local OtherTab = Window:CreateTab("Menu Lain", 4483362458)
OtherTab:CreateSection("Fitur Tambahan")

OtherTab:CreateButton({
    Name = "Fly",
    Callback = function()
        print("Fly aktif, memuat script eksternal...")
        local success, err = pcall(function()
            local flyScript = "https://raw.githubusercontent.com/DevPhoriaa/robloxscript/main/menuscript/main.lua"
            loadstring(game:HttpGet(flyScript))()
        end)
        if not success then
            warn("Gagal memuat Fly script: " .. tostring(err))
        end
    end
})


OtherTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBright",
    Callback = function(Value)
        local Lighting = game:GetService("Lighting")
        local player = game.Players.LocalPlayer

        local function applyFullBright()
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end

        local function maintainFullBright()
            spawn(function()
                while _G.FullBright do
                    if Lighting.Brightness ~= 2 then
                        Lighting.Brightness = 2
                    end
                    if Lighting.ClockTime ~= 14 then
                        Lighting.ClockTime = 14
                    end
                    if Lighting.FogEnd ~= 100000 then
                        Lighting.FogEnd = 100000
                    end
                    if Lighting.GlobalShadows ~= false then
                        Lighting.GlobalShadows = false
                    end
                    if Lighting.OutdoorAmbient ~= Color3.fromRGB(128, 128, 128) then
                        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                    end
                    wait(2) -- ringan
                end
            end)
        end

        if Value then
            print("Full Bright aktif")
            _G.FullBright = true
            applyFullBright()
            maintainFullBright()

            -- Auto aktif lagi setiap respawn
            if not _G.FullBrightConnection then
                _G.FullBrightConnection = player.CharacterAdded:Connect(function()
                    if _G.FullBright then
                        wait(1) -- kasih delay dikit biar Lighting siap
                        applyFullBright()
                    end
                end)
            end
        else
            print("Full Bright nonaktif")
            _G.FullBright = false

            -- Reset ke default Roblox Lighting
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.FogEnd = 1000
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

            -- Putuskan koneksi agar tidak boros
            if _G.FullBrightConnection then
                _G.FullBrightConnection:Disconnect()
                _G.FullBrightConnection = nil
            end
        end
    end
})



OtherTab:CreateToggle({
    Name = "Toggle Contoh",
    CurrentValue = false,
    Flag = "ToggleContoh",
    Callback = function(Value)
        if Value then
            print("Toggle Contoh aktif")
        else
            print("Toggle Contoh nonaktif")
        end
    end
})

print("UI Delta Executor modular siap digunakan oleh VIP!")if not isVIP then
    warn("Script ini hanya untuk user VIP!")
    return
end

if _G.AutoFarm then _G.AutoFarm = false end
if _G.Toggles then
    for _, flag in pairs(_G.Toggles) do
        _G[flag] = nil
    end
end
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end
if _G.Events then
    for _, connection in pairs(_G.Events) do
        if connection.Connected then
            connection:Disconnect()
        end
    end
    _G.Events = {}
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "VIP SCRIPT BY XIIELL",
    LoadingTitle = "Memuat Script Vip Xiiell",
    LoadingSubtitle = "oleh Xiiell",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "DeltaUI",
       FileName = "ConfigDelta"
    },
    Discord = {Enabled = false},
    KeySystem = false,
})

local MainTab = Window:CreateTab("Utama", 4483362458)
MainTab:CreateSection("Fitur Utama")

_G.Toggles = _G.Toggles or {}
local function buatToggle(namaToggle, callback)
    table.insert(_G.Toggles, namaToggle)
    MainTab:CreateToggle({
        Name = namaToggle,
        CurrentValue = false,
        Flag = namaToggle,
        Callback = callback
    })
end

buatToggle("Auto Farm", function(Value)
    if Value then
        print("Auto Farm aktif")
        _G.AutoFarm = true
        while _G.AutoFarm do
            wait(1)
            print("Sedang farming...")
        end
    else
        _G.AutoFarm = false
        print("Auto Farm nonaktif")
    end
end)

buatToggle("Anti AFK", function(Value)
    if Value then
        print("Anti AFK aktif")
        _G.AntiAFK = true
        local player = game.Players.LocalPlayer
        while _G.AntiAFK do
            wait(30)
            if player then
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
        end
    else
        _G.AntiAFK = false
        print("Anti AFK nonaktif")
    end
end)

-- ===== Auto Summit (Gunung Yaudah) =====
buatToggle("Gunung Yaudah", function(Value)
    if Value then
        print("Auto Summit aktif")
        _G.AutoYaudah = true
        local player = game.Players.LocalPlayer
        
        spawn(function()
            local running = true
            while running and _G.AutoYaudah do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")
                
                local camps = {
                    Vector3.new(-40, 96, -77),
                    Vector3.new(554, 99, -162),
                    Vector3.new(629, 238, -118),
                    Vector3.new(667, 376, -543),
                    Vector3.new(292, 290, -891),
                    Vector3.new(341, 516, -896),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoYaudah then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoYaudah then
                    print("Mencapai summit, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)
        
    else
        _G.AutoYaudah = false
        print("Auto Summit nonaktif")
    end
end)

-- ===== Gunung Konoha =====
buatToggle("Gunung Konoha", function(Value)
    if Value then
        print("Gunung Konoha aktif")
        _G.AutoKonoha = true
        local player = game.Players.LocalPlayer

        spawn(function()
            local running = true
            while running and _G.AutoKonoha do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")

                local camps = {
                    Vector3.new(765, 288, -535),
                    Vector3.new(775, 522, -374),
                    Vector3.new(-73, 476, 383),
                    Vector3.new(190, 584, 728),
                    Vector3.new(342, 588, 818),
                    Vector3.new(831, 820, 565),
                    Vector3.new(923, 1003, 600),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoKonoha then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoKonoha then
                    print("Mencapai summit Konoha, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)

    else
        _G.AutoKonoha = false
        print("Gunung Konoha nonaktif")
    end
end)

-- ===== MT  Seminung ====
buatToggle("Gunung Seminung", function(Value)
    if Value then
        print("Gunung Seminung aktif")
        _G.AutoSeminung = true
        local player = game.Players.LocalPlayer

        spawn(function()
            local running = true
            while running and _G.AutoKonoha do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")

                local camps = {
                    Vector3.new(765, 288, -535),
                    Vector3.new(775, 522, -374),
                    Vector3.new(-73, 476, 383),
                    Vector3.new(190, 584, 728),
                    Vector3.new(342, 588, 818),
                    Vector3.new(831, 820, 565),
                    Vector3.new(923, 1003, 600),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoSeminung then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoSeminung then
                    print("Mencapai summit Seminung, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)

    else
        _G.AutoSeminung = false
        print("Gunung Seminung nonaktif")
    end
end)

-- ===== Tab Menu Lain =====
local OtherTab = Window:CreateTab("Menu Lain", 4483362458)
OtherTab:CreateSection("Fitur Tambahan")

OtherTab:CreateButton({
    Name = "Fly",
    Callback = function()
        print("Fly aktif, memuat script eksternal...")
        local success, err = pcall(function()
            local flyScript = "https://raw.githubusercontent.com/DevPhoriaa/robloxscript/main/menuscript/main.lua"
            loadstring(game:HttpGet(flyScript))()
        end)
        if not success then
            warn("Gagal memuat Fly script: " .. tostring(err))
        end
    end
})

OtherTab:CreateToggle({
    Name = "Toggle Contoh",
    CurrentValue = false,
    Flag = "ToggleContoh",
    Callback = function(Value)
        if Value then
            print("Toggle Contoh aktif")
        else
            print("Toggle Contoh nonaktif")
        end
    end
})

print("UI Delta Executor modular siap digunakan oleh VIP!")    Discord = {Enabled = false},
    KeySystem = false,
})

local MainTab = Window:CreateTab("Utama", 4483362458)
MainTab:CreateSection("Fitur Utama")

_G.Toggles = _G.Toggles or {}
local function buatToggle(namaToggle, callback)
    table.insert(_G.Toggles, namaToggle)
    MainTab:CreateToggle({
        Name = namaToggle,
        CurrentValue = false,
        Flag = namaToggle,
        Callback = callback
    })
end

buatToggle("Auto Farm", function(Value)
    if Value then
        print("Auto Farm aktif")
        _G.AutoFarm = true
        while _G.AutoFarm do
            wait(1)
            print("Sedang farming...")
        end
    else
        _G.AutoFarm = false
        print("Auto Farm nonaktif")
    end
end)

buatToggle("Anti AFK", function(Value)
    if Value then
        print("Anti AFK aktif")
        _G.AntiAFK = true
        local player = game.Players.LocalPlayer
        while _G.AntiAFK do
            wait(30)
            if player then
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
        end
    else
        _G.AntiAFK = false
        print("Anti AFK nonaktif")
    end
end)

-- ===== Auto Summit (Gunung Yaudah) =====
buatToggle("Gunung Yaudah", function(Value)
    if Value then
        print("Auto Summit aktif")
        _G.AutoYaudah = true
        local player = game.Players.LocalPlayer
        
        spawn(function()
            local running = true
            while running and _G.AutoYaudah do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")
                
                local camps = {
                    Vector3.new(-40, 96, -77),
                    Vector3.new(554, 99, -162),
                    Vector3.new(629, 238, -118),
                    Vector3.new(667, 376, -543),
                    Vector3.new(292, 290, -891),
                    Vector3.new(341, 516, -896),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoYaudah then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoYaudah then
                    print("Mencapai summit, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)
        
    else
        _G.AutoYaudah = false
        print("Auto Summit nonaktif")
    end
end)

-- ===== Gunung Konoha =====
buatToggle("Gunung Konoha", function(Value)
    if Value then
        print("Gunung Konoha aktif")
        _G.AutoKonoha = true
        local player = game.Players.LocalPlayer

        spawn(function()
            local running = true
            while running and _G.AutoKonoha do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")

                local camps = {
                    Vector3.new(765, 288, -535),
                    Vector3.new(775, 522, -374),
                    Vector3.new(-73, 476, 383),
                    Vector3.new(190, 584, 728),
                    Vector3.new(342, 588, 818),
                    Vector3.new(831, 820, 565),
                    Vector3.new(923, 1003, 600),
                }

                for _, pos in pairs(camps) do
                    if not _G.AutoKonoha then running = false break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                if running and _G.AutoKonoha then
                    print("Mencapai summit Konoha, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health)
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                end
                wait(1)
            end
        end)

    else
        _G.AutoKonoha = false
        print("Gunung Konoha nonaktif")
    end
end)

-- ===== Tab Menu Lain =====
local OtherTab = Window:CreateTab("Menu Lain", 4483362458)
OtherTab:CreateSection("Fitur Tambahan")

OtherTab:CreateButton({
    Name = "Fly",
    Callback = function()
        print("Fly aktif, memuat script eksternal...")
        local success, err = pcall(function()
            local flyScript = "https://raw.githubusercontent.com/DevPhoriaa/robloxscript/main/menuscript/main.lua"
            loadstring(game:HttpGet(flyScript))()
        end)
        if not success then
            warn("Gagal memuat Fly script: " .. tostring(err))
        end
    end
})

OtherTab:CreateToggle({
    Name = "Toggle Contoh",
    CurrentValue = false,
    Flag = "ToggleContoh",
    Callback = function(Value)
        if Value then
            print("Toggle Contoh aktif")
        else
            print("Toggle Contoh nonaktif")
        end
    end
})

print("UI Delta Executor modular siap digunakan oleh VIP!")
