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
command_kupkredyty_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		
        if(GUIExit[playerid] == 0)
    	{
    	    if(IsPlayerInRangeOfPoint(playerid, 4.0, 1197.0911,-1772.3119,13.7282))
    	    {
				new string[300];
				format(string, sizeof(string), "Pakiet\tIlo��\tCena\n\
												{C0C0C0}Dzieci�cy\t{FF0000}50\t{37AC45}%d$\n\
												{C0C0C0}Normalny\t{FF0000}100\t{37AC45}%d$\n\
												{C0C0C0}Zaawansowany\t{FF0000}250\t{37AC45}%d$\n\
												{FFFF00}Premium\t{FF0000}500\t{37AC45}%d$", onePoolPrice, twoPoolPrice, threePoolPrice, fourPoolPrice);
				ShowPlayerDialogEx(playerid, 1403,  DIALOG_STYLE_TABLIST_HEADERS, "Kup Kredyty",  string, "Kup", "Anuluj");
    	    }
    	    else
    	    {
   				sendErrorMessage(playerid, "Nie jeste� na basenie Tsunami!");
				return 1;
    	    }
    	}
    }
	return 1;
}

//end
