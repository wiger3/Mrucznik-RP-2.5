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
command_wypij_Impl(playerid, params[256])
{
    new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsAtBar(playerid))
        {
            if(PlayerDrunk[playerid] < 20)
            {
                new Float:health;
                new x_nr[16];
                GetPlayerHealth(playerid, health);
				if( sscanf(params, "s[16]", x_nr))
				{
					SendClientMessage(playerid, COLOR_WHITE, "|__________________ Bar Drinks __________________|");
					SendClientMessage(playerid, COLOR_WHITE, "U�YJ: /pij [nazwa]");
			  		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Piwo ($6), Wodka ($10), Whiskey ($10), Woda ($1), Sprunk($3)");
			  		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Soczek ($3), Wino ($10), Denaturat ($2), Jabol ($2), twojastara($100)");
					SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________|");
					return 1;
				}
			    if(strcmp(x_nr,"piwo",true) == 0)
				{
					if(PlayerInfo[playerid][pAge] < 17)
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Barman: Musisz by� pe�noletni aby pi� alkohole.");
					    return 1;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
					SetPlayerDrunkLevel (playerid, 3000);
					PlayerInfo[playerid][pPiwo] += 1;
				    ZabierzKase(playerid, 6);
				    PlayerDrunk[playerid] += 1;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100.0)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) 
						{ 
						PlayerDrunk[playerid] += 1; 
						new hp = 2 * PlayerInfo[playerid][pAlcoholPerk];
						hp += 15; 
						SetPlayerHealth(playerid, health + hp);
						}
						else { SetPlayerHealth(playerid, health + 15.0); }
					}
				}
				else if(strcmp(x_nr,"wodka",true) == 0)
				{
				    if(PlayerInfo[playerid][pAge] < 18)
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Barman: Musisz by� pe�noletni aby pi� alkohole.");
					    return 1;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
					SetPlayerDrunkLevel (playerid, 5000);
					PlayerInfo[playerid][pPiwo] += 1;
				    ZabierzKase(playerid, 10);
				    PlayerDrunk[playerid] += 2;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 25; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 25.0); }
					}
				}
				else if(strcmp(x_nr,"whiskey",true) == 0)
				{
				    if(PlayerInfo[playerid][pAge] < 18)
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Barman: Musisz by� pe�noletni aby pi� alkohole.");
					    return 1;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
					SetPlayerDrunkLevel (playerid, 10000);
					PlayerInfo[playerid][pWino] += 1;
				    ZabierzKase(playerid, 10);
				    PlayerDrunk[playerid] += 3;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 27; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 27.0); }
					}
				}
				else if(strcmp(x_nr,"woda",true) == 0)
				{
				    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
				    PlayerInfo[playerid][pSprunk] += 1;
				    ZabierzKase(playerid, 1);
				    if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 5; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 5.0); }
					}
				}
				else if(strcmp(x_nr,"sprunk",true) == 0)
				{
				    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
				    PlayerInfo[playerid][pSprunk] += 1;
				    ZabierzKase(playerid, 2);
				    if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0)
                        { 
                            new hp = 2 * PlayerInfo[playerid][pAlcoholPerk];
                            hp += 5;
                            SetPlayerHealth(playerid, health + hp);
                        }
						else
                        {
                            SetPlayerHealth(playerid, health + 5.0);
                        }
					}
				}
				else if(strcmp(x_nr,"soczek",true) == 0)
				{
				    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
				    PlayerInfo[playerid][pSprunk] += 1;
				    ZabierzKase(playerid, 3);
				    if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 7; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 7.5); }
					}
				}
				else if(strcmp(x_nr,"wino",true) == 0)
				{
					if(PlayerInfo[playerid][pAge] < 17)
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Barman: Musisz by� pe�noletni aby pi� alkohole.");
					    return 1;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
					SetPlayerDrunkLevel (playerid, 5000);
					PlayerInfo[playerid][pWino] += 1;
				    ZabierzKase(playerid, 10);
				    PlayerDrunk[playerid] += 1;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 23; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 23.0); }
					}
				}
				else if(strcmp(x_nr,"denaturat",true) == 0)
				{
				    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
				    SetPlayerDrunkLevel (playerid, 10000);
				    PlayerInfo[playerid][pPiwo] += 1;
    				SendClientMessage(playerid, COLOR_WHITE, "Barman: Mam nadzieje �e nie b�dziesz tego pi�, gdy� denaturat do tego nie s�u�y.");
				 	ZabierzKase(playerid, 2);
	    			PlayerDrunk[playerid] += 2;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 2; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 2.0); }
					}
				}
				else if(strcmp(x_nr,"jabol",true) == 0)
				{
					if(PlayerInfo[playerid][pAge] < 17)
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Barman: Musisz by� pe�noletni aby pi� alkohole.");
					    return 1;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
					SetPlayerDrunkLevel (playerid, 3000);
					PlayerInfo[playerid][pPiwo] += 1;
				    ZabierzKase(playerid, 2);
				    PlayerDrunk[playerid] += 1;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 6; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 6.0); }
					}
				}
				else if(strcmp(x_nr,"twojastara",true) == 0)
				{
				    if(PlayerInfo[playerid][pAge] < 18)
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Barman: Musisz by� pe�noletni aby pi� swoj� star�.");
					    return 1;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
					SetPlayerDrunkLevel (playerid, 50000);
				    ZabierzKase(playerid, 100);
				    PlayerDrunk[playerid] += 5;
					if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Pijany", 3500, 1); }
					if(health < 100)
					{
					    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 100; SetPlayerHealth(playerid, health + hp); }
						else { SetPlayerHealth(playerid, health + 100.0); }
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_WHITE, "Barman: Nie znam tego napoju.");
				    return 1;
				}
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* %s pije %s.", sendername ,x_nr);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz ju� wi�cej wypi�, jeste� pijany !");
                return 1;
            }
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w barze !");
            return 1;
        }
    }
    return 1;
}

//end
