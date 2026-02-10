-- LocalScript en StarterGui (o donde quieras la GUI)
local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local GUI_NAME = "RangeGUI"

-- ===== TOGGLE / DESTRUIR GUI EXISTENTE =====
local oldGui = PlayerGui:FindFirstChild(GUI_NAME)
if oldGui then
    oldGui:Destroy()
    return -- Salimos para que no se cree otra GUI
end

-- ===== CREAR NUEVA GUI =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = GUI_NAME
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 50)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = screenGui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 100, 0, 50)
label.Position = UDim2.new(0, 0, 0, 0)
label.Text = "Max Range:"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 80, 0, 50)
textBox.Position = UDim2.new(0, 100, 0, 0)
textBox.Text = tostring(_G.MAX_RANGE or 25)
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextScaled = true
textBox.Parent = frame

-- Valor inicial global
_G.MAX_RANGE = _G.MAX_RANGE or 25

-- Cambiar valor al perder foco
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local value = tonumber(textBox.Text)
        if value and value > 0 then
            _G.MAX_RANGE = value
            print("MAX_RANGE actualizado a:", value)
        else
            textBox.Text = tostring(_G.MAX_RANGE)
        end
    end
end)
