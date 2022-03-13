function redirectdsc()
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
redirectdsc()


Libreria = require(game:GetService('ReplicatedStorage').Framework.Library)
function Crashear()
    spawn(function()
        Libreria.Network.Fire('request world', "Fantasy")
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
    spawn(function()
        Libreria.Network.Fire('request world', "Tech")
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
    spawn(function()
        Libreria.Network.Fire('request world', "Void")
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
    spawn(function()
        Libreria.Network.Fire('request world', "Axolot")
        Libreria.Network.Fire('performed teleport')
        packetsended = packetsended + 1
        print("[Project Meteor] Crashing server | Packets sended: ".. tostring(packetsended))
    end)
end

local packetstosend = getgenv().packets / 4
for i=1,packetstosend do
    spawn(Crashear)
end

local tabla = {
	[1] = 13
}

workspace.__THINGS.__REMOTES["redeem free gift"]:InvokeServer(tabla)
