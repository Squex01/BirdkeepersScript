local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/BirdkeepersScript/main/Birdkeepers.lua')))()
local w = library:CreateWindow("Birdkeepers")
local b = w:CreateFolder("AutoFarm")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

b:Toggle("SmartAutoFarm",function(bool)
    shared.toggle = bool
    SmartAutoFarm = bool
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discord Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)

base = "https://youtu.be/dQw4w9WgXcQ"
for i,v in pairs(game:GetService("Workspace").Trees:GetDescendants()) do
    if v.ClassName == "TextLabel" then
        if v.Text == "@"..game.Players.LocalPlayer.Name then
            base = v.Name
        end
    end
end

if base == "https://youtu.be/dQw4w9WgXcQ" then
    for i,v in pairs(game:GetService("Workspace").Trees:GetChildren()) do
        game:GetService("ReplicatedStorage").Shared.Network.ClaimTree:FireServer(v.Name)
    end
end

while wait() do
    if SmartAutoFarm == true then
        pcall(function()
            Food = game:GetService("Players").LocalPlayer.PlayerGui.UI.Topbar.Storage.Amount.Text
            Food1 = string.gsub(Food,"Food","")
            Food2 = string.gsub(Food1,"<b></b>","")
            Food3 = string.gsub(Food2," ","")
            a,b = Food3:match("(.+)/(.+)")
            if a ~= b then
                for i,v in pairs(game:GetService("Workspace").Planes:GetChildren()) do
                    if tonumber(v.Name) >= 242 and tonumber(v.Name) <= 391 then
                        if SmartAutoFarm == true then
                            Food4 = game:GetService("Players").LocalPlayer.PlayerGui.UI.Topbar.Storage.Amount.Text
                            Food5 = string.gsub(Food4,"Food","")
                            Food6 = string.gsub(Food5,"<b></b>","")
                            Food7 = string.gsub(Food6," ","")
                            a1,b1 = Food7:match("(.+)/(.+)")
                            if a1 ~= b1 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.Position + Vector3.new(0,5,0))
                                workspace.Characters[game.Players.LocalPlayer.Name].ToolServer.ToolEvent:FireServer(true)
                                wait(1)
                            end
                        end
                    end
                end
            end
            Food4 = game:GetService("Players").LocalPlayer.PlayerGui.UI.Topbar.Storage.Amount.Text
            Food5 = string.gsub(Food4,"Food","")
            Food6 = string.gsub(Food5,"<b></b>","")
            Food7 = string.gsub(Food6," ","")
            a1,b1 = Food7:match("(.+)/(.+)")
            if a1 == b1 then
                for i,v in pairs(game:GetService("Workspace").Trees:GetDescendants()) do
                    if v.ClassName == "TextLabel" then
                        if v.Text == "@"..game.Players.LocalPlayer.Name then
                            if SmartAutoFarm == true then
                                workspace.Characters[game.Players.LocalPlayer.Name].ToolServer.ToolEvent:FireServer(false)
                                repeat
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.Parent.CFrame.Position + Vector3.new(0,5,0))
                                keypress(0x45) wait() keyrelease(0x45)
                                wait()
                                until game:GetService("Players").LocalPlayer.PlayerGui.UI.ActionBar.Action.Label.Text == "Sell Food"
                                wait(5)
                            end
                        end
                    end
                end
            end
        end)
    end
    
    spawn(function()
        if AntiAfk == true then
            local bb=game:service'VirtualUser'
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
        end
    end)
end