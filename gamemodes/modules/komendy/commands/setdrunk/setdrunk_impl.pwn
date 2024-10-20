//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Autor: mrucznik
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_setdrunk_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
    {
        new string[144];
		if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid) )
		{
			new giveplayerid, level;
			if(sscanf(params, "dd", giveplayerid, level))
			{
				sendTipMessage(playerid, "U�yj /setdrunk [ID] [poziom (2000 wy��cza | max 50000)]");
				return 1;
			}

			if(IsPlayerConnected(giveplayerid))
            {
				if(level < 2000) level = 2000;
				else if(level > 50000) return sendTipMessage(playerid, "U�yj /setdrunk [ID] [poziom (2000 wy��cza | max 50000)]");

				SetPlayerDrunkLevel(giveplayerid, level);
				format(string, sizeof(string), "AdmCmd: %s [%d] ustawi� %s [%d] efekt pijactwa na [%d]", 
					GetNickEx(playerid), 
					playerid,
					GetNick(giveplayerid),
					giveplayerid,
					(level == 2000 ? '0' : level)
				); 
				SendMessageToAdmin(string, COLOR_RED);
            }
            else
            {
                return sendErrorMessage(playerid, "Nie ma takiego gracza"); 
            }
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}

//end
