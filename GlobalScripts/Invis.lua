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
part.CFrame = CFrame.new(10000, 10000-10, 10000)
end
wait(0.1)
plr.Character.HumanoidRootPart.CFrame = invispos
plr.Character.HumanoidRootPart.CanCollide = true
wait(0.5)
joint.Parent = game.ReplicatedStorage
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = savedpos
