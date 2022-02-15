local model = Instance.new("Model", game.Workspace)
model.Name = id

game:GetObjects("rbxassetid://"..id)[1].Parent = model
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = model:GetModelCFrame() or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
