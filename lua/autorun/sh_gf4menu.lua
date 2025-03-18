gMenu = {}
gMenu.BaseDir = "gf4menu/"

function gMenu.LoadShared(filename)
  local file = gMenu.BaseDir .. filename

  if SERVER then
    AddCSLuaFile(file)
    include(file)
  else
    include(file)
  end
end

function gMenu.LoadServer(filename)
  local file = gMenu.BaseDir .. filename

    if SERVER then
      include(file)
    end
end

function gMenu.LoadClient(filename)
  local file = gMenu.BaseDir .. filename
    
  if SERVER then
    AddCSLuaFile(file)
  else
    include(file)    
  end
end

--Load Files
gMenu.LoadClient("client/cl_menu.lua")
gMenu.LoadShared("sh_gmenuconfig.lua")
gMenu.LoadServer("server/sv_gmenu.lua")
