print("Executor "..identifyexecutor())
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
getgenv().Config = {
    Save_Member = true
}
_G.Check_Save_Setting = "CheckSaveSetting"
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not _G.Dis then
        if not isfolder('Dynamic Hub') then
            makefolder('Dynamic Hub')
        end
        if not isfolder('Dynamic Hub/The Strongest Battlegrounds') then
            makefolder('Dynamic Hub/The Strongest Battlegrounds')
        end
        if not isfile('Dynamic Hub/The Strongest Battlegrounds/'..Name..'.json') then
            writefile('Dynamic Hub/The Strongest Battlegrounds/'..Name..'.json', JsonEncode(getgenv().Config))
        end
    end
end
getgenv()['Get_Setting'] = function(Name)
    if not _G.Dis then
        if isfolder('Dynamic Hub') and isfile('Dynamic Hub/The Strongest Battlegrounds/'..Name..'.json') then
            getgenv().Config = JsonDecode(readfile('Dynamic Hub/The Strongest Battlegrounds/'..Name..'.json'))
            return getgenv().Config
        else
            getgenv()['Check_Setting'](Name)
        end
    end
end
getgenv()['Update_Setting'] = function(Name)
    if not _G.Dis then
        if isfolder('Dynamic Hub') and isfile('Dynamic Hub/The Strongest Battlegrounds/'..Name..'.json') then
            writefile('Dynamic Hub/The Strongest Battlegrounds/'..Name..'.json', JsonEncode(getgenv().Config))
        else
            getgenv()['Check_Setting'](Name)
        end
    end
end
getgenv()['Check_Setting'](_G.Check_Save_Setting)
getgenv()['Get_Setting'](_G.Check_Save_Setting)
if getgenv().Config.Save_Member then
    getgenv()['MyName'] = game.Players.LocalPlayer.Name
elseif getgenv().Config.Save_All_Member then
    getgenv()['MyName'] = "AllMember"
else
    getgenv()['MyName'] = "None"
    _G.Dis = true
end
getgenv()['Check_Setting'](getgenv()['MyName'])
getgenv()['Get_Setting'](getgenv()['MyName'])
getgenv().Config.Key = _G.wl_key
getgenv()['Update_Setting'](getgenv()['MyName'])
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/InterfaceManager.lua"))()
--// Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(180)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
function TP(Pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Shadow = Instance.new("ImageLabel")
local ClickSound = Instance.new("Sound")
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageButton.BackgroundTransparency = 0.8
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.49, 0, 0.010, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 45)
ImageButton.Draggable = false
ImageButton.Image = "http://www.roblox.com/asset/?id="..(_G.Logo)
ImageButton.ImageTransparency = 0.4
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton
UIStroke.Parent = ImageButton
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 1
ClickSound.Parent = ImageButton
ClickSound.SoundId = "rbxassetid://130785805"
ClickSound.Volume = 1
local function playClickAnimation()
    local originalSize = ImageButton.Size
    local TweenSizeUp = TweenService:Create(ImageButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 50, 0, 45)})
    local TweenSizeDown = TweenService:Create(ImageButton, TweenInfo.new(0.1), {Size = originalSize})
    TweenSizeUp:Play()
    TweenSizeUp.Completed:Connect(function()
        TweenSizeDown:Play()
    end)
