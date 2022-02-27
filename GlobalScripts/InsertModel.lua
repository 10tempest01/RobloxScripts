--[[
--How to use

id = 123456789
loadstring(game:HttpGet("https://raw.githubusercontent.com/DankBladeZS/RobloxScripts/main/GlobalScripts/InsertModel.lua", true))()
]]

local model = Instance.new("Model", game.Workspace)
model.Name = id

game:GetObjects("rbxassetid://"..id)[1].Parent = model
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = model:GetModelCFrame() or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
