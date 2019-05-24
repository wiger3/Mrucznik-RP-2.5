//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   admin                                                   //
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
// Autor: 2.5
// Data utworzenia: 04.05.2019
//Opis:
/*
	System administracji.

	Zawiera komendy administratora, wywo�ywania listy administrator�w, funkcje administrator�w, 
	przydzielanie administratora, zabezpieczenia. Cz�� komend zosta�a przepisana na nowo, natomiast cz�� 
	oczekuje dalej na przepisanie. P�ki co zosta�a oddzielona od komendy.pwn i otrzyma�a sw�j w�asny plik.
	
	Funkcje:
		> AJPlayerTXD - TXD show za AJ
		> BanPlayerTXD - TXD show za Bana
		> KickPlayerTXD - TXD show za kica
		> WarnPlayerTXD - TXD show za warna
		> BlockPlayerTXD - TXD show za blocka
		>
	
	Komendy:
		> Admins - lista administrator�w na s�u�bie
		> karytxd - kary w txd
		> check - sprawdza statystyki gracza (showstats) 
		> nonewbie - odpala/gasi chat newbie
		> dn & up - teleportuje gracza w g�r�/d�
		> usunpozar - usuwa po�ar z mapy
		> losowypozar - losowo startuje po�ar
		> unblock - unblokowuje gracza o nicku (%s)
		> gotobiz - teleportuje do biznesu o ID
		> resetsejfhasla - resetuje has�a w domach (sejfy)
		> zapiszdomy - zapisuje domy
		> zapiszkonta - zapisuje konta graczy 
		> ann - gametex for all (3) 
		> setname - ustawia graczowi o ID name (%s) 
		> spec & unspec - podgl�da gracza (kamera)
		> block - nadaje blocka dla gracza 
		> pblock - nadaje blocka offline
		> pban - nadaje bana offline
		> pwarn - nadaje warna offline
		> paj - nadaje AdminJail'a offline
		> sblock - cichy block
		> ip - sprawdza ip gracza o ID
		> czyjtonumer - sprawdza czyj to numer
		> flip - obraca pojazd do g�ry ko�ami :) 
		> snn  - text for all
		> cca & cc - czy�ci chat dla wszystkich 
		> hpall - nadaje HP dla ka�dego
		> killall - zabija ka�dego
		> podglad - ustala podgl�d dla gracza o ID
		> antybh - ustawienia antyBH
		> undemorgan - uwalnia gracza o ID z wi�zeienia
		> zaraz  zara�a gracza chorob�
		> kill - zabija gracza o ID
		> setwiek - ustala wiek dla gracza o ID
		> setjob -  ustala graczowi o ID prac� X
		> setslot - ustala liczb� slot�w dla gracza o ID
		> pojazdygracza - sprawdza pojazdy gracza o ID
		> checkcar - sprawdza do kogo nale�y pojazd X
		> checkcars - sprawdza auta gracza (GUI)
		> setcar - ustawia auto Y na slot X
		> setwl - ustawia graczowi o ID WL X
		> setskin - ustawia graczowi o ID skin X
		> naprawskin - naprawia graczowi o ID skin X
		> rozwiedz - rozwodzi gracza o ID
		> dskill - ustala skill dla broni
		> dnobiekt - obni�a obiekt (?)
		> dsus - ustawia graczowi o ID WL X
		> jump - podrzuca gracza
		> sh
		> carjump - podrzuca auto
		> ksam - w��cza podgl�d miejsca (jako kamera) 
		> fdaj - ustala styl dla gracza o ID
		> dajdowozu - teleportuje gracza o ID do wozu X
		> sprawdzinv - nwm
		> sprawdzin - sprawdza pozycje gracza (on foot, in car [..]) 
		> getposp - pobiera koordynaty gracza o ID
		> zniszczobiekty - usuwa wszystkie obiekty z serwera
		> stworzobiekty - tworzy obiekty
		> respawn - powoduje odliczanie do respawnu pojaz�w (20s)
		> dajdzwiek - odpala d�wi�k dla gracza o ID
		> crimereport - report crime's
		> respp - respawnuje gracza o ID
		> respcar - respawnuje pojazd o ID
		> zdejmijbpk - zdejmuje blokad� pisania na chaty frakcyjne dla gracza o ID
		> dpa - degraduje p� admina
		> BP - nadaje blokad� pisania dla gracza o ID na czas X
		> kickallex - kickuje wszystkich graczy
		> setmats - ustawia materia�y dla gracza o ID
		> reloadbans - prze�adowuje plik z banami
		> koxubankot - nadaje administratora X dla gracza o ID
		> setcarint - ustawia pojazdowi interior (taki jaki ma obecnie gracz)
		> setcarvw - ustawia pojazdowi VirtualWorld (taki jaki ma obecnie gracz)
		> panel - panel KS
		> msgbox - wy�wietla MSG box
		> gotoczit - teleportuje na miejsce zbrodni 
		> anulujzp - anuluje zabranie prawa jazdy dla gracza o ID
		> bwsettings - odpala ustawienia BW
		> bwtime - ustala BW time
		> addcar - dodaje pojazd na map� o podanym ID
		> removecar - usuwa pojazd z mapy o podanym ID
		> setac - ustawia anty-cheat'a
		> supportduty - s�u�ba supportera
		> ticket - teleportuje do /zapytaj
		> ticketend - przywraca star� pozycj�
		> stworz - tworzy organizacje, pojazd, rang� (wymaga uprawnie�)
		> edytuj - edytuje pojazd, organizacje, rang� (wymaga uprawnie�)
		> delete3dtext - usuwa 3dtext (nie sprawdzone)
		> deleteobject - usuwa obiekt (nie sprawdzone) 
		> scena - stawia scen�
		> scenaallow - pozwala stawia� scen� graczowi o ID
		> scenadisallow - zabiera pozwolenie dla gracza o ID do stawiania sceny
		> zrobkolejke - tworzy kolejk� 
		> gotoadmin - teleportuje na wysp� admin�w
		> gotomechy - teleportuje do mechanik�w
		> gotostacja - teleportuje na stacje paliw idle
		> rapidfly - w��cza tryb latania dla gracza
		> removeganglimit
		> removezoneprotect
		> gangzone
		> zonedelay - usuwa strefe
		> clearzone - czy�ci stref�
		> setzonecontrol - ustawia kontrol� nad stref� dla... 
		> unbw - zdejmuje BW graczowi o ID
		> cziterzy - pokazuje liste os�b, kt�re AC uzna� za cziter�w 
		> checkprawko - sprawdza czy gracz ma prawo jazdy
		> restart - restartuje serwera
		> wczytajskrypt - wczytuje FS'a 
		> setmistrz - mianuje gracza o ID mistrzem bokserskim 
		> togadminmess - wy��cza wszelkie komunikaty admina
		> mole - wysy�a smsa jako marcepan
		> zg - wysy�a wiadomo�� na chacie zaufanych
		> logout - wylogowuje gracza
		> logoutpl - wylogowuje gracza o ID
		> logoutall - wylogowuje wszystkich graczy
		> cnn - wysy�a wszystkim gametext
		> cnnn - wysy�a wszystkim gametext (2)
		> demorgan - wi�zi gracza o ID
		> unaj - usuwa adminjail dla gracza o ID
		> AJ - nadaje adminjaila dla gracza o ID
		> jail - nadaje jaila dla gracza o ID (UWAGA CZAS NIELIMITOWANY!) 
		> tod - ustawia dla wszystkich godzin� X
		> startlotto - startuje lotto 
		> setstat - ustawia graczowi o ID statystyki 
		> clearwlall - czy�ci wszystkim wanted level
		> setint - nadaje graczowi o ID interior X
		> setvw - nadaje graczowi o ID virtualworld X
		> getvw - pobiera od gracza o ID virtualworld i wy�wietla adminowi
		> getint - pobiera od gracza o ID interior i wy�wietla adminowi
		> skydive - teleportuje gracza o ID w kosmos (XD)
		> dajpomocnika - nadaje p� administratora (1-3) dla gracza o ID
		> dajskryptera - nadaje skryptera dla gracza o ID
		> dajzaufanego - nadaje zaufanego dla gracza o ID
		> makeircadmin - nadaje administratora chatu IRC dla gracza o ID
		> forceskin - wymusza otworzenie wybiera�ki, gdy gracz o ID jest we frakcji
		> dajlideraorg - nadaje lidera organizacji (rodziny) dla gracza o ID X
		> makemember - nadaje stopie� [0] graczowi o ID we frakcji X
		> zabierzlideraorg - zabiera lidera organizacji (rodziny) dla gracza o ID
		> makeleader - daje graczowi o ID lidera frakcji o ID X
		> makewomanleader- daje graczowi o ID �e�skiego lidera frakcji o ID X
		> setteam - ustala "team" graczowi (raczej ju� nie u�ywane) - s� dwa cop, civilian. 
		> gotopos - teleportuje nas do pozycji X,Y,Z
		> gotols - teleportuje pod komisariat LS
		> gotolv - teleportuje pod lotnisko LV
		> gotosf - teleportuje pod dworzec san fierro
		> gotoszpital - teleportuje pod szpital w LS
		> gotosalon - teleportuje pod salon aut w LS
		> entercar - wsadza nas do wozu o ID
		> gotocar - teleportuje do auta o ID
		> mark - ustawia markera
		> gotomark - teleportuje do markera (kt�rego wcze�niej ustawili�my poprzez CMD:mark) 
		> gotojet - teleportuje na odrzutowiec
		> gotostad - teleportuje na stadion
		> gotoin - teleportuje w .. co�
		> goto - teleportuje nas do gracza X
		> gotoint - teleportuje nas do interioru X
		> tp - teleportuje gracza X do gracza Y
		> GetHere - teleportuje gracza o ID do nas
		> Getcar - teleportuje auto o ID do nas
		> tankujauto - tankuje pojedy�czy samoch�d (w kt�rym siedzimy)
		> tankujauta - tankuje samochody
		> givegun - daje graczowi o ID bro� o ID z amunicj� o warto�ci X
		> sethp - ustawia graczowi o ID podan� warto�� HP
		> setarmor - ustawia graczowi o ID podan� warto�� armour 
		> fixveh - naprawia auto
		> fixallveh - naprawia wszystkim graczom auto
		> pogodaall - ustawia podan� pogod� dla wszystkich graczy
		> money - resetuje graczowi o ID kas� do 0 i ustawia podan� warto��
		> dajkase - daje graczowi o ID kas� X
		> carslots - resetuje graczu sloty na [4] domy�lne
		> slap - daje klapsa w dupsko dla gracza o ID 
		> mute - ucisza gracza o ID
		> setplocal - ustawia pLOCAL dla gracza o ID
		> glosowanie - tworzy g�osowanie na X temat na Y czas
		> freeze - zamra�a gracza o ID
		> unfreeze - odmra�a gracza o ID
		> warn - nadaje ostrze�enie graczowi o ID
		> unwarn - zdejmuje ostrze�enie graczowi o ID
		> skick - kickuje (cichy kick) gracza o ID
		> sban - banuje (ukryty ban) gracza o ID
		> ban - banuje gracza o ID
		> kick - kickuje gracza o ID
		> banip - banuje gracza o ID
	Timery:
		> Brak
		
	Funkcje
		>IsAHeadAdmin
		>IsAScripter
*/

