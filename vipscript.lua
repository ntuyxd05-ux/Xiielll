-- ===== Dynamic VIP system via Pastebin =====
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer

local VIPUrl = "https://pastebin.com/raw/U4FNu3Vi"
local data
local success, err = pcall(function()
    for i = 1, 3 do
        data = game:HttpGet(VIPUrl)
        if data then break end
        task.wait(0.5)
    end
end)

if not success or not data then
    warn("Gagal mengambil daftar VIP dari Pastebin!")
    return
end

local vipList = {}
for name in string.gmatch(data, "[^\r\n]+") do
    name = name:gsub("^%s*(.-)%s*$", "%1")
    if name ~= "" then table.insert(vipList, name) end
end

local isVIP = false
for _, name in pairs(vipList) do
    if player.Name == name then
        isVIP = true
        break
    end
end

if not isVIP then
    warn("❌ Script ini hanya untuk user VIP terdaftar!")
    return
end

-- reset
if _G.AutoFarm then _G.AutoFarm = false end
if _G.Toggles then for _, flag in pairs(_G.Toggles) do _G[flag] = nil end end
if game.CoreGui:FindFirstChild("Rayfield") then game.CoreGui.Rayfield:Destroy() end
if _G.Events then
    for _, connection in pairs(_G.Events) do if connection.Connected then connection:Disconnect() end end
    _G.Events = {}
end

-- load UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "VIP SCRIPT BY XIIELL",
    LoadingTitle = "Memuat Script Vip Xiiell",
    LoadingSubtitle = "oleh Xiiell",
    ConfigurationSaving = {Enabled = true, FolderName = "DeltaUI", FileName = "ConfigDelta"},
    Discord = {Enabled = false}, KeySystem = false,
})

local MainTab = Window:CreateTab("Utama", 4483362458)
MainTab:CreateSection("Fitur Utama")

_G.Toggles = _G.Toggles or {}
local function buatToggle(namaToggle, callback)
    table.insert(_G.Toggles, namaToggle)
    MainTab:CreateToggle({Name = namaToggle, CurrentValue = false, Flag = namaToggle, Callback = callback})
end

-- ===== Fungsi Teleport Aman =====
local function safeTeleport(autoFlag, delay, hrp, pos)
    if not _G[autoFlag] then return false end
    if hrp and pos then hrp.CFrame = CFrame.new(pos) end
    task.wait(delay or 1)
    return _G[autoFlag]
end

-- Default delay
_G.DelayYaudah, _G.DelayBohong, _G.DelayKonoha, _G.DelaySeminung, _G.DelayBeringin, _G.DelayNangEast, _G.DelayRavika, _G.DelayYahayuk = 1,1,1,1,1,1,1,1

-- ======================================
-- ===== Gunung Yaudah =====
MainTab:CreateSlider({Name="Delay Gunung Yaudah",Range={0.5,5},Increment=0.5,Suffix="Detik",
    CurrentValue=_G.DelayYaudah,Flag="DelayYaudah",Callback=function(Value)_G.DelayYaudah=Value end})
buatToggle("Gunung Yaudah", function(Value)
    if Value then
        _G.AutoYaudah=true
        task.spawn(function()
            while _G.AutoYaudah do
                local char=player.Character or player.CharacterAdded:Wait()
                local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                local camps={Vector3.new(-40,96,-77),Vector3.new(554,99,-162),Vector3.new(629,238,-118),
                    Vector3.new(667,376,-543),Vector3.new(292,290,-891),Vector3.new(341,516,-896)}
                for _,pos in ipairs(camps) do if not safeTeleport("AutoYaudah",_G.DelayYaudah,hrp,pos) then break end end
                if _G.AutoYaudah then hum:TakeDamage(hum.Health) player.CharacterAdded:Wait() task.wait(_G.DelayYaudah) end
            end
        end)
    else _G.AutoYaudah=false end
end)

