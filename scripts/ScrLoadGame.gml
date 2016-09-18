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
