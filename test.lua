repeat task.wait() until game:IsLoaded()
if Hub == "W-Azure" then
    local keyazu = "YHGEXghimYSaIOiwqFIpetHBwsdGoQKx"
    if script_key then
        return
    end
    getgenv().Team = "Pirates"
    script_key = keyazu
    delay(DelayTime or 300,function()
        local CG = game:GetService("CoreGui")
        if not CG:FindFirstChild("W-azure") then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        end
    end)
    wait(2)
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/607f2cd3aa6f0808c9226aacb9bbceb0.lua"))()
elseif Hub == "Banana" then
    getgenv().Key = "f6c79d3275bc5dbf"
    getgenv().OldBanana = false
    local c = "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"
    loadstring(game:HttpGet(c))()
elseif Hub == "Luxury" then
    _G.Key = "SGA5F-T3KC4-ZPSFY"
    _G.DiscordId = "1117103662532141056"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NightsTimeZ/RoyryX/main/Loader.lua"))();
elseif Hub == "RoyX" then
    _G.Key = "9QJ1L-7EIK2-C9JDH"
    _G.DiscordId = "1117103662532141056"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Natsuhanaki/Royx_PC/main/loader.lua"))();
end
print(("\n"):rep(20))