-- ===== Gunung Bohong =====
MainTab:CreateSlider({Name="Delay Gunung Bohong",Range={0.5,5},Increment=0.5,Suffix="Detik",
    CurrentValue=_G.DelayBohong,Flag="DelayBohong",Callback=function(Value)_G.DelayBohong=Value end})
buatToggle("Gunung Bohong", function(Value)
    if Value then
        _G.AutoBohong=true
        task.spawn(function()
            while _G.AutoBohong do
                local char=player.Character or player.CharacterAdded:Wait()
                local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                local camps={Vector3.new(363,122,680),Vector3.new(510,74,1218),Vector3.new(861,106,1627),
                    Vector3.new(813,264,1443),Vector3.new(787,272,1674),Vector3.new(1214,433,1779),
                    Vector3.new(1887,488,1527),Vector3.new(2234,766,1226),Vector3.new(2299,655,781),
                    Vector3.new(2009,680,770),Vector3.new(1946,639,900),Vector3.new(1691,674,990),
                    Vector3.new(1591,692,682),Vector3.new(1021,425,1126),Vector3.new(1167,666,1449),
                    Vector3.new(1508,898,919)}
                for _,pos in ipairs(camps) do if not safeTeleport("AutoBohong",_G.DelayBohong,hrp,pos) then break end end
                if _G.AutoBohong then hum:TakeDamage(hum.Health) player.CharacterAdded:Wait() task.wait(_G.DelayBohong) end
            end
        end)
    else _G.AutoBohong=false end
end)

-- ===== Gunung Konoha =====
MainTab:CreateSlider({Name="Delay Gunung Konoha",Range={0.5,5},Increment=0.5,Suffix="Detik",
    CurrentValue=_G.DelayKonoha,Flag="DelayKonoha",Callback=function(Value)_G.DelayKonoha=Value end})
buatToggle("Gunung Konoha", function(Value)
    if Value then
        _G.AutoKonoha=true
        task.spawn(function()
            while _G.AutoKonoha do
                local char=player.Character or player.CharacterAdded:Wait()
                local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                local camps={Vector3.new(765,288,-535),Vector3.new(775,522,-374),Vector3.new(-73,476,383),
                    Vector3.new(190,584,728),Vector3.new(342,588,818),Vector3.new(831,820,565),
                    Vector3.new(923,1003,600)}
                for _,pos in ipairs(camps) do if not safeTeleport("AutoKonoha",_G.DelayKonoha,hrp,pos) then break end end
                if _G.AutoKonoha then hum:TakeDamage(hum.Health) player.CharacterAdded:Wait() task.wait(_G.DelayKonoha) end
            end
        end)
    else _G.AutoKonoha=false end
end)

-- ===== Gunung Nang East =====
MainTab:CreateSlider({Name="Delay Gunung Nang East",Range={0.5,5},Increment=0.5,Suffix="Detik",
    CurrentValue=_G.DelayNangEast,Flag="DelayNangEast",Callback=function(Value)_G.DelayNangEast=Value end})
buatToggle("Gunung Nang East", function(Value)
    if Value then
        _G.AutoNangEast=true
        task.spawn(function()
            while _G.AutoNangEast do
                local char=player.Character or player.CharacterAdded:Wait()
                local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                local camps={Vector3.new(2462,437,-232),Vector3.new(2284,411,90),Vector3.new(1690,366,18),
                    Vector3.new(1628,279,-253),Vector3.new(2231,271,-284),Vector3.new(1317,246,-361),
                    Vector3.new(1097,190,95),Vector3.new(-321,79,569),Vector3.new(-964,483,-1733),
                    Vector3.new(24,18,-1248),Vector3.new(902,5,-864),Vector3.new(519,72,-912),
                    Vector3.new(-82,182,-935),Vector3.new(254,152,-739),Vector3.new(165,308,-691),
                    Vector3.new(222,282,-613),Vector3.new(657,435,-756),Vector3.new(960,446,-594),
                    Vector3.new(549,478,-414),Vector3.new(117,580,-229),Vector3.new(367,556,12),
                    Vector3.new(712,576,-3),Vector3.new(589,881,-130),Vector3.new(-259,987,134),
                    Vector3.new(-1331,1073,428),Vector3.new(-1942,1397,-5),Vector3.new(-2238,1506,-656),
                    Vector3.new(-1774,1673,-944),Vector3.new(-1191,1798,-1140),Vector3.new(-1285,1979,-117),
                    Vector3.new(-1480,2213,-292),Vector3.new(-1500,2560,-551)}
                for _,pos in ipairs(camps) do if not safeTeleport("AutoNangEast",_G.DelayNangEast,hrp,pos) then break end end
                if _G.AutoNangEast then hum:TakeDamage(hum.Health) player.CharacterAdded:Wait() task.wait(_G.DelayNangEast) end
            end
        end)
    else _G.AutoNangEast=false end
end)

