local plr = game.Players.LocalPlayer
local savedpos = plr.Character.HumanoidRootPart.CFrame

if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    joint = plr.Character.LowerTorso.Root
elseif plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    joint = plr.Character.HumanoidRootPart.RootJoint
end 
if useplatform then
local part = Instance.new("Part", workspace)
part.Anchored = true
part.CanCollide = true
part.Size = Vector3.new(100, 5, 100)
part.CFrame = invispos - Vector3.new
end
wait(0.1)
plr.Character.HumanoidRootPart.CFrame = invispos - CFrame.new(0, 5, 0)
wait(0.5)
joint.Parent = game.ReplicatedStorage
plr.Character.HumanoidRootPart.CanCollide = true
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = savedpos
