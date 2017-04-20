_maxTime = 3600;
timeLeft = _maxTime + 15;
winnerTeam = "";


waitUntil {!isNull player};

while {!end} do
{
	sleep 0.5;
	if (isServer) then {
		timeLeft = timeLeft - 0.5;
		publicVariable "timeLeft";
		if (timeLeft < 0 && scoreBlufor != scoreOpfor) then {
			end = true;
			publicVariable "end";
		};
		if (timeLeft < 0 && scoreBlufor == scoreOpfor) then {
			timeLeft = timeLeft + 61;
			publicVariable "timeLeft";
			"¡Las puntuaciones están igualadas! \n¡Añadido 1 minuto de tiempo extra!" remoteExec ["hint",0];
		};
	};
	_displayString = timeLeft;
	
	[_displayString] call fnc_HUDUpdate;
};

if (isServer) then {
	if (scoreOpfor > scoreBlufor) then{
		winnerTeam = "OPFOR";
		publicVariable "winnerTeam";
	}
	else {
		winnerTeam = "BLUFOR";
		publicVariable "winnerTeam";
	};

	format ["FIN DEL JUEGO \nEl equipo ganador es: %1", _winnerTeam] remoteExec ["hint",0];
};

sleep 10;

if (side group Player == _winnerTeam) then {
	["end1",true,3,true,true] call BIS_fnc_endMission;
}
else {
	["end2",false,3,true,true] call BIS_fnc_endMission;
};