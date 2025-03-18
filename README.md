# gf4Menu
a custom F4 menu for garrys mod, currently a work in progress.

To Add New Jobs:
Go to sh_gmenuconfig.lua
["Category"] = {
  ["Job Name"] = {
    PrintName = "Name",
    Model = "Model",
    Salary = X,
    Guns = {"pistol", "sniper"},
    Description = "Description"
  }
}

To Add New Entities:
Go To sh_gmenuconfig.lua
Go to gMenu.Entities
gMenu.Entities = {
  ["Entity Print Name"] = {
      EntityName = "name in files",
      price = X
  },
}
