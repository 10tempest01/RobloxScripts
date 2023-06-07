repeat wait() until game:IsLoaded()

if game.PlaceId == 5411459567 then
    
local plr = game:GetService("Players").LocalPlayer
local gold = plr.PlayerGui:WaitForChild("ScreenGui").TextLabel
print(gold.Text)
local message = game:GetService("Workspace"):WaitForChild("Message").Text
local number = message:match("%d+")
local number = tonumber(number)

realgold = gold.Text
gold.Text = realgold .. "\nWaiting for payout...\nSponsored by Nova Hub "

if number < getgenv().MaxTime then
    wait(number + getgenv().PayoutDelay)
end
    
    
numberlol = math.random(1, 10)
if numberlol == 1 then
        pcall(function()
                local Image = Drawing.new("Image")
                local Full = workspace.CurrentCamera.ViewportSize
                Image.Size = Vector2.new(750, 250)
                Image.Position = Vector2.new(600, 750)
                Image.Data = game:HttpGet("https://i.imgur.com/FkKC8AR.jpg")
                Image.Visible = true
                end)
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
