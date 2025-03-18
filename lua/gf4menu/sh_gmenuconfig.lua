--Reference:
/*
    Entities - {
        entityName = ""
        Price = ""
    }

    Job Name - {
        Model = ""
        Salary = X
        Guns = {""} -- List of gun names
        Description = ""
        Category = "" -- Category the job should be under
    }
*/

gMenu = {}

gMenu.MenuTabs = {"Jobs", "Entities", "PlayerList"}

gMenu.Jobs = {
    ["Criminals"] = {
        ["Thief"] = {
            PrintName = "Thief",
            Model = "G",
            Salary = 0,
            Guns = {"pistol"},
            Description = "Rob People",
        },

        ["Drug Dealer"] = {
            PrintName = "Drug Dealer",
            Model = "G",
            Salary = 0,
            Guns = {"pistol"},
            Description = "Deal Drugs",
        }
    },

    ["Civil Protection"] = {
        ["Police"] = {
            PrintName = "Police",
            Model = "H",
            Salary = 1000,
            Guns = {"pistol"},
            Description = "Police Officer"
        },

        ["Mayor"] = {
            PrintName = "Mayor",
            Model = "Y",
            Salary = 1000,
            Guns = {"pistol"},
            Description = "Police Officer"
        }
    }

}

gMenu.Entities = {
    ["Silver Printer"] = {
        EntityName = "gprintersilver",
        price = 5000
    },

    ["Gold Printer"] = {
        EntityName = "gprintergold",
        price = 10000
    }
}