// ScrLoadGame
if (file_exists("Save.sav"))
{
    ini_open("Save.sav");
    global.Evil = ini_read_real("Global","Evil", 0);
    global.OneExists = ini_read_real ("Global","OneExists", 0)
    global.TwoExists = ini_read_real ("Global","TwoExists", 0)
    global.ThreeExists = ini_read_real ("Global","ThreeExists", 0)
    global.FourExists = ini_read_real ("Global","FourExists", 0)
    global.FiveExists = ini_read_real ("Global","FiveExists", 0)
    global.SixExists = ini_read_real ("Global","SixExists", 0)
    ini_close()
}
else
{
exit
}

/// Get Evil for Time Passed
//This Block will creat a global for seconds since last opend by comparing the save file
//date and the date at oppening
if (file_exists("Save.sav"))
{
    ini_open("Save.sav");
(global.SecondsPassed) = (date_second_span((ini_read_real("Global","Time at Save",0)), (date_current_datetime())))
ini_close()
}
//This block simulates the evil gained per second the game was closed, limiting evil 
//gained to no more than one hour, or 3600 seconds. in the future we may change
//this so every 60 seconds adds one to "global.MinutsPassed" but this works as of now.
//global.EvilAdded exsists to tell the user the evil gained since close, and is than 
//added to the regular global.Evil before being reset
{if global.SecondsPassed <= 3600
{
    global.EvilAdded += ((((global.OneExists) + 1)*1.5)*(global.SecondsPassed))
    global.EvilAdded += ((((global.TwoExists) + 1)*3.9)*(global.SecondsPassed))
    global.EvilAdded += ((((global.ThreeExists) + 1)*9.6)*(global.SecondsPassed))
    global.EvilAdded += ((((global.FourExists) + 1)*24)*(global.SecondsPassed))
    global.EvilAdded += ((((global.FiveExists) + 1)*60)*(global.SecondsPassed))
    global.EvilAdded += ((((global.SixExists) + 1)*150)*(global.SecondsPassed))
}
else
{
    global.EvilAdded += ((((global.OneExists) + 1)*1.5)*(3600))
    global.EvilAdded += ((((global.TwoExists) + 1)*3.9)*(3600))
    global.EvilAdded += ((((global.ThreeExists) + 1)*9.6)*(3600))
    global.EvilAdded += ((((global.FourExists) + 1)*24)*(3600))
    global.EvilAdded += ((((global.FiveExists) + 1)*60)*(3600))
    global.EvilAdded += ((((global.SixExists) + 1)*150)*(3600))
}
}

