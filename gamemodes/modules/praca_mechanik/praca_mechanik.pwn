//-----------------------------------------------<< Source >>------------------------------------------------//
//                                               praca_mechanik                                              //
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
// Data utworzenia: 31.03.2024
//Opis:
/*
	Praca Mechanika.
*/

//

//-----------------<[ Funkcje: ]>-------------------
IsAtWarsztat(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		if(IsPlayerInRangeOfPoint(playerid, 100.0, 2806.7097,-1562.5802,10.9219))
		{//Warsztat w bazie mechanik�w
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 40.0, -5233.5000, 1407.7000, 7.6)) 
		{ // Sunshine Autos Vice City
			return 1;
		}
		if(PlayerInfo[playerid][pLocal] == LOCAL_PAY_N_SPRAY)
		{ // Interiory Pay'N'Spray
			return 1;
		}
		
		if(IsPlayerInRangeOfPoint(playerid, 18.0, 1788.2085,-1694.2456,13.1814) || IsPlayerInRangeOfPoint(playerid, 18.0, 1779.0632,-1693.1831,13.1608) || IsPlayerInRangeOfPoint(playerid, 18.0, 1805.4418,-1713.5634,13.5176))
		{//Warsztat czerwony
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 40.0, 2333.7273,-1241.2806,22.0628))
		{//warsztat niebieski
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 20.0, 644.3516,-503.4102,15.8941))
		{//warsztat dillmore
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 30.0, 1017.75, -1353.33, 13.3825))
		{//warsztat przy p1czkarni
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 50.0, 1099.7108,-1240.7935,15.8203)) 
		{ // WARSZTAT NA MARKET XD
			return 1;
		}
	}
	return 0;
}

TuneCommands_CheckRequirements(playerid, giveplayerid, cost)
{
	if(PlayerInfo[playerid][pJob] != 7)
    {
        MruMessageFail(playerid, "Nie jeste� mechanikiem lub pracownikiem warsztatu.");
        return 0;
    }

    if(!IsAtWarsztat(playerid)) 
    {
        MruMessageFail(playerid, "Nie jeste� w warsztacie, w kt�rym mo�na prowadzi� tuning lub w bazie mechanik�w.");
        return 0;
    }

    if(GetDistanceBetweenPlayers(playerid, giveplayerid) > 8)
    {
        MruMessageFail(playerid, "Gracz jest za daleko.");
        return 0;
    }

    if(!IsPlayerInAnyVehicle(giveplayerid))
    {
        MruMessageFail(playerid, "Gracz nie jest w poje�dzie.");
        return 0;
    }

    new vehicleID = GetPlayerVehicleID(giveplayerid);
    if(!IsCarOwner(giveplayerid, vehicleID))
    {
        MruMessageFail(playerid, "Ten pojazd nie nale�y do tego gracza.");
        return 0;
    }

    if(kaska[playerid] < cost)
    {
        MruMessageFailF(playerid, "Nie masz wystarczaj�cej ilo�ci pieni�dzy (%d$)", cost);
        return 0;
    }
	return 1;
}

//end