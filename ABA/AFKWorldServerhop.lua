repeat wait() until game:IsLoaded()

if game.PlaceId == 5411459567 then
--game:GetService("RunService"):Set3dRenderingEnabled(false)

local plr = game:GetService("Players").LocalPlayer
local gold = plr.PlayerGui:WaitForChild("ScreenGui").TextLabel
print(gold.Text)
local message = game:GetService("Workspace"):WaitForChild("Message").Text
local number = message:match("%d+")
local number = tonumber(number)

realgold = gold.Text
gold.Text = realgold .. "\nWaiting for payout...\n🌌 Sponsored by Nova Hub 🌌"

plr.PlayerGui:WaitForChild("ScreenGui").Frame.BackgroundColor3 = Color3.random()

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
