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
command_fixallveh_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] < 1000)
        {
            noAccessMessage(playerid);
            return 1;
        }
        foreach(new i : Player)
        {
            if(IsPlayerInAnyVehicle(i))
            {
                new carID = GetPlayerVehicleID(i); 
                SetVehicleHealth(carID, 1000.0);
                RepairVehicle(carID);
                CarData[VehicleUID[carID][vUID]][c_HP] = 1000.0;
            }
        }
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			iloscInne[playerid] = iloscInne[playerid]+1;
		}
        new string[128];
        format(string, sizeof(string), "Admin %s naprawi� wszystkim graczom pojazdy", GetNickEx(playerid));
        SendClientMessageToAll(COLOR_LIGHTBLUE, string);
		Log(adminLog, INFO, "Admin %s u�y� /fixallveh", GetPlayerLogName(playerid));
    }
    return 1;
}

//end
