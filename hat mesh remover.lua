--[[
    This is a mesh hat remover for Roblox, Its FE, you can use it on many games.

    Made by migu with <3 for a buyer of my script.
]]


-- Options
local hats = { -- Search hat name in dex explorer
    "meshhat_1",
    "meshhat_3",
    "meshhat_3",
}
local uselist = true -- Use the list of hats or remove all meshes

-- script
local hat = nil
local nomeshhat = nil

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    hat = v
    if uselist then
        for i,v in pairs(hats) do
            if hat.Name == v then
                print("found hat: ".. hat.Name)
                nomeshhat = hat
                for i,v in pairs(nomeshhat:GetDescendants()) do
                    if v:IsA("SpecialMesh") then
                        print("found mesh of hat: ".. hat.Name.. ", destroying mesh...")
                        v:Destroy()
                    end
                end
            end
        end
    else
        if hat:IsA("Accessory") then
            print("found hat: ".. hat.Name)
            nomeshhat = hat
            for i,v in pairs(nomeshhat:GetDescendants()) do
                if v:IsA("SpecialMesh") then
                    print("found mesh of hat: ".. hat.Name.. ", destroying mesh...")
                    v:Destroy()
                end
            end
        end
    end
end
