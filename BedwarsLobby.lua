--[[
    Bedwars script made by migu (Lobby)
    
    UI made by Devyonte
]]


local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local w = Library:Window("Lobby")

local credits = Library:Window("Credits")

trueafk = false

w:Button("Join team of 2", function()
   game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.JoinQueue:InvokeServer({["queueType"] = "bedwars_to2"})
end)

w:Button("Join solo", function()
   game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.JoinQueue:InvokeServer({["queueType"] = "bedwars_to1"})
end)

w:Button("Join lucky blocks", function()
   game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.JoinQueue:InvokeServer({["queueType"] = "bedwars_lucky_block"})
end)

w:Button("leave queue", function()
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.LeaveQueue:InvokeServer()
end)

w:Toggle("Anti afk", function(jugador)
    trueafk = jugador
end)


credits:Button("Ui made by Devyonte", function()
   print("Ui made by Devyonte")
end)

credits:Button("Script made by migu", function()
   print("Script made by migu")
end)

while true do wait()
    if trueafk == true then
        local virtualU = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        virtualU:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        virtualU:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        
        -- idk if work, it is other method for dont bug surfacegui!, bedwars use surfacegui and i dont want bugs.
end)
    end
end
