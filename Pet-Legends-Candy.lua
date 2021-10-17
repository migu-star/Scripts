local PetsEquipadas = game:GetService("Players").ElQueRompeSS.PlayerData.EquippedPets:GetChildren()
local PetsFarmeando = 0

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


-- Only for add

-- second page
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
	game:GetService("CoreGui"):FindFirstChild("StarScriptsX - Pet legends - Multi pet in beta"):Destroy()
end)
venyx:SelectPage(venyx.pages[1], true)
print("Loaded")

while true do wait()
    if farmingcandy then
        if not game:GetService("Workspace").TargetsMarkers.Kreis:FindFirstChild("CandyChest") then
            local PetsFarmeando = 0
            game:GetService("ReplicatedStorage").Events.TouchedTelport:FireServer("Halloween")
            repeat
                game:GetService("ReplicatedStorage").Events.GiveTarget:InvokeServer(workspace.Chest:WaitForChild("CandyChest"))
                PetsFarmeando = PetsFarmeando + 1
                print(PetsFarmeando)
                print(PetsEquipadas)
            until PetsFarmeando == #PetsEquipadas
        end
    end
    candymade = game:GetService("Players").LocalPlayer.PlayerData.Currency.Candy.Value - startcandy
    info:updateButton(candymadebutton, "Candy made: ".. candymade)
end