-- ===== Gunung Ravika =====
MainTab:CreateSlider({Name="Delay Gunung Ravika",Range={0.5,5},Increment=0.5,Suffix="Detik",
    CurrentValue=_G.DelayRavika,Flag="DelayRavika",Callback=function(Value)_G.DelayRavika=Value end})
buatToggle("Gunung Ravika", function(Value)
    if Value then
        _G.AutoRavika=true
        task.spawn(function()
            while _G.AutoRavika do
                local char=player.Character or player.CharacterAdded:Wait()
                local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                local camps={Vector3.new(-784,85,-651),Vector3.new(-985,180,-82),Vector3.new(-955,176,810),
                    Vector3.new(797,184,875),Vector3.new(970,96,135),Vector3.new(981,112,-536),
                    Vector3.new(401,120,-229),Vector3.new(3,446,24)}
                for _,pos in ipairs(camps) do if not safeTeleport("AutoRavika",_G.DelayRavika,hrp,pos) then break end end
                if _G.AutoRavika then hum:TakeDamage(hum.Health) player.CharacterAdded:Wait() task.wait(_G.DelayRavika) end
            end
        end)
    else _G.AutoRavika=false end
end)

-- ===== Gunung Yahayuk =====
MainTab:CreateSlider({Name="Delay Gunung Yahayuk",Range={0.5,5},Increment=0.5,Suffix="Detik",
    CurrentValue=_G.DelayYahayuk,Flag="DelayYahayuk",Callback=function(Value)_G.DelayYahayuk=Value end})
buatToggle("Gunung Yahayuk", function(Value)
    if Value then
        _G.AutoYahayuk=true
        task.spawn(function()
            while _G.AutoYahayuk do
                local char=player.Character or player.CharacterAdded:Wait()
                local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                local camps={Vector3.new(-472, 248, 776),Vector3.new(-363, 387, 573),Vector3.new(256, 429, 506),
                    Vector3.new(334, 489, 357),Vector3.new(237, 313, -146),Vector3.new(-618, 904, -547)}
                for _,pos in ipairs(camps) do 
                    -- Pastikan teleport terus terjadi
                    if not safeTeleport("AutoYahayuk",_G.DelayYahayuk,hrp,pos) then 
                        break 
                    end
                    -- Delay setelah teleport untuk memastikan script melanjutkan teleportasi
                    task.wait(_G.DelayYahayuk)
                end
                -- Membunuh karakter untuk respawn dan melanjutkan teleportasi
                if _G.AutoYahayuk then
                    hum:TakeDamage(hum.Health) -- Membunuh karakter untuk respawn
                    player.CharacterAdded:Wait() -- Menunggu karakter respawn
                    task.wait(_G.DelayYahayuk) -- Menunggu delay agar teleportasi dapat terus berlanjut
                end
            end
        end)
    else 
        _G.AutoYahayuk=false -- Matikan AutoYahayuk jika toggle dimatikan
    end
end)


-- ===== Tab Menu Lain =====
local OtherTab = Window:CreateTab("Menu Lain", 4483362458)
OtherTab:CreateSection("Fitur Tambahan")

-- ===== Walking Speed =====
OtherTab:CreateSlider({
    Name = "Walking Speed", 
    Range = {16, 100}, 
    Increment = 1, 
    Suffix = "Studs", 
    CurrentValue = 16, 
    Flag = "WalkSpeed", 
    Callback = function(Value) 
        player.Character.Humanoid.WalkSpeed = Value 
    end
})

-- ===== Boost FPS =====
OtherTab:CreateToggle({
    Name = "Boost FPS", 
    CurrentValue = false, 
    Flag = "BoostFPS", 
    Callback = function(Value) 
        if Value then
            game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("Workspace").CurrentCamera.FieldOfView = 70 -- Example for boosting FPS
            end)
            print("Boost FPS aktif!")
        else
            print("Boost FPS dinonaktifkan!")
        end
    end
})

-- ===== Anti AFK =====
OtherTab:CreateToggle({
    Name = "Anti AFK", 
    CurrentValue = false, 
    Flag = "AntiAFK", 
    Callback = function(Value) 
        if Value then
            _G.AntiAFK = true
            task.spawn(function()
                while _G.AntiAFK do
                    player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1) -- Slight movement to avoid AFK
                    task.wait(5) -- Change position every 5 seconds to prevent AFK detection
                end
            end)
        else
            _G.AntiAFK = false
            print("Anti AFK dinonaktifkan!")
        end
    end
})

-- ===== Fly Button =====
OtherTab:CreateButton({Name="Fly",Callback=function()
    print("Fly aktif, memuat script eksternal...")
    local success, err=pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DevPhoriaa/robloxscript/main/menuscript/main.lua"))() end)
    if not success then warn("Gagal memuat Fly script: "..tostring(err)) end
end})

-- ===== Dynamic Gunung System (VIP only) =====
_G.GunungList = _G.GunungList or {}
local function AddTextInput(tab, opts)
    if typeof(tab.CreateTextbox)=="function" then return tab:CreateTextbox(opts)
    elseif typeof(tab.CreateInput)=="function" then return tab:CreateInput(opts)
    else warn("Rayfield tidak punya CreateTextbox/CreateInput") end
end

local function generateGunungUI(nama, koordinat, defaultDelay)
    _G["Delay"..nama]=defaultDelay or 1
    MainTab:CreateSlider({Name="Delay Gunung "..nama,Range={0.5,5},Increment=0.5,Suffix="Detik",CurrentValue=_G["Delay"..nama],Flag="Delay"..nama,Callback=function(Value)_G["Delay"..nama]=Value end})
    buatToggle("Gunung "..nama,function(Value)
        if Value then
            _G["Auto"..nama]=true
            task.spawn(function()
                while _G["Auto"..nama] do
                    local char=player.Character or player.CharacterAdded:Wait()
                    local hrp,hum=char:WaitForChild("HumanoidRootPart"),char:WaitForChild("Humanoid")
                    for _,pos in ipairs(koordinat) do if not safeTeleport("Auto"..nama,_G["Delay"..nama],hrp,pos) then break end end
                    if _G["Auto"..nama] then hum:TakeDamage(hum.Health) player.CharacterAdded:Wait() task.wait(_G["Delay"..nama]) end
                end
            end)
        else _G["Auto"..nama]=false end
    end)
end

OtherTab:CreateSection("Tambah Gunung Baru")
AddTextInput(OtherTab,{Name="Nama Gunung",PlaceholderText="Contoh: Bohong2",RemoveTextAfterFocusLost=false,Callback=function(Text)_G.NamaGunungBaru=Text end})
AddTextInput(OtherTab,{Name="Koordinasi (pisahkan dengan ; )",PlaceholderText="Contoh: 0,0,0; 10,20,30; 50,60,70",RemoveTextAfterFocusLost=false,Callback=function(Text)_G.KoordinasiBaru=Text end})
OtherTab:CreateButton({Name="Buat Gunung Dinamis",Callback=function()
    local nama=_G.NamaGunungBaru local teks=_G.KoordinasiBaru
    if not nama or nama=="" then warn("Nama kosong!") return end
    if not teks or teks=="" then warn("Koordinasi kosong!") return end
    local coords={} for xyz in string.gmatch(teks,"([^;]+)") do local x,y,z=xyz:match("([%d%-%.]+),%s*([%d%-%.]+),%s*([%d%-%.]+)") if x and y and z then table.insert(coords,Vector3.new(tonumber(x),tonumber(y),tonumber(z))) end end
    if #coords==0 then warn("Format salah!") return end
    _G.GunungList[nama]=coords generateGunungUI(nama,coords,1) print("✅ Gunung dinamis VIP dibuat:",nama) end})

