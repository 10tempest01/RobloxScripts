repeat wait() until game:IsLoaded()

scriptver = "release_2.2"

if game.PlaceId == 5411459567 then
--game:GetService("RunService"):Set3dRenderingEnabled(false)

local plr = game:GetService("Players").LocalPlayer
local gold = plr.PlayerGui:WaitForChild("ScreenGui").TextLabel
local level = plr.PlayerGui:WaitForChild("ScreenGui").TextLabel2
gold.Font = Enum.Font.TitilliumWeb
level.Font = Enum.Font.TitilliumWeb
local message = game:GetService("Workspace"):WaitForChild("Message").Text
local number = message:match("%d+")
local number = tonumber(number)

realgold = gold.Text
gold.Text = realgold .. " (" .. plr.Name .. ")\nWaiting for payout...\n🌌 Sponsored by Nova Hub 🌌\nScript Version: " .. scriptver

game.Lighting["Sunny Sky"]:Remove()
local cc = Instance.new("ColorCorrectionEffect", game.Lighting)
spawn(function()
    while wait(0.25) do
        cc.TintColor = Color3.fromRGB(math.random(100,255), math.random(100,255), math.random(100,255))
    end
end)

if number < getgenv().MaxTime then
    wait(number + getgenv().PayoutDelay)
end
    
msg = "YOU AINT GETTIN NO GOLD 😭😭😭"
    
spawn(function()
    while wait() do
        gold.Text = realgold .. "\nServerhopping.\n" .. msg
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping..\n" .. msg
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping...\n" .. msg
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping..\n" .. msg
        wait(0.5)
    end
end)

local randomized = math.random(1, 5)

if randomized == 1 then
    pcall(function() delfile("NotSameServers.json") end)
end

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DankBladeZS/RobloxScripts/main/GlobalScripts/Serverhop.lua"))()


end
