//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ houseowner ]----------------------------------------------//
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

CMD:houseowner(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5000 )
	{
		new dld, id;
		if( sscanf(params, "dd", dld, id))
		{
			sendTipMessage(playerid, "U�yj /houseowner [dom ID] [ID gracza] ");
			return 1;
		}
		if(IsPlayerConnected(id))
		{
            Dom_ChangeOwner(playerid, dld, id);
		}
		else
		{
		    sendTipMessage(playerid, "Gracz nie jest polaczony.");
		}
	}
	return 1;
}



