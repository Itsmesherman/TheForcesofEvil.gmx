// ScrSaveGame

//This line checks for the ini exsisting, and deletes it if it does exsist
if (file_exists("Save.sav")) 
{
file_delete("Save.sav")
}
// This line opens and writes to the ini. Dont worry josh, the open will create if none exsists
ini_open("Save.sav");
ini_write_real ("Global","Evil", (global.Evil))
{
// This should Save the Time the game was closed for simulating Downtime
ini_write_real ("Global","Time at Save", (date_current_datetime()))
}
ini_write_real ("Global","OneExists", (global.OneExists))
ini_write_real ("Global","TwoExists", (global.TwoExists))
ini_write_real ("Global","ThreeExists", (global.ThreeExists))
ini_write_real ("Global","FourExists", (global.FourExists))
ini_write_real ("Global","FiveExists", (global.FiveExists))
ini_write_real ("Global","SixExists", (global.SixExists))
ini_close();
