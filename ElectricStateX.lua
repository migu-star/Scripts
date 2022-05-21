    setclipboard("discord.gg/RTDtEY9drb")
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
                   code = "RTDtEY9drb"
               },
               nonce = game:GetService("HttpService"):GenerateGUID(false)
           }),
        })
        
    elseif request then
        request({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST', -- <optional> | GET/POST/HEAD, etc.
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

game.Players.LocalPlayer:kick([[
  Project Meteor / StarScriptsX
  The new discord invite has been copied to clipboard.
  
  Join it for get new script.]])
