//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wezwij ]------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

CMD:service(playerid, params[]) return cmd_wezwij(playerid, params);
CMD:wezwij(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pJailed] == 0 && GetPlayerInterior(playerid) == 0)
        {
            if(AntySpam[playerid] != 0)
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Spr�buj za 30 sekund !");
                return 1;
            }
			new x_nr[16];
			if( sscanf(params, "s[16]", x_nr))
			{
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Service Names __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "U�YJ: /wezwij [nazwa]");
		  		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Taxi, Bus, Medyk, Mechanik, Heli");
				SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________|");
				return 1;
			}
		    if(strcmp(x_nr,"taxi",true) == 0)
			{
			    if(TaxiDrivers < 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma taks�wkarzy, spr�buj p�niej !");
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma wolnych taks�wkarzy !");
		        }
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(PlayerInfo[playerid][pLevel] <= 3)
				{
					format(string, sizeof(string), "**[NEW_PLAYER] %s potrzebuje transportu. (wpisz /akceptuj taxi aby zaaceptowa� zg�oszenie)", sendername);
					SendFamilyMessage(10, 0xE88A2DFF, string);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoni�e� po taks�wk�, czekaj na akceptacje.");
					TaxiCall = playerid;
					AntySpam[playerid] = 1;
					SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
				}
				else
				{
					format(string, sizeof(string), "** %s potrzebuje transportu. (wpisz /akceptuj taxi aby zaaceptowa� zg�oszenie)", sendername);
					SendFamilyMessage(10, 0xE88A2DFF, string);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoni�e� po taks�wk�, czekaj na akceptacje.");
					TaxiCall = playerid;
					AntySpam[playerid] = 1;
					SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
				}
		    	return 1;
			}
			else if(strcmp(x_nr,"heli",true) == 0)
			{
			    if(HeliDrivers < 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma pilota, spr�buj p�niej !");
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma wolnego pilota !");
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s potrzebuje transportu. (wpisz /akceptuj heli aby zaaceptowa� zg�oszenie)", sendername);
		    	SendFamilyMessage(10, 0xE88A2DFF, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wezwa�e� helikopter, czekaj na miejscu.");
		    	HeliCall = playerid;
		    	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else if(strcmp(x_nr,"bus",true) == 0)
			{
			    if(BusDrivers < 1)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma kierowc�w autobusu, spr�buj p�niej !");
		            return 1;
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma wolnych autobus�w !");
		            return 1;
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s potrzebuje autobusu. (wpisz /akceptuj bus aby zaakceptowa� zlecenie)", sendername);
		    	SendFamilyMessage(10, 0xE88A2DFF, string);
		    	SendJobMessage(10, 0xE88A2DFF, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoni�e� po autobus, czekaj na akceptacje.");
		    	BusCall = playerid;
		    	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else if(strcmp(x_nr,"medyk",true) == 0)
			{
			    if(Medics < 1)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma lekarzy na s�u�bie, spr�buj potem !");
		            return 1;
		        }
		        foreach(new i : Player)
				{
				    if(JobDuty[i] >= 1 && IsAMedyk(i))
				    {
				    	GetPlayerName(playerid, sendername, sizeof(sendername));
				    	format(string, sizeof(string), "** %s potrzebuje pomocy. (wpisz /akceptuj medyk aby zaakceptowa� zlecenie)", sendername);
				   		SendClientMessage(i, TEAM_AZTECAS_COLOR, string);
				   	}

			   	}
			   	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoni�e� po lekarza, czekaj na akceptacje.");
			   	MedicCall = playerid;
			   	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else if(strcmp(x_nr,"mechanik",true) == 0)
			{
			    if(Mechanics < 1)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma mechanik�w na s�u�bie, spr�buj potem !");
		            return 1;
		        }
		        foreach(new i : Player)
				{
				    if(JobDuty[i] >= 1 && PlayerInfo[i][pJob] == 7)
				    {
				    	GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "** %s potrzebuje mechanika. (wpisz /akceptuj mechanik aby zaakceptowa� zlecenie)", sendername);
					   	SendClientMessage(i, TEAM_AZTECAS_COLOR, string);
					}
				}
			   	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoni�e� po mechanika, czekaj na akceptacje.");
			   	MechanicCall = playerid;
			   	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Z�a nazwa!");
			    return 1;
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz wzywa� w AJ/interiorze !");
		}
	}
	return 1;
}

