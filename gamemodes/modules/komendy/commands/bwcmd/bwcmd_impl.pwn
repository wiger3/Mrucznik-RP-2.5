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
command_bwcmd_Impl(playerid, params[256])
{
    if(PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
	{
		new giveplayerid, czas, string[144];
		if(sscanf(params, "k<fix>d", giveplayerid, czas))
		{
			sendTipMessage(playerid, "U�yj /bw [ID/NICK GRACZA] [czas w sekundach]"); //
			return 1;
		}
		if(!IsPlayerConnected(giveplayerid)) return sendErrorMessage(playerid, "Nie ma takiego gracza.");
		new maxtime = BW_TIME_CRIMINAL + INJURY_TIME + INJURY_TIME_EXCEPTION + INJURY_TIME_DISEASES;
		if(czas > maxtime)
		{
			format(string, sizeof(string), "Tip: Maksymalny czas BW to [%d] sekund", maxtime);
			return sendTipMessage(playerid, string);
		}
		NadajBW(giveplayerid, czas, false);
		SendClientMessage(playerid, COLOR_GRAD2, "Nadano BW");
	}
    return 1;
}

//end
