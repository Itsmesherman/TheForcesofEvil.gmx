// ScrSaveGame

//This line checks for the ini exsisting, and deletes it if it does exsist
if (file_exists("Save.sav")) 
{
file_delete("Save.sav")
}
// This line opens and writes to the ini. Dont worry josh, the open will create if none exsists
ini_open("Save.sav");
ini_write_real ("Global","Evil", (global.Evil))
ini_close();
