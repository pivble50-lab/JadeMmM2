--[[
    ═══════════════════════════════════════════
    Jade MM2 | KeySystem
    GUI própria (sem Fluent)
    Key: M21
    ═══════════════════════════════════════════
--]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local KEY_CORRETA = "M21"
local LINK_SCRIPT = "https://raw.githubusercontent.com/pivble50-lab/JadeMm2/refs/heads/main/JadeMM2.LUA"
local LINK_KEY = "https://link-hub.net/7795287/rXErMIm3EkkN"

-- ==================== GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JadeKeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 380, 0, 240)
Main.Position = UDim2.new(0.5, -190, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 180, 120)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.BorderSizePixel = 0
Title.Text = "Jade MM2 | Key System"
Title.TextColor3 = Color3.fromRGB(60, 220, 140)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -20, 0, 30)
Subtitle.Position = UDim2.new(0, 10, 0, 55)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Digite a key abaixo para continuar"
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 190)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 13
Subtitle.Parent = Main

local TextBoxFrame = Instance.new("Frame")
TextBoxFrame.Size = UDim2.new(1, -40, 0, 40)
TextBoxFrame.Position = UDim2.new(0, 20, 0, 95)
TextBoxFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TextBoxFrame.BorderSizePixel = 0
TextBoxFrame.Parent = Main

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 8)
TextBoxCorner.Parent = TextBoxFrame

local TextBoxStroke = Instance.new("UIStroke")
TextBoxStroke.Color = Color3.fromRGB(60, 60, 75)
TextBoxStroke.Thickness = 1
TextBoxStroke.Parent = TextBoxFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 1, 0)
TextBox.Position = UDim2.new(0, 10, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Text = ""
TextBox.PlaceholderText = "Digite a key aqui..."
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.ClearTextOnFocus = false
TextBox.Parent = TextBoxFrame

local MainButton = Instance.new("TextButton")
MainButton.Size = UDim2.new(1, -40, 0, 40)
MainButton.Position = UDim2.new(0, 20, 0, 145)
MainButton.BackgroundColor3 = Color3.fromRGB(60, 180, 120)
MainButton.BorderSizePixel = 0
MainButton.Text = "Verificar Key"
MainButton.TextColor3 = Color3.new(1, 1, 1)
MainButton.Font = Enum.Font.GothamBold
MainButton.TextSize = 14
MainButton.Parent = Main

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = MainButton

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(1, -40, 0, 30)
GetKeyButton.Position = UDim2.new(0, 20, 0, 195)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(180, 180, 190)
GetKeyButton.Font = Enum.Font.GothamMedium
GetKeyButton.TextSize = 12
GetKeyButton.Parent = Main

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyButton

-- ==================== FUNÇÕES ====================
local function Notify(texto, cor)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 300, 0, 40)
    notif.Position = UDim2.new(0.5, -150, 0, 20)
    notif.BackgroundColor3 = cor or Color3.fromRGB(30, 30, 40)
    notif.BorderSizePixel = 0
    notif.Text = texto
    notif.TextColor3 = Color3.new(1, 1, 1)
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 14
    notif.Parent = ScreenGui

    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 8)
    nc.Parent = notif

    task.delay(3, function()
        if notif then notif:Destroy() end
    end)
end

local function VerificarKey()
    if TextBox.Text == KEY_CORRETA then
        Notify("Key correta! Carregando script...", Color3.fromRGB(40, 140, 90))
        task.wait(1)
        ScreenGui:Destroy()
        loadstring(game:HttpGet(LINK_SCRIPT))()
    else
        Notify("Key incorreta! Tente novamente.", Color3.fromRGB(180, 50, 50))
        TextBox.Text = ""
    end
end

-- ==================== CONEXÕES ====================
MainButton.MouseButton1Click:Connect(VerificarKey)

TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        VerificarKey()
    end
end)

GetKeyButton.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(LINK_KEY)
        Notify("Link copiado! Cole no navegador.", Color3.fromRGB(40, 100, 140))
    end)
end)

print("[Jade MM2] KeySystem carregado. Digite a key para continuar.")
