//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ komenda ]-----------------------------------------------//
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
// Autor: Mrucznik
// Data utworzenia: 2019-4-28

// Opis:
/*

*/


// Notatki skryptera:
/*
	
*/

YCMD:komenda(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Komenda s�u�y do wy�wietlania informacji o innych komendach.");
        return 1;
    }

    //command body
    if (isnull(params))
    {
        sendTipMessage(playerid, "U�yj: /komenda [nazwa komendy, o kt�rej chcesz dowiedzie� si� wi�cej]");
    }
    else
    {
        Command_ReProcess(playerid, params, true);
    }
    return 1;
}