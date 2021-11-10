local PreciosEggs = require(game:GetService("ReplicatedStorage").GameInfo.EggsCost)

local selectedcurrency = "Money"
local TipoDinero = game:GetService("Players").LocalPlayer.PlayerData.Currency[selectedcurrency].Value
local PetsEquipadas = game:GetService("Players").LocalPlayer.PlayerData.EquippedPets:GetChildren()
local PetsFarmeando = 0

function tp(PosCFrame)
    local TweenService = game:GetService("TweenService")
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1), {CFrame = PosCFrame})
    tween:Play()
end

-- Currency table
TiposDeDinero = {}

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerData.Currency:GetChildren()) do
    table.insert(TiposDeDinero,v.Name)
end
-- Pets table

Eggs = {}
for i,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if string.find(v.Name,"Egg") then
        table.insert(Eggs,v.Name)
    end
end
local selectedegg = "Nothing"

local candymade = 0 
local startcandy = game:GetService("Players").LocalPlayer.PlayerData.Currency.Candy.Value
local farmingcandy = true
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))()
local venyx = library.new("StarScriptsX - Pet legends - Multi pet in beta", 5012544693)

local home = venyx:addPage("Home", 5012544693)

local info = home:addSection("Info")

local candymadebutton = info:addButton("Candy made: 0", function()
	setclipboard(candymade)
end)

info:addButton("Copy discord invite", function()
	setclipboard("https://discord.gg/vPnHqCCkZN")
end)

local AutoFarm = home:addSection("AutoFarm")

AutoFarm:addToggle("Farm candy", true, function(value)
    farmingcandy = value
end)


local Miscsec = venyx:addPage("Misc", 5012544693)
local EggsSec = Miscsec:addSection("Eggs")

EggsSec:addDropdown("Select currency", TiposDeDinero, function(Tipo)
    selectedcurrency = Tipo
end)

EggsSec:addDropdown("Select egg", Eggs, function(Huevo)
    print("Selected", Huevo)
    selectedegg = Huevo
end)

local AutoEgg = false
local AutoBestPet = true
EggsSec:addToggle("Auto open egg", false, function(value)
    AutoEgg = value
end)
EggsSec:addToggle("Auto best pet (To do)", true, function(value)
    AutoBestPet = value
end)

-- settings page
local settingssec = venyx:addPage("Settings", 5012544693)
local colors = settingssec:addSection("Colors")
local others = settingssec:addSection("Others")

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

for theme, color in pairs(themes) do -- Dont made by me, made by venyx
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end

others:addButton("Destroy script", function()
	farmingcandy = false
	AutoEgg = false
	game:GetService("CoreGui"):FindFirstChild("StarScriptsX - Pet legends - Multi pet in beta"):Destroy()
	script:Destroy()
end)
venyx:SelectPage(venyx.pages[1], true)
print("Loaded")
local backposition = nil
while true do wait()
    TipoDinero = game:GetService("Players").LocalPlayer.PlayerData.Currency[selectedcurrency].Value
    PetsEquipadas = game:GetService("Players").LocalPlayer.PlayerData.EquippedPets:GetChildren()
    if farmingcandy then
        if not game:GetService("Workspace").TargetsMarkers.Kreis:FindFirstChild("CandyChest") then
            local PetsFarmeando = 0
            game:GetService("ReplicatedStorage").Events.TouchedTelport:FireServer("Halloween")
            repeat
                game:GetService("ReplicatedStorage").Events.GiveTarget:InvokeServer(workspace.Chest:WaitForChild("CandyChest"))
                PetsFarmeando = PetsFarmeando + 1
            until PetsFarmeando >= #PetsEquipadas
        end
    end
    candymade = game:GetService("Players").LocalPlayer.PlayerData.Currency.Candy.Value - startcandy
    info:updateButton(candymadebutton, "Candy made: ".. candymade)
    if AutoEgg then
        if TipoDinero >= tonumber(PreciosEggs[selectedegg]) then
	    backposition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            tp(game:GetService("Workspace").Eggs[selectedegg].CFrame)
            game:GetService("ReplicatedStorage").Events.BuyEgg:InvokeServer(selectedegg,1)
	    tp(backposition)
            if AutoBestPet then
                -- To do
            end
        end
    end
end
