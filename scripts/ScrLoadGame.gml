// ScrLoadGame
if (file_exists("Save.sav"))
{
    ini_open("Save.sav");
    global.Evil = ini_read_real("Global","Evil", 0);
    ini_close()
}
else
{
exit
}