end
ImageButton.MouseButton1Down:Connect(function()
    ClickSound:Play()    
    playClickAnimation()    
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "RightControl", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "RightControl", false, game)
end)
local Window = Fluent:CreateWindow({
    Title = "The Strongest Battlegrounds [Beta] - Dynamic Hub",
    SubTitle = "By x2Livex",
    TabWidth = 110,
    Size = UDim2.fromOffset(620, 420),
    --[[
    Acrylic = true,
    --]]
    Theme = "Lua Theme",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    Legit = Window:AddTab({ Title = "Legit", Icon = "" }),
	Rage = Window:AddTab({ Title = "Rage", Icon = "" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local hrp = Players.LocalPlayer.Character.HumanoidRootPart
Tabs.Legit:AddSection("Attack")
Tabs.Legit:AddToggle("Auto Attack", {
    Title = "Auto Attack", 
    Description = "",
    Default = getgenv().Config["Auto Attack"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Attack"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Attack"] then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= Players.LocalPlayer.Name then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Radius Attack"] then
                            local args = {
                                {
                                    Goal = "LeftClick"
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        else
                        local args = {
                            {
                                Goal = "LeftClickRelease"
                            }
                        }
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        end
                    end
                end
            end)
        else
            local args = {
                {
                    Goal = "LeftClickRelease"
                }
            }
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
        end
    end
end)
Tabs.Legit:AddSlider("Radius",
    {
        Title = "Radius",
        Description = "",
        Default = getgenv().Config["Radius"] or 15,
        Min = 5,
        Max = 30,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Radius Attack"] = Value
            getgenv()['Update_Setting'](getgenv()['MyName'])
        end
    })
local PlayerList = {}
for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= Players.LocalPlayer.Name then
        table.insert(PlayerList,v.Name)
    end
end
local ModeList = {
    "Radius",
    "Nearest",
    "Aimbot"
}
Tabs.Legit:AddSection("Dash")
PlayerDrop = Tabs.Legit:AddDropdown("Select Players", {
    Title = "Select Players",
    Description = "",
    Values = PlayerList,
    Multi = false,
    Default = getgenv().Config["Select Players"] or nil,
})
PlayerDrop:OnChanged(function(Value)
    getgenv().Config["Select Players"] = Value
    getgenv()['Update_Setting'](getgenv()['MyName'])
end)
Tabs.Legit:AddButton({
    Title = "Refresh Players",
    Description = "",
    Callback = function()
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= Players.LocalPlayer.Name then
                table.insert(PlayerList,v.Name)
            end
        end
    end
})
ModeDrop = Tabs.Legit:AddDropdown("Select Mode", {
    Title = "Select Mode",
    Description = "",
    Values = ModeList,
    Multi = false,
    Default = getgenv().Config["Select Mode"] or nil,
})
ModeDrop:OnChanged(function(Value)
    getgenv().Config["Select Mode"] = Value
    getgenv()['Update_Setting'](getgenv()['MyName'])
end)
Tabs.Legit:AddToggle("Auto Dash", {
    Title = "Auto Dash", 
    Description = "",
    Default = getgenv().Config["Auto Dash"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Dash"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Dash"] and getgenv().Config["Select Mode"] == "Radius" then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Weakest Dummy" then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Radius"] then
                            local args = {
                                {
                                    Dash = Enum.KeyCode.W,
                                    Key = Enum.KeyCode.Q,
                                    Goal = "KeyPress"
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                            local args = {
                                {
                                    Goal = "KeyRelease",
                                    Key = Enum.KeyCode.Q
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        else
                            local args = {
                                {
                                    Goal = "KeyRelease",
                                    Key = Enum.KeyCode.Q
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Dash"] and getgenv().Config["Select Mode"] == "Nearest" then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Weakest Dummy" then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= 999999999 then
                            local args = {
                                {
                                    Dash = Enum.KeyCode.W,
                                    Key = Enum.KeyCode.Q,
                                    Goal = "KeyPress"
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                            local args = {
                                {
                                    Goal = "KeyRelease",
                                    Key = Enum.KeyCode.Q
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        else
                            local args = {
                                {
                                    Goal = "KeyRelease",
                                    Key = Enum.KeyCode.Q
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Dash"] and getgenv().Config["Select Mode"] == "Aimbot" then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Weakest Dummy" and v.Name == getgenv().Config["Select Players"] then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Radius"] then
                            hrp.CFrame = CFrame.lookAt(hrp.Position, checkh.Position)
                            local args = {
                                {
                                    Dash = Enum.KeyCode.W,
                                    Key = Enum.KeyCode.Q,
                                    Goal = "KeyPress"
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                            local args = {
                                {
                                    Goal = "KeyRelease",
                                    Key = Enum.KeyCode.Q
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        else
                            local args = {
                                {
                                    Goal = "KeyRelease",
                                    Key = Enum.KeyCode.Q
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
end)
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if getgenv().Config["Select Mode"] == "Aimbot" and input.KeyCode == Enum.KeyCode.Q then
        pcall(function()
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            
            for _, v in pairs(workspace.Live:GetChildren()) do
                local checkh = v:FindFirstChild("HumanoidRootPart")
                if v.Name ~= LocalPlayer.Name and v.Name ~= "Weakest Dummy" and v.Name == getgenv().Config["Select Players"] then
                    if checkh and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Radius"] then
                        repeat
                            task.wait()
                            local currentCheckm = character:FindFirstChild("Freeze")
                            hrp.CFrame = CFrame.lookAt(hrp.Position, checkh.Position)
                        until getgenv().Config["Select Mode"] ~= "Aimbot" or not character:FindFirstChild("Freeze")
                    end
                end
            end
        end)
    end
end)

Tabs.Legit:AddToggle("Enabled Lock", {
    Title = "Enabled Lock", 
    Description = "",
    Default = getgenv().Config["Enabled Lock"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Lock"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Dash"] and getgenv().Config["Enabled Lock"] and getgenv().Config["Select Mode"] == "Radius" then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Weakest Dummy" then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Radius"] then
                        hrp.CFrame = CFrame.lookAt(hrp.Position, checkh.Position)
                        else
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Dash"] and getgenv().Config["Enabled Lock"] and getgenv().Config["Select Mode"] == "Nearest" then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Weakest Dummy" then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= 999999999 then
                        hrp.CFrame = CFrame.lookAt(hrp.Position, checkh.Position)
                        else
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Legit:AddSlider("Radius",
    {
        Title = "Radius",
        Description = "",
        Default = getgenv().Config["Radius"] or 15,
        Min = 5,
        Max = 30,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Radius"] = Value
            getgenv()['Update_Setting'](getgenv()['MyName'])
        end
    })
Tabs.Legit:AddSection("Dash Aimbot")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local hrp = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local aimbotCircle
local dashCircle
Tabs.Legit:AddToggle("Enabled Aimbot", {
    Title = "Enabled Aimbot", 
    Description = "",
    Default = getgenv().Config["Enabled Aimbot"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Aimbot"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])

        if Value then
            if not aimbotCircle then
                aimbotCircle = Drawing.new("Circle")
                aimbotCircle.Color = Color3.fromRGB(255, 255, 255)
                aimbotCircle.Thickness = 2
                aimbotCircle.NumSides = 100
                aimbotCircle.Filled = false
                aimbotCircle.Transparency = 1
                aimbotCircle.Visible = true
            end

            RunService:BindToRenderStep("UpdateAimbotCircle", 1, function()
                if aimbotCircle and getgenv().Config["Enabled Aimbot"] then
                    aimbotCircle.Position = UserInputService:GetMouseLocation()
                    aimbotCircle.Radius = getgenv().Config["Fov"]
                    aimbotCircle.Visible = true
                end
            end)
        else
            if aimbotCircle then
                aimbotCircle.Visible = false
            end
            RunService:UnbindFromRenderStep("UpdateAimbotCircle")
        end
    end
})
Tabs.Legit:AddSlider("Fov", {
    Title = "Fov",
    Description = "",
    Default = getgenv().Config["Fov"] or 100,
    Min = 50,
    Max = 250,
    Rounding = 0,
    Callback = function(Value)
        getgenv().Config["Fov"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
        if aimbotCircle then
            aimbotCircle.Radius = Value
        end
    end
})
function getTargetNearMouse(maxDistance)
    local closest = nil
    local shortestScreenDistance = maxDistance
    for _, v in pairs(workspace.Live:GetChildren()) do
        if v.Name ~= LocalPlayer.Name and v.Name ~= "Weakest Dummy" then
            local root = v:FindFirstChild("HumanoidRootPart")
            if root then
                local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local distance = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if distance <= shortestScreenDistance then
                        closest = root
                        shortestScreenDistance = distance
                    end
                end
            end
        end
    end
    return closest
end
RunService.RenderStepped:Connect(function()
    if getgenv().Config["Enabled Aimbot"] then
    end
end)
local lastDash = 0
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Q and getgenv().Config["Enabled Aimbot"] then
        if tick() - lastDash >= 2.5 then
            lastDash = tick()
            local target = getTargetNearMouse(getgenv().Config["Fov"])
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            if target and hrp then
                local direction = (target.Position - hrp.Position).Unit
                repeat
                    task.wait()
                    local currentCheckm = character:FindFirstChild("Freeze")
                    hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + direction)
                until not getgenv().Config["Enabled Aimbot"] or not character:FindFirstChild("Freeze")
            end
        end
    end
end)
UserInputService.InputBegan:Connect(function(gameProcessed)
    if gameProcessed then return end
    if getgenv().Config["Auto Dash"] and getgenv().Config["Enabled Aimbot"] then
        if tick() - lastDash >= 2.5 then
            lastDash = tick()
            local target = getTargetNearMouse(getgenv().Config["Fov"])
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            if target and hrp then
                local direction = (target.Position - hrp.Position).Unit
                repeat
                    task.wait()
                    local currentCheckm = character:FindFirstChild("Freeze")
                    hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + direction)
                until not getgenv().Config["Enabled Aimbot"] or not character:FindFirstChild("Freeze")
            end
        end
    end
end)
Tabs.Legit:AddSection("Parry")
Tabs.Legit:AddToggle("Enabled Parry", {
    Title = "Enabled Parry", 
    Description = "",
    Default = getgenv().Config["Enabled Parry"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Parry"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Enabled Parry"] then
            pcall(function()
            for i,v in pairs(workspace.Live:GetChildren()) do
                local checkh = v:FindFirstChild "HumanoidRootPart"
                local checkm = v:FindFirstChild "Freeze" or v:FindFirstChild "M1ing" or v:FindFirstChild "NoBlock"
                if v.Name ~= Players.LocalPlayer.Name then
                    if checkh and checkm and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Radius Parry"] then
                        repeat
                            local checkm2 = v:FindFirstChild("Freeze") or v:FindFirstChild("M1ing") or v:FindFirstChild("NoBlock")
                            local args = {
                                {
                                    Goal = "KeyPress",
                                    Key = Enum.KeyCode.F
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                            wait()
                        until not getgenv().Config["Enabled Parry"] or (checkh.Position - hrp.Position).Magnitude > 30 or not checkm2
                    else
                        local args = {
                            {
                                Goal = "KeyRelease",
                                Key = Enum.KeyCode.F
                            }
                        }
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Legit:AddSlider("Radius",
    {
        Title = "Radius",
        Description = "",
        Default = getgenv().Config["Radius"] or 15,
        Min = 5,
        Max = 30,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Radius Parry"] = Value
            getgenv()['Update_Setting'](getgenv()['MyName'])
        end
    })
Tabs.Legit:AddToggle("Enabled Lock", {
    Title = "Enabled Lock", 
    Description = "",
    Default = getgenv().Config["Enabled Lock"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Lock"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Enabled Lock"] and getgenv().Config["Enabled Parry"] then
            pcall(function()
            for i,v in pairs(workspace.Live:GetChildren()) do
                local checkh = v:FindFirstChild "HumanoidRootPart"
                local checkm = v:FindFirstChild "Freeze" or v:FindFirstChild "M1ing" or v:FindFirstChild "NoBlock"
                if v.Name ~= game.Players.LocalPlayer.Name then
                    if checkh and checkm and (checkh.Position - hrp.Position).Magnitude <= 25 then
                        hrp.CFrame = CFrame.lookAt(hrp.Position, checkh.Position)
                    else
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Rage:AddSection("Kill Players")
Tabs.Rage:AddToggle("Auto Kill Players", {
    Title = "Auto Kill Players", 
    Description = "",
    Default = getgenv().Config["Auto Kill Players"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Kill Players"] = Value
        getgenv()['Update_Setting'](getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Kill Players"] then
            pcall(function()
                for i,v in pairs(workspace.Live:GetChildren()) do
                    local checkh = v:FindFirstChild "HumanoidRootPart"
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Weakest Dummy" then
                        if checkh and (checkh.Position - hrp.Position).Magnitude <= getgenv().Config["Distance"] then
                            repeat
                                task.wait()
                                TP(checkh.CFrame * CFrame.new(0,0,4))
                                local args = {
                                    {
                                        Goal = "LeftClick"
                                    }
                                }
                                game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                            until not getgenv().Config["Auto Kill Players"] or v.Humanoid.Health <= 0
                        else
                        local args = {
                            {
                                Goal = "LeftClickRelease"
                            }
                        }
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
                        end
                    end
                end
            end)
        else
            local args = {
                {
                    Goal = "LeftClickRelease"
                }
            }
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Communicate"):FireServer(unpack(args))
        end
    end
end)
Tabs.Rage:AddSlider("Distance",
    {
        Title = "Distance",
        Description = "",
        Default = getgenv().Config["Distance"] or 150,
        Min = 50,
        Max = 300,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Distance"] = Value
            getgenv()['Update_Setting'](getgenv()['MyName'])
        end
    })
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
SaveManager:LoadAutoloadConfig()
