local plr = game.Players.LocalPlayer
local savedpos = plr.Character.HumanoidRootPart.CFrame

if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    joint = plr.Character.LowerTorso.Root
elseif plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    joint = plr.Character.HumanoidRootPart.RootJoint
end 
if getgenv().useplatform then
local part = Instance.new("Part", workspace)
part.Anchored = true
part.CanCollide = true
part.Size = Vector3.new(100, 5, 100)
part.CFrame = invispos - Vector3.new(0, 5, 0)
end
wait(0.1)
plr.Character.HumanoidRootPart.CFrame = getgenv().invispos
wait(0.5)
joint:Destroy()
plr.Character.HumanoidRootPart.CanCollide = true
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = savedpos
