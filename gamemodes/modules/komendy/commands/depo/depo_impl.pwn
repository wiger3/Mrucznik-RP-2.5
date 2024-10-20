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
command_depo_Impl(playerid, params[256])
{
    new string[128];
    new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        GetPlayerName(playerid, sendername, sizeof(sendername));
        if(isnull(params))
        {
            sendTipMessage(playerid, "U�yj /depo [tekst]");
            return 1;
        }
        if(gMuteDepo[playerid] == 1) return sendTipMessage(playerid, "Nie mo�esz pisa� na depo, zablokowa�e� ten czat (U�yj /togdepo)");
        new member = GetPlayerFraction(playerid);
        if(0 < member <= 4 || member == FRAC_BOR)
        {
			format(string, sizeof(string), "** (( %s [%d] %s: %s )) **", FracRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank],GetNickEx(playerid), params);
			SendTeamMessage(4, COLOR_ALLDEPT, string, 1);
			SendTeamMessage(3, COLOR_ALLDEPT, string, 1);
			SendTeamMessage(2, COLOR_ALLDEPT, string, 1);
			SendTeamMessage(1, COLOR_ALLDEPT, string, 1);
			SendTeamMessage(18, COLOR_ALLDEPT, string, 1);
            SendTeamMessage(FRAC_BOR, COLOR_ALLDEPT, string, 1); 
            Log(chatLog, INFO, "%s departament %d OOC: %s", GetPlayerLogName(playerid), member, params);
		}
        else
        {
            noAccessMessage(playerid);
            return 1;
        }
    }
    return 1;
}

//end
