--Credits to frel0/xamel on WeAreDevs for original script (i just made it more customizable)--
--[[
--How to use

local Message = loadstring(game:HttpGet("https://raw.githubusercontent.com/DankBladeZS/RobloxScripts/main/GlobalScripts/FakeKickLibraryEdited.lua", true))()

Message:Kick(
    "You were kicked from this experience: Your account has been banned from the game.", --Text
    "Leave", --Button Text
    267 --Error Code
)

Message:Crash(
    "Roblox Crash", --Title
    "An unexpected error occured and Roblox needs to quit. We're sorry!", --Body
    false --Actually crash or not
)
]]
local Message = {}

function Message:Kick(msg, buttontxt, errcode)
local FakeKick = Instance.new("ScreenGui")
if syn.protect_gui then syn.protect_gui(FakeKick) end
local promptOverlay = Instance.new("Frame")
local ErrorPrompt = Instance.new("Frame")
local PromptLayout = Instance.new("UIListLayout")
local PromptScale = Instance.new("UIScale")
local TitleFrame = Instance.new("Frame")
local TitleFramePadding = Instance.new("UIPadding")
local ErrorTitle = Instance.new("TextLabel")
local SplitLine = Instance.new("Frame")
local MessageArea = Instance.new("Frame")
local MessageAreaPadding = Instance.new("UIPadding")
local ErrorFrame = Instance.new("Frame")
local ErrorMessage = Instance.new("TextLabel")
local ButtonArea = Instance.new("Frame")
local LeaveButton = Instance.new("ImageButton")
local ButtonText = Instance.new("TextLabel")

FakeKick.Name = "FakeKick"
FakeKick.Parent = game.CoreGui
FakeKick.DisplayOrder = 2147483647

promptOverlay.Name = "promptOverlay"
promptOverlay.Parent = FakeKick
promptOverlay.Active = true
promptOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
promptOverlay.BackgroundTransparency = 1.000
promptOverlay.Position = UDim2.new(0, 0, 0, -36)
promptOverlay.Size = UDim2.new(1, 0, 1, 36)
promptOverlay.ZIndex = 999

ErrorPrompt.Name = "ErrorPrompt"
ErrorPrompt.Parent = promptOverlay
ErrorPrompt.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorPrompt.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
ErrorPrompt.BorderSizePixel = 0
ErrorPrompt.Position = UDim2.new(0.5, 0, 0.510734439, 0)
ErrorPrompt.Size = UDim2.new(0, 400, 0, 207)
ErrorPrompt.ZIndex = 8

PromptLayout.Name = "PromptLayout"
PromptLayout.Parent = ErrorPrompt
PromptLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PromptLayout.SortOrder = Enum.SortOrder.LayoutOrder

PromptScale.Name = "PromptScale"
PromptScale.Parent = ErrorPrompt

TitleFrame.Name = "TitleFrame"
TitleFrame.Parent = ErrorPrompt
TitleFrame.BackgroundTransparency = 1.000
TitleFrame.BorderSizePixel = 0
TitleFrame.LayoutOrder = 1
TitleFrame.Size = UDim2.new(1, 0, 0, 50)
TitleFrame.ZIndex = 8

TitleFramePadding.Name = "TitleFramePadding"
TitleFramePadding.Parent = TitleFrame
TitleFramePadding.PaddingBottom = UDim.new(0, 11)
TitleFramePadding.PaddingTop = UDim.new(0, 11)

ErrorTitle.Name = "ErrorTitle"
ErrorTitle.Parent = TitleFrame
ErrorTitle.BackgroundTransparency = 1.000
ErrorTitle.Size = UDim2.new(1, 0, 0, 28)
ErrorTitle.ZIndex = 8
ErrorTitle.Font = Enum.Font.SourceSansSemibold
ErrorTitle.Text = "Disconnected"
ErrorTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ErrorTitle.TextSize = 25.000

SplitLine.Name = "SplitLine"
SplitLine.Parent = ErrorPrompt
SplitLine.BackgroundColor3 = Color3.fromRGB(189, 190, 190)
SplitLine.BorderSizePixel = 0
SplitLine.LayoutOrder = 2
SplitLine.Size = UDim2.new(1, -40, 0, 1)
SplitLine.ZIndex = 8

MessageArea.Name = "MessageArea"
MessageArea.Parent = ErrorPrompt
MessageArea.BackgroundTransparency = 1.000
MessageArea.BorderSizePixel = 0
MessageArea.LayoutOrder = 3
MessageArea.Position = UDim2.new(0, 0, 0.258883238, 0)
MessageArea.Size = UDim2.new(1, 0, 1, -51)
MessageArea.ZIndex = 8

MessageAreaPadding.Name = "MessageAreaPadding"
MessageAreaPadding.Parent = MessageArea
MessageAreaPadding.PaddingBottom = UDim.new(0, 20)
MessageAreaPadding.PaddingLeft = UDim.new(0, 20)
MessageAreaPadding.PaddingRight = UDim.new(0, 20)
MessageAreaPadding.PaddingTop = UDim.new(0, 20)

ErrorFrame.Name = "ErrorFrame"
ErrorFrame.Parent = MessageArea
ErrorFrame.BackgroundTransparency = 1.000
ErrorFrame.Size = UDim2.new(1, 0, 1, 0)
ErrorFrame.ZIndex = 8

ErrorMessage.Name = "ErrorMessage"
ErrorMessage.Parent = ErrorFrame
ErrorMessage.BackgroundTransparency = 1.000
ErrorMessage.LayoutOrder = 1
ErrorMessage.Position = UDim2.new(0, 0, -0.0660377368, 0)
ErrorMessage.Size = UDim2.new(1, 0, 1, -37)
ErrorMessage.ZIndex = 8
ErrorMessage.Font = Enum.Font.SourceSans
ErrorMessage.Text = msg.. "\n(Error Code: "..errcode..")"
ErrorMessage.TextColor3 = Color3.fromRGB(189, 190, 190)
ErrorMessage.TextSize = 20.000
ErrorMessage.TextWrapped = true

ButtonArea.Name = "ButtonArea"
ButtonArea.Parent = ErrorFrame
ButtonArea.BackgroundTransparency = 1.000
ButtonArea.LayoutOrder = 2
ButtonArea.Size = UDim2.new(1, 0, 0, 36)
ButtonArea.ZIndex = 8

LeaveButton.Name = "LeaveButton"
LeaveButton.Parent = ButtonArea
LeaveButton.AnchorPoint = Vector2.new(0.5, 0.5)
LeaveButton.BackgroundTransparency = 1.000
LeaveButton.LayoutOrder = 1
LeaveButton.Position = UDim2.new(0.5, 0, 2.63888884, 0)
LeaveButton.Size = UDim2.new(1, 0, 1, 0)
LeaveButton.ZIndex = 8
LeaveButton.Image = "rbxasset://textures/ui/ErrorPrompt/PrimaryButton.png"
LeaveButton.ScaleType = Enum.ScaleType.Slice
LeaveButton.SliceCenter = Rect.new(8, 8, 9, 9)

ButtonText.Name = "ButtonText"
ButtonText.Parent = LeaveButton
ButtonText.BackgroundTransparency = 1.000
ButtonText.Size = UDim2.new(1, 0, 1, 0)
ButtonText.ZIndex = 8
ButtonText.Font = Enum.Font.SourceSans
ButtonText.Text = buttontxt
ButtonText.TextColor3 = Color3.fromRGB(35, 37, 39)
ButtonText.TextSize = 20.000

local function IMIU_fake_script()
	local script = Instance.new('LocalScript', LeaveButton)
	wait()
	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Enabled = false
		game:GetService("Lighting").nigeria:Destroy()
	end)
end
coroutine.wrap(IMIU_fake_script)()
local function HDQHLMQ_fake_script()
	local script = Instance.new('LocalScript', FakeKick)
	wait()
	local blur = Instance.new("BlurEffect",game.Lighting)
	blur.Enabled = true
	blur.Size = 24
	blur.Name = "nigeria"
end
coroutine.wrap(HDQHLMQ_fake_script)()
    return Message
end

function Message:Crash(title, msg, crash)
    if crash then
        getgenv().msgbox = messagebox(msg, title, 0)
		if getgenv().msgbox == 1 then
			game:shutdown()
		end

    end
    
    if not crash then
		msgbox = messagebox(msg, title, 0)
	end
    return Message
end

return Message