OtherTab:CreateToggle({Name="Full Bright",CurrentValue=false,Flag="FullBright",Callback=function(Value)
    local Lighting=game:GetService("Lighting")
    local function applyFullBright() Lighting.Brightness=2 Lighting.ClockTime=14 Lighting.FogEnd=100000 Lighting.GlobalShadows=false Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128) end
    if Value then _G.FullBright=true applyFullBright()
        if not _G.FullBrightConnection then _G.FullBrightConnection=Lighting.Changed:Connect(function() if _G.FullBright then applyFullBright() end end) end
        if not _G.FullBrightRespawn then _G.FullBrightRespawn=player.CharacterAdded:Connect(function() if _G.FullBright then wait(1) applyFullBright() end end) end
    else _G.FullBright=false Lighting.Brightness=1 Lighting.ClockTime=12 Lighting.FogEnd=1000 Lighting.GlobalShadows=true Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
        if _G.FullBrightConnection then _G.FullBrightConnection:Disconnect() _G.FullBrightConnection=nil end
        if _G.FullBrightRespawn then _G.FullBrightRespawn:Disconnect() _G.FullBrightRespawn=nil end
    end
end})



-- ===== Toggle Koordinat Lokasi =====
local showCoordinates = false -- Default untuk menyembunyikan koordinat

-- Membuat GUI untuk menampilkan koordinat
local coordinateGui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", coordinateGui)
frame.Size = UDim2.new(0, 220, 0, 70)
frame.Position = UDim2.new(0, 20, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, -10, 0, 30)
label.Position = UDim2.new(0, 5, 0, 5)
label.Text = "Koordinat: 0, 0, 0"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextSize = 14

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -10, 0, 25)
button.Position = UDim2.new(0, 5, 0, 40)
button.Text = "Copy Koordinat"
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 14

-- Menambahkan tombol toggle untuk menampilkan atau menyembunyikan koordinat
OtherTab:CreateToggle({
    Name = "Tampilkan Koordinat",
    CurrentValue = false,
    Flag = "ShowCoordinates",
    Callback = function(Value)
        showCoordinates = Value
        -- Menyembunyikan atau menampilkan GUI koordinat
        coordinateGui.Enabled = showCoordinates
    end
})

-- Update koordinat secara real-time
spawn(function()
    while true do
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos = hrp.Position
            if showCoordinates then
                label.Text = string.format("Koordinat: %d, %d, %d", math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
            end
        end
        task.wait(0.2)
    end
end)

-- Menambahkan tombol untuk menyalin koordinat ke clipboard
button.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local pos = char.HumanoidRootPart.Position
        local coord = string.format("Vector3.new(%d, %d, %d)", math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
        if setclipboard then
            setclipboard(coord)
            StarterGui:SetCore("SendNotification", {Title="Coordinate Grabber", Text="✅ Koordinat tersalin!", Duration=3})
        else
            warn("Executor tidak support setclipboard. Koordinat: "..coord)
            StarterGui:SetCore("SendNotification", {Title="Coordinate Grabber", Text="⚠️ Tidak bisa copy otomatis!", Duration=5})
        end
    end
end)

StarterGui:SetCore("SendNotification", {Title="Coordinate Grabber", Text="📍 Aktif! Koordinat realtime di layar.", Duration=5})

print("✅ UI Delta Executor siap digunakan oleh VIP:", player.Name)
