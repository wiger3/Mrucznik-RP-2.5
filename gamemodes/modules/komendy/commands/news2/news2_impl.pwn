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
command_news2_Impl(playerid, params[256])
{
    new string[124], text[124]; 
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pMember] == FRAC_SN && PlayerInfo[playerid][pRank] >= 5)
		{
			if(sscanf(params, "s[124]", text))
			{
				sendTipMessage(playerid, "U�yj /news2 [text]"); 
				return 1;
			}
			format(string, sizeof(string), "Ustawi�e� nowy komunikat na blok informacyjny"); 
			sendTipMessageEx(playerid, COLOR_P@, string); 
			format(string, sizeof(string), "~y~Reporter %s:~w~%s", GetNick(playerid), Odpolszcz(text)); 
			SendNews_2(string); 
		}
		else{
			sendErrorMessage(playerid, "Ta komenda jest dost�pna od 5 stopnia w San News!"); 
			return 1;
		}
	}
	return 1;
}

//end
