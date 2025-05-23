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
command_zamknijlinie_Impl(playerid, params[256])
{
    if(IsPlayerInFraction(playerid, FRAC_SN, 1000))
    {
        new lLine;
        if(sscanf(params, "d", lLine)) return sendTipMessage(playerid, "Podaj numer lini, kt�r� chcesz zamkn�� np. 100 lub 150");
        if(lLine < 100 || lLine > 150) return sendTipMessage(playerid, "Numer od 100 do 150.");
        new lStr[128];
        gSNLockedLine[lLine-100] = true;
        format(lStr, 128, "San-SMS: Linia %d zosta�a zamkni�ta przez %s", lLine, GetNick(playerid));
        SendFamilyMessage(FRAC_SN, COLOR_YELLOW, lStr);
    }
    else sendErrorMessage(playerid, "Nie jeste� z SN.");
    return 1;
}

//end