//

//-----------------<[ Callbacki: ]>-------------------
//-----------------<[ Funkcje: ]>-------------------
IsAHeadAdmin(playerid)
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		return 1;
	}
	return 0;
}
IsAScripter(playerid)
{
	if(PlayerInfo[playerid][pNewAP] != 5)
	{
		return 1;
	}
	return 0;
}
SendMessageToAdmin(text[], mColor)//Wysy�a wiadomo�� do administratora na s�u�bie
{
	foreach(new i : Player)
	{
		if(GetPlayerAdminDutyStatus(i) == 1)
		{
			new stradm[256];
			format(stradm, sizeof(stradm), "AdmCmd: %s", text);
			SendClientMessage(i, mColor, stradm);
		}
	}
	return 1;
}
KickPlayerTXD(playerid, adminid, reason[])
{
    //PlayerLogged[playerid]=0;
    new str[128];
    format(str, sizeof(str), "~r~Kick~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", GetNick(playerid), GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
    return 1;
}
AJPlayerTXD(playerid, adminid, reason[])
{
	new str[256];
    format(str, sizeof(str), "~r~AdminJail~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", GetNick(playerid), GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
BPPlayerTXD(playerid, adminid, timeVal, reason[])
{
	new str[256];
    format(str, sizeof(str), "~r~Blokada Pisania~w~~n~Dla: %s~n~Od: %s~n~Na: %d godzin~n~~y~Powod: ~w~%s", GetNick(playerid), GetNick(adminid), timeVal, reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
BanPlayerTXD(playerid, adminid, reason[])
{
	new str[128];
    format(str, sizeof(str), "~r~Ban~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", GetNick(playerid), GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}

	return 1;
}
WarnPlayerTXD(playerid, adminid, reason[])
{
	new str[128];
    format(str, sizeof(str), "~r~Warn~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", GetNick(playerid), GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
BlockPlayerTXD(playerid, adminid, reason[])
{
	new str[128];
    format(str, sizeof(str), "~r~Block~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", GetNick(playerid), GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
PWarnPlayerTXD(player[], adminid, result[])
{
	new str[128];
	new nickDoWarna[MAX_PLAYER_NAME]; 
	strcat(nickDoWarna, player); 
    format(str, sizeof(str), "~r~Warn Offline~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", nickDoWarna, GetNick(adminid), result);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
GivePWarnForPlayer(player[], adminid, result[]) 
{
	new nickDoWarna[MAX_PLAYER_NAME];
	strcat(nickDoWarna, player); 
	new string[256];
	format(string, sizeof(string), "AdmCmd: Konto gracza OFFLINE %s zostalo zwarnowane przez %s, Powod: %s", nickDoWarna, GetNick(adminid), (result));
	Log(warnLog, INFO, string);
	MruMySQL_SetAccInt("Warnings", nickDoWarna, MruMySQL_GetAccInt("Warnings", nickDoWarna)+1);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscWarn[adminid] = iloscWarn[adminid]+1;
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		sendErrorMessage(adminid, "Nie jeste� podczas s�u�by administratora, Warn nie zostaje zaliczony!"); 
	}
	return 1;
}
GiveWarnForPlayer(playerid, adminid, result[])
{
	new str[256];
	new string[256];
	PlayerInfo[playerid][pWarns] += 1;
	if(PlayerInfo[playerid][pWarns] >= 3)
	{
		SendClientMessage(playerid, COLOR_NEWS, "Sprawd� czy otrzymana kara jest zgodna z list� kar i zasad, znajdziesz j� na www.Mrucznik-RP.pl");
		format(string, sizeof(string), "AdmCmd: %s zosta� zbanowany przez Admina %s (3 warny), pow�d: %s", GetNick(playerid), GetNick(adminid), (result));
		Log(banLog, INFO, string);
		if(GetPlayerAdminDutyStatus(adminid) == 1)
		{
			iloscBan[adminid]++; 
		}
		//adminowe logi
		format(str, sizeof(str), "Admini/%s.ini", GetNick(adminid));
		dini_IntSet(str, "Ilosc_Warnow", dini_Int(str, "Ilosc_Warnow")+1 );
		MruMySQL_Banuj(playerid, result, adminid);
		KickEx(playerid);
		return 1;	
	}
	format(str, sizeof(str), "Dosta�e� warna od %s, pow�d: %s", GetNick(adminid), (result));
	SendClientMessage(playerid, COLOR_LIGHTRED, str);
	format(string, sizeof(string), "AdmCmd: %s zosta� zwarnowany przez Admina %s, pow�d: %s", GetNick(playerid), GetNick(adminid), (result));
	Log(warnLog, INFO, string);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	KickEx(playerid);
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscWarn[adminid] = iloscWarn[adminid]+1;
	}
	return 1;
}
PBlockPlayerTXD(player[], adminid, reason[])
{
	new str[128];
	new nickOdbieracza[MAX_PLAYER_NAME];
	strcat(nickOdbieracza, player); 
    format(str, sizeof(str), "~r~Block Offline~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", nickOdbieracza, GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
PBanPlayerTXD(player[], adminid, reason[])
{
	new str[128];
	new nickOdbieracza[MAX_PLAYER_NAME];
	strcat(nickOdbieracza, player); 
    format(str, sizeof(str), "~r~Ban Offline~w~~n~Dla: %s~n~Od: %s~n~~y~Powod: ~w~%s", nickOdbieracza, GetNick(adminid), reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
PAJPlayerTXD(player[], adminid, timeVal, reason[])
{
	new nickOdbieracza[MAX_PLAYER_NAME];
	strcat(nickOdbieracza, player); 
	new str[128];
    format(str, sizeof(str), "~r~AJ Offline~w~~n~Dla: %s~n~Od: %s~n~Na %d~n~~y~Powod: ~w~%s", nickOdbieracza, GetNick(adminid), timeVal, reason);
    TextDrawSetString(Kary, str);
    TextDrawShowForAll(Kary);
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		if(togADMTXD[i] == 1)
		{
			TextDrawHideForPlayer(i, Kary); 
		}
	}
	return 1;
}
SetPlayerPAdminJail(player[], adminid, timeVal, result[])
{
	new nickOdbieracza[MAX_PLAYER_NAME];
	strcat(nickOdbieracza, player); 
	new string[256];
	format(string, sizeof(string), "AdmCmd: Konto gracza offline %s dosta�o aj na %d od %s, Powod: %s", nickOdbieracza, timeVal, GetNick(adminid), (result));
	Log(kickLog, INFO, string);
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscAJ[adminid] = iloscAJ[adminid]+1;
	
	}
	MruMySQL_SetAccInt("Jailed", nickOdbieracza, 3);
	MruMySQL_SetAccInt("JailTime", nickOdbieracza, timeVal*60);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	return 1;
}
SetPlayerAdminJail(playerid, adminid, timeVal, result[])
{
	new string[256];
	format(string, sizeof(string), "* Zosta�e� uwieziony w Admin Jailu przez Admina %s, Czas: %d. Powod: %s", GetNick(adminid), timeVal, (result));
	SendClientMessage(playerid, COLOR_LIGHTRED, string);
	PlayerInfo[playerid][pJailed] = 3;
	PlayerInfo[playerid][pJailTime] = timeVal*60;
	SetPlayerVirtualWorld(playerid, 1000+playerid);
	PlayerInfo[playerid][pMuted] = 1;
	SetPlayerPosEx(playerid, 1481.1666259766,-1790.2204589844,156.7875213623);
	poscig[playerid] = 0;
	format(string, sizeof(string), "%s zostal uwieziony w AJ przez %s na %d powod: %s", GetNick(playerid), GetNick(adminid), timeVal, (result)); 
	Log(kickLog, INFO, string);
	if(GetPlayerAdminDutyStatus(playerid) == 1)
	{
		iloscAJ[playerid] = iloscAJ[playerid]+1;
	}
	//adminowe logi
	format(string, sizeof(string), "Admini/%s.ini", GetNick(adminid));
	dini_IntSet(string, "Ilosc_AJ", dini_Int(string, "Ilosc_AJ")+1 );
	SendClientMessage(playerid, COLOR_NEWS, "Sprawd� czy otrzymana kara jest zgodna z list� kar i zasad, znajdziesz j� na www.Mrucznik-RP.pl");
	Wchodzenie(playerid);		
	return 1;
}
GiveKickForPlayer(playerid, adminid, result[])
{
	new string[256];
	SendClientMessage(playerid, COLOR_NEWS, "Sprawd� czy otrzymana kara jest zgodna z list� kar i zasad, znajdziesz j� na www.Mrucznik-RP.pl");
	format(string, sizeof(string), "AdmCmd: Admin %s zkickowa� %s, Pow�d: %s", GetNick(adminid), GetNick(playerid), (result));
	Log(kickLog, INFO, string);
	//adminduty
	if(GetPlayerAdminDutyStatus(playerid) == 1)
	{
		iloscKick[playerid] = iloscKick[playerid]+1;
	}

	format(string, sizeof(string), "Admini/%s.ini", GetNick(adminid));
	dini_IntSet(string, "Ilosc_Kickow", dini_Int(string, "Ilosc_Kickow")+1 );
	KickEx(playerid);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	return 1;
}
GiveBPForPlayer(playerid, adminid, timeVal, result[])
{
	new string[256];
	PlayerInfo[playerid][pBP] = timeVal;
	SendClientMessage(playerid, COLOR_NEWS, "Sprawd� czy otrzymana kara jest zgodna z list� kar i zasad, znajdziesz j� na www.Mrucznik-RP.pl");
	format(string, sizeof(string), "AdmCmd: %s dostal BP od %s na %d godzin, z powodem %s", GetNick(playerid), GetNick(adminid), timeVal, result);
	Log(kickLog, INFO, string);
	//opis
	//Opis_Usun(giveplayerid);
	Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, "");
	PlayerInfo[playerid][pDesc][0] = EOS;
	return 1;
}
GiveBlockForPlayer(playerid, adminid, result[])
{
	new string[256];
	new nickDoBlocka[MAX_PLAYER_NAME];
	strcat(nickDoBlocka, GetNick(playerid)); 
	format(string, sizeof(string), "AdmCmd: Konto gracza %s zostalo zablokowane przez %s, Powod: %s", GetNick(playerid), GetNick(adminid), (result));
	Log(banLog, INFO, string);
	PlayerInfo[playerid][pBlock] = 1;
	KickEx(playerid);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	MruMySQL_Blockuj(nickDoBlocka, adminid, (result));
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscBan[adminid] = iloscBan[adminid]+1;
	}
	return 1;
}
GivePBanForPlayer(player[], adminid, result[])
{
	new nickDoBlocka[MAX_PLAYER_NAME];
	strcat(nickDoBlocka, player);
	new string[256];
	format(string, sizeof(string), "AdmCmd: Konto gracza OFFLINE %s zostalo zbanowane przez %s, Powod: %s ", nickDoBlocka, GetNick(adminid), (result));
	Log(banLog, INFO, string);
	MruMySQL_BanujOffline(nickDoBlocka, result, adminid);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscBan[adminid] = iloscBan[adminid]+1;
	}
	return 1;
}	
GivePBlockForPlayer(player[], adminid, result[])
{
	new string[256];
	new nickDoBlocka[MAX_PLAYER_NAME];
	strcat(nickDoBlocka, player); 
	format(string, sizeof(string), "AdmCmd: Konto gracza OFFLINE %s zostalo zablokowane przez %s, Powod: %s", player, GetNick(adminid), (result));
	Log(banLog, INFO, string);
	MruMySQL_Blockuj(nickDoBlocka, adminid, (result));
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscBan[adminid] = iloscBan[adminid]+1;
	}

	return 1;
}


//-----------------<[ Timery: ]>-------------------

forward StopDraw();
public StopDraw()
{
	TextDrawHideForAll(Kary); 
	KillTimer(karaTimer);
	return 1;
}


//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end