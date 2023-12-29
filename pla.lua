---cccc
local P = game:GetService("Players")
local LP = P.LocalPlayer
local PG = LP.PlayerGui
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes")
local Remote = Remotes:WaitForChild("CommF_")
local RunS = game:GetService("RunService")
local Loop = RunS.RenderStepped
local Data = LP.Data
local WS = game:GetService("Workspace")
local WO = WS["_WorldOrigin"]
local VU = game:GetService("VirtualUser")
local EnemySpawns = WO.EnemySpawns
local Enemies = WS.Enemies
local CameraShaker = require(RS.Util.CameraShaker)
local GuideModule = require(RS.GuideModule)
local Quests = require(RS.Quests)
local VIM = game:service("VirtualInputManager")
local LunarLoader = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = LunarLoader:CreateWindow({Title = "LunarZ Hub ", SubTitle = "by Hirimii", TabWidth = 160, Size = UDim2.fromOffset(500, 360), Acrylic = true, Theme = "Dark", MinimizeKey = Enum.KeyCode.LeftControl})
local Z = Window:AddTab({ Title = "About", Icon = "rbxassetid://15782111043" })
local M = Window:AddTab({ Title = "Main Farm", Icon = "rbxassetid://4483345998" })
local B = Window:AddTab({ Title = "Setting", Icon = "settings" })
local C = Window:AddTab({ Title = "Item", Icon = "rbxassetid://9606626859" })
local D = Window:AddTab({ Title = "Raid & DF", Icon = "rbxassetid://11155986081" })
local E = Window:AddTab({ Title = "Shop", Icon = "rbxassetid://6031265976" })
local F = Window:AddTab({ Title = "Sea Event", Icon = "rbxassetid://7040410130" })
local G = Window:AddTab({ Title = "Upgrade Race", Icon = "rbxassetid://11162889532" })
local H = Window:AddTab({ Title = "Miscellaneous", Icon = "rbxassetid://7044233235" })
if game.PlaceId == 2753915549 then
    Main = true
elseif game.PlaceId == 4442272183 then
    Dressrosa = true
elseif game.PlaceId == 7449423635 then
    Zou = true
else
    game.Players.LocalPlayer:Kick("Not Supported Game This")
end
function GetDistance(q)
    if typeof(q) == "CFrame" then
        return LP:DistanceFromCharacter(q.Position)
    elseif typeof(q) == "Vector3" then
        return LP:DistanceFromCharacter(q)
    end
end
function TeleportSeaIfWrongSea(world)
    if world == 1 then
        if not game.PlaceId == 2753915549 then
            RS.Remotes.CommF_:InvokeServer("TravelMain")
            wait()
        end
    elseif world == 2 then
        if not game.PlaceId == 4442272183 then
            RS.Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    elseif world == 3 then
        if not game.PlaceId == 7449423635 then
            RS.Remotes.CommF_:InvokeServer("TravelZou")
        end
    end
end
function Notify(G, H, I)
    if G == nil or G == "" then
        G = "Not Titled"
    end
    if H == nil or H == "" then
        H = "No Any Descriptions"
    end
    if type(I) ~= "number" then
        I = 10
    end
    HirimiHub:MakeNotification({Name = G, Content = H, Image = "rbxassetid://15214658898", Time = I})
end
spawn(function()
    while wait() do
        for i,v in pairs(Enemies:GetChildren()) do
            if ((StartFarm and ModeFarm == "Level" and StartBring and v.Name == CheckQuest()["MobName"]) or (FarmSkip and StartBring and v.Name == "Shanda") or (StartFarms and SelectFarm == "Bone" and StartBring and CheckBoneMob()) or (StartFarms and SelectFarm == "Cake Prince" and StartBring and CheckCakeMob())) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and GetDistance(v.HumanoidRootPart.Position) <= 300 then
                v.HumanoidRootPart.CFrame = PosMon
                v.HumanoidRootPart.Size = Vector3.new(1,1,1)                                               
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                v.Humanoid:ChangeState(14)
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
            end
        end
    end
end)
function CheckNearestTeleporter(P)
    local min = math.huge
    local min2 = math.huge
    local choose 
    if Zou then
        TableLocations = {
            ["1"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["2"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["3"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["4"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["5"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["6"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif Dressora then
        TableLocations = {
            ["1"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["2"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["3"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["4"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif Main then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - P.Position).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end    
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    if min2 <= GetDistance(P) then
        return choose
    end
end
function ToTween(Positions)
    Distance = (Positions.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 5000
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Positions
    elseif Distance < 50 then
        Speed = 2000
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Positions
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 400
    elseif Distance < 750 then
        Speed = 300
    elseif Distance >= 1000 then
        Speed = 290
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Positions}
    ):Play()
end
function RemoveLvTitle(mob)
    mob = mob:gsub(" %pLv. %d+%p", "")
    return mob
end
function FunctionFoldermob()
    print("FunctionFoldermob")
    repeat
        wait()
        if game.Workspace:FindFirstChild("MobSpawns") then
            game.Workspace.MobSpawns:Destroy()
        end
    until not game.Workspace:FindFirstChild("MobSpawns")
    local K = Instance.new("Folder")
    K.Parent = game.Workspace
    K.Name = "MobSpawns"
    wait()
    repeat
        wait()
    until game.Workspace:FindFirstChild("MobSpawns")
    for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        local a = v:Clone()
        a.Parent = game.Workspace.MobSpawns
    end
    local L = {}
    for r, v in next, require(game:GetService("ReplicatedStorage").Quests) do
        for M, N in next, v do
            for O, P in next, N.Task do
                if P > 1 then
                    table.insert(L, O)
                end
            end
        end
    end
    if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for r, v in pairs(getnilinstances()) do
            if table.find(L, tostring(v.Name:gsub(" %pLv. %d+%p", ""))) then
                local a = v:Clone()
                a.Parent = game.Workspace.MobSpawns
            end
        end
    else
        for r, v in pairs(getnilinstances()) do
            if table.find(L, v.Name) then
                local a = v:Clone()
                if a.Parent then
                    a.Parent = game.Workspace.MobSpawns
                end
            end
        end
    end
end
FunctionFoldermob()
function MobSpawnCheck(cc)
    for r, v in next, game.Workspace.MobSpawns:GetChildren() do
        if v.Name == cc then
            return v
        end
    end
end
function CheckQuest()
    local Lvl = Data.Level.Value
    local IgnoreQuests = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local Quest = {}
    local LevelReq = 0
    for i,v in pairs(Quests) do
		for a,b in pairs(v) do
		    for j, k in pairs(b["Task"]) do
		    	if b["LevelReq"] <= Lvl and b["LevelReq"] >= LevelReq and not table.find(IgnoreQuests, i) and k > 1 then		            
			    	Quest["QuestName"] = i
			        Quest["ID"] = a
			        Quest["MobName"] = j
                    LevelReq = b["LevelReq"]
		        end
			end	
		end
	end
	if LevelReq >= 700 and Main then
        Quest["MobName"] = "Galley Captain"
        Quest["QuestName"] = "FountainQuest"
        Quest["ID"] = 2
    elseif LevelReq >= 1450 and Dressrosa then
        Quest["MobName"] = "Water Fighter"
        Quest["QuestName"] = "ForgottenQuest"
        Quest["ID"] = 2
    end
	return Quest
end
function QuestDungKo(mob)
    if GuideModule["Data"]["QuestData"]["Name"] == mob then
        return true
    end
    return false
end
for i, v in pairs(CheckQuest()) do
    if typeof(v) ~= "table" then
        print(i, v)
    else
        print(i, #v)
    end
end
function GetMob()
    
end
function GetPosMob(Mob)
    local CFrameTab = {}
	if EnemySpawns:FindFirstChild(Mob) then
    	for i, v in pairs(EnemySpawns:GetChildren()) do
    	    if v:IsA("Part") and v.Name == Mob then
	            table.insert(CFrameTab, v.CFrame)
	        end
	    end
	end
	return CFrameTab
end
function NPCPos()
    for i,v in pairs(GuideModule["Data"]["NPCList"]) do
		if v["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
			return i["CFrame"]
		end
	end
end
function GetQuest()
    local Distance = GetDistance(NPCPos())
    local questname, id = CheckQuest()["QuestName"], CheckQuest()["ID"]
    if Distance <= 20 then
        Remote:InvokeServer("StartQuest", questname, id)
        NoClip = false
    else
        if Distance > 2000 then
            BypassTele(NPCPos())
        else
            ToTween(NPCPos())
        end
        NoClip = true
    end
    Remote:InvokeServer("SetSpawnPoint")
end
function EClick()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end
function EWeapon(tool)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tool) then
        wait(.5)
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(tool)
        wait(.5)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end
function EBuso()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if NoClip then
            if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                local ag = Instance.new("BodyVelocity")
                ag.Velocity = Vector3.new(0, 0, 0)
                ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                ag.P = 9000
                ag.Parent = game.Players.LocalPlayer.Character.Head
                for r, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
            end
        elseif not NoClip and game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
    end)
end)
spawn(function()
    while wait() do
        if StartFarm then
            NoClip = true
        else
            NoClip = false
        end
    end
end)
function BypassTele(PosSelect)
    if GetDistance(PosSelect.Position) >= 2000 and LP.Character.Humanoid.Health > 0 then
        game.Players.LocalPlayer.Character.Head:Destroy()
        for i = 1,9 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PosSelect
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
    end
end
function DisableTween(v0)
    if not v0 then
        NoClip = false
        ToTween(LP.Character.HumanoidRootPart.CFrame)
    end
end
local SelectTool = M:AddDropdown("SelectTool",{Title = "Select Tool", Values = {"Melee", "Sword"}, Multi = false, Callback = function(vSt)
        selecttool = vSt
    end
})
game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
        if v:IsA("Tool") and v.ToolTip == selecttool then
            selecttool = v.Name
        end
    end
end)
_G.FastAttackDelay = 0.175
local FastSE = M:AddDropdown("FastSE",{Title = "Fast Attack Speed", Values = {"0", "0.15", "0.175", "0.2"}, Multi = false, Callback = function(vFast)
    _G.FastAttackDelay = vFast
end
})
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttackDelay == "0" then
            _G.FastAttackDelay = 0
        elseif _G.FastAttackDelay == "0.15" then
            _G.FastAttackDelay = 0.15
        elseif _G.FastAttackDelay == "0.175" then
            _G.FastAttackDelay = 0.175
        elseif _G.FastAttackDelay == "0.2" then
            _G.FastAttackDelay = 0.2
        end
    end)
end)
local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
spawn(function()
    while task.wait() do
        pcall(function()
            if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
            if not shared.cpc then shared.cpc = STOP.play end
                STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                local Hits = STOPRL.getBladeHits(b,c,d)
                if Hits then
                    if _G.FastAttack then
                        STOP.play = function() end
                        a:Play(0.01,0.01,0.01)
                        func(Hits)
                        STOP.play = shared.cpc
                        wait(a.length * 0.5)
                        a:Stop()
                    else
                        a:Play()
                    end
                end
            end
        end)
    end
end)
function GetBladeHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local p13 = CmrFwLib.activeController
    local weapon = p13.blades[1]
    if not weapon then 
        return weapon
    end
    while weapon.Parent ~= game.Players.LocalPlayer.Character do
        weapon = weapon.Parent 
    end
    return weapon
end
function AttackHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local plr = game.Players.LocalPlayer
    for i = 1, 1 do
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            pcall(function()
                CmrFwLib.activeController.timeToNextAttack = 1
                CmrFwLib.activeController.attacking = false
                CmrFwLib.activeController.blocking = false
                CmrFwLib.activeController.timeToNextBlock = 0
                CmrFwLib.activeController.increment = 3
                CmrFwLib.activeController.hitboxMagnitude = 60
                CmrFwLib.activeController.focusStart = 0
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBladeHit()))
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
            end)
        end
    end
end
spawn(function()
    while wait(.1) do
        if _G.FastAttack then
            pcall(function()
                repeat task.wait(_G.FastAttackDelay)
                    AttackHit()
                until not _G.FastAttack
            end)
        end
    end
end)
local FastT = M:AddToggle("FastT", {Title = "Enable Fast Attack", Callback = function(vFastT)
    _G.FastAttack = vFastT
    end
})
FastT:SetValue(true)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.FastAttack then
			if typeof(y) == "table" then
				pcall(function()
					CameraShaker:Stop()
					y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
					y.activeController.timeToNextAttack = 0
					y.activeController.hitboxMagnitude = 60
					y.activeController.active = false
					y.activeController.timeToNextBlock = 0
					y.activeController.focusStart = 1655503339.0980349
					y.activeController.increment = 1
					y.activeController.blocking = false
					y.activeController.attacking = false
					y.activeController.humanoid.AutoRotate = true
				end)
			end
		end
        if _G.FastAttack == true then
			game.Players.LocalPlayer.Character.Stun.Value = 0
			game.Players.LocalPlayer.Character.Busy.Value = false        
		end
	end)
end)
local BTP = M:AddToggle("BTP", {Title = "Bypass Teleport", Callback = function(vBTP)
    BypassTP = vBTP
    end
})
M:AddParagraph({Title = "Mode Farm", Content = ".........."})
local ModeFarm = M:AddDropdown("Select Mode Farm",{Title = "Select Mode Farm", Values = {"Level", "Cake Prince", "Bone"}, Multi = false, Callback = function(vModeFarm)
    ModeFarm = vModeFarm
end
})
local ModeFarmT = M:AddToggle("Start Farm", {Title = "Start Farm", Callback = function(vStartFarm)
    StartFarm = vStartFarm
    DisableTween(StartFarm)
    end
})
spawn(function()
    while task.wait() do
        if ModeFarm == "Level" and StartFarm then
            local Quest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
            if Quest.Visible == true then
                if not QuestDungKo(CheckQuest()["MobName"]) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                else      
                    if game.Workspace.Enemies:FindFirstChild(CheckQuest()["MobName"]) then     
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == CheckQuest()["MobName"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if not MasteryOption then
                                    repeat task.wait()
                                        EWeapon(selecttool)                                                                                                                    
                                        EBuso()
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)  
                                        v.HumanoidRootPart.CanCollide = false
                                        PosMon = v.HumanoidRootPart.CFrame
                                        EClick()
                                        StartBring = true
                                    until not StartFarms or not SelectFarm == "Level" or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                                    StartBring = false
                                end
                            end
                        end
                    else
                        getttt = game.workspace.MobSpawns:FindFirstChild(CheckQuest()["MobName"])
                        if getttt and not game.Workspace.Enemies:FindFirstChild(CheckQuest()["MobName"]) and StartFarm then
                            ToTween(MobSpawnCheck(CheckQuest()["MobName"]).CFrame * CFrame.new(0, 15, 8))
                            concac2 = Instance.new("Part")
                            concac2.Parent = MobSpawnCheck(CheckQuest()["MobName"])
                            concac2.Name = "concac2"
                        elseif not getttt then
                            FunctionFoldermob()
                        end
                    end
                end   
            else
                GetQuest()
            end
        end
    end
end)
