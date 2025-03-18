gMenu.isOpen = false
gMenu.frame = {}
gMenu.NextOpen = 1
gMenu.CoolDown = 5

hook.Add("Think", "openf4Menu", function()
    if input.IsKeyDown(KEY_F4) then
        print("OK")
        if not gMenu.isOpen and CurTime() > gMenu.NextOpen then
            gMenu.NextOpen = CurTime() + gMenu.CoolDown
            gMenu.isOpen = true
            gMenu.Open()
        end    
    end
end)

function gMenu.Close()
    if IsValid(gMenu.frame) then
        gMenu.frame:Close()
    end
end

function gMenu.JobMenu()
    local scrw, scrh = ScrW(), ScrH()
    local w, h = scrw / 1.5, scrh / 1.3
    gMenu.jMenu = vgui.Create("DPanel", gMenu.frame)
    gMenu.jMenu:SetSize(w, h)
    gMenu.jMenu:SetPos(300, 50)

    gMenu.jMenu.Paint = function() end

    gMenu.jTabs = vgui.Create("DScrollPanel", gMenu.jMenu)
    gMenu.jTabs:Dock(FILL)
    gMenu.jTabs:DockMargin(0, 0, 0, 5)

    local jobList = {}

    for k, v in pairs(gMenu.Jobs) do
        local category = vgui.Create("DCollapsibleCategory")
        category:SetLabel(k)
        category:SetExpanded(false)
        category:SetSize(w, h)
        category:Dock(TOP)
        category:DockMargin(0, 0, 0, 5)

        --Add Jobs To Category

        local jobPanel = vgui.Create("DPanelList")
        jobPanel:SetSpacing( 5 )
        jobPanel:EnableHorizontal( false )	
        jobPanel:EnableVerticalScrollbar( true )
        category:SetContents(jobPanel)
        for i, j in pairs(v) do
            local job = vgui.Create("DButton")
            job:SetText(j.PrintName)
            jobPanel:AddItem(job)
        end

        gMenu.jTabs:AddItem(category)
    end

end

function gMenu.EntitityMenu()

end

function gMenu.PlayerListMenu()

end

function gMenu.OpenSubMenu(type)
    type = string.lower(type)

    --Clean up screen so we can close
    if IsValid(gMenu.jMenu) then
        gMenu.jMenu:Remove()
    elseif IsValid(gMenu.eMenu) then
        gMenu.eMnu:Remove()
    elseif IsValid(gMenu.pMenu) then
        gMenu.pMenu:Remove()
    end

    if type == "jobs" then
        gMenu.JobMenu()
    elseif type == "entities" then
        gMenu.EntitityMenu()
    elseif type == "playerlist" then
        gMenu.PlayerListMenu()
    end
end

function gMenu.Open()
    local scrw, scrh = ScrW(), ScrH()
    local width, height = scrw / 1.2, scrh / 1.2

    gMenu.frame = vgui.Create("DFrame")
    gMenu.frame:SetSize(width, height)
    gMenu.frame:Center()
    gMenu.frame:SetTitle("")
    gMenu.frame:SetDraggable(false)
    gMenu.frame:MakePopup()

    gMenu.Tabs = vgui.Create("DScrollPanel", gMenu.frame)
    gMenu.Tabs:Dock(FILL)
    gMenu.Tabs:DockMargin(0, 200, 0, 0)

    for k, v in pairs(gMenu.MenuTabs) do
        local panel = gMenu.Tabs:Add("DPanel")
        panel:Dock(TOP)
        panel:SetWide(scrw / 12)
        panel:SetTall(scrh / 20)
        panel:DockMargin(0, 0, 0, 10)
        panel.Paint = function() end

        local button = panel:Add("DButton")
        button:SetText(v)
        button:SetWide(scrw / 12)
        button:SetTall(scrh / 20)
        button:SetPos(0, 0)

        button.Paint = function(self, w, h)
            draw.RoundedBox(1, 0, 0, w, h, gMenu.SolidBlack)
            draw.RoundedBox(2, 0, 0, w, h, gMenu.LightBlue)
        end

        button.DoClick = function()
            gMenu.OpenSubMenu(v)
        end
    end

    gMenu.frame.Paint = function(self, w, h)
        draw.RoundedBox(2, 0, 0, w, h, gMenu.Black)
    end

    gMenu.frame.OnClose = function()
        gMenu.isOpen = false
    end


end

--UI Stuff
gMenu.Black = Color(0, 0, 0, 180)
gMenu.LightBlue = Color(99, 208, 252, 185)
gMenu.SolidBlack = Color(0, 0, 0, 255)

--Fonts
surface.CreateFont("gCategoryFont", {
    font = "Arial",
    extended = true,
    size = 20
})

surface.CreateFont("gButtonFont", {
    font = "Arial",
    extended = true,
    size = 35
})
