-- ===== Dynamic VIP system via Pastebin =====
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer

-- Link Pastebin raw berisi daftar VIP
local VIPUrl = "https://pastebin.com/raw/U4FNu3Vi"

-- Ambil CSV/Plain Text dengan retry
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

-- Parsing data menjadi array username dan trim spasi
local vipList = {}
for name in string.gmatch(data, "[^\r\n]+") do
    name = name:gsub("^%s*(.-)%s*$", "%1")
    if name ~= "" then
        table.insert(vipList, name)
    end
end

-- Cek apakah player termasuk VIP
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

-- ===== Hentikan semua script sebelumnya =====
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

-- ===== Load Rayfield dari Sirius =====
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ===== Buat window utama =====
local Window = Rayfield:CreateWindow({
    Name = "UI Delta Executor",
    LoadingTitle = "Memuat UI Delta Executor",
    LoadingSubtitle = "oleh Xiiell",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "DeltaUI",
       FileName = "ConfigDelta"
    },
    Discord = {Enabled = false},
    KeySystem = false,
})

-- ===== Tab Utama =====
local MainTab = Window:CreateTab("Utama", 4483362458)
MainTab:CreateSection("Fitur Utama")

-- ===== Fungsi untuk membuat toggle baru =====
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

-- Toggle: AutoFarm
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

-- Toggle: Anti AFK
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

-- Toggle: Auto Summit Gunung dengan respawn dan loop otomatis
buatToggle("Gunung Yaudah", function(Value)
    if Value then
        print("Auto Summit aktif")
        _G.AutoSummit = true
        local player = game.Players.LocalPlayer
        
        spawn(function()
            while _G.AutoSummit do
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")
                
                -- Daftar koordinat camp
                local camps = {
                    Vector3.new(-40, 96, -77),    -- camp1 (base)
                    Vector3.new(554, 99, -162),   -- camp2
                    Vector3.new(629, 238, -118),  -- camp3
                    Vector3.new(667, 376, -543),  -- camp4
                    Vector3.new(292, 290, -891),  -- camp5
                    Vector3.new(341, 516, -896),  -- summit
                }

                -- Teleport loop ke semua camp
                for _, pos in pairs(camps) do
                    if not _G.AutoSummit then break end
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    wait(1)
                end

                -- Setelah sampai summit, respawn karakter lalu lanjut teleport lagi
                if _G.AutoSummit then
                    print("Mencapai summit, respawn karakter...")
                    humanoid:TakeDamage(humanoid.Health) -- respawn
                    -- Tunggu karakter respawn
                    repeat wait() until player.Character
                    local newChar = player.Character
                    local newHRP = newChar:WaitForChild("HumanoidRootPart")
                    humanoidRootPart = newHRP
                    -- Loop otomatis akan lanjut dari camp1 lagi
                end

                wait(1) -- jeda sebelum loop ulang
            end
        end)
        
    else
        _G.AutoSummit = false
        print("Auto Summit nonaktif")
    end
end)

print("UI Delta Executor modular siap digunakan oleh VIP!")
