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
command_placmedyk_Impl(playerid, params[256])
{
    new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

	new giveplayerid, money;
	if( sscanf(params, "k<fix>d", giveplayerid, money))
	{
		sendTipMessage(playerid, "U�yj /placmedyk [playerid/Cz��Nicku] [cena]");
		return 1;
	}

	if(money < 100 || money > 1_000_000) { sendTipMessageEx(playerid, COLOR_GREY, "Cena od 100 do 1 000 000!"); return 1; }
	if(IsPlayerConnected(giveplayerid))
	{
	    if(giveplayerid != INVALID_PLAYER_ID)
	    {
	        if(ProxDetectorS(8.0, playerid, giveplayerid) && PlayerInfo[giveplayerid][pMember] == FRAC_ERS)
			{
			    if(giveplayerid == playerid)
			    {
			        sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz p�aci� samemu sobie!");
			        return 1;
			    }
			    if(kaska[playerid] >= money)
		        {
                	if(Sejf_Frakcji[4] + money > 1_000_000_000)
                    {
                     	sendTipMessageEx(playerid, -1, "Sejf si� przepe�ni!");
                      	return 1;
                	}
		          	GetPlayerName(playerid, sendername, sizeof(sendername));
		          	GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		           	ZabierzKase(playerid, money);
                   	Sejf_Add(4, money);

			      	new komunikat[256];
			      	format(string, sizeof(string), "* %s wyci�ga z portfela pieni�dze i daje je medykowi %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			     	format(komunikat, sizeof(komunikat), "Zap�aci�e� %d$ medykowi.", money);
			        SendClientMessage(playerid, COLOR_P@, komunikat);
			        format(komunikat, sizeof(komunikat), "Na konto frakcji wp�yn�o %d$ od gracza.", money);
			        SendClientMessage(giveplayerid, COLOR_P@, komunikat);
			        Log(payLog, INFO, "%s da� medykowi %s kwot� %d$, kt�ra trafi�a do sejfu LSMC (stan: %d$)", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), money, Sejf_Frakcji[4]);
					Sejf_Save(4);
			        return 1;
				}
				else
				{
					sendTipMessageEx(playerid, COLOR_P@, "Nie masz a� tyle przy sobie !");
					return 1;
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie ma przy tobie medyka!");
			}
		}
	}
	else
	{
	    sendErrorMessage(playerid, "Nie ma takiego gracza!");
	}
	return 1;
}

//end
