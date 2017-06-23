_maxTime = 3600;
_startDelay = 20;
timeLeft = _maxTime;

winnerTeam = "";
strwinnerTeam = "";

endTheMission = false;


waitUntil {!isNull player && time > _startDelay};
_previousTime = time;

while {!end} do
{
	uiSleep 0.25;
	if (isServer) then {
		//timeLeft = timeLeft -(time - _previousTime);
		timeLeft = timeLeft - 0.25;
		//_previousTime = time;
		publicVariable "timeLeft";
		if (timeLeft <= 0 && scoreBlufor != scoreOpfor) then {
			sleep 2;
			if (scoreBlufor != scoreOpfor) then {
				end = true;
				publicVariable "end";
			};
		};
		if (timeLeft <= 0.25 && scoreBlufor == scoreOpfor && !end) then {
			timeLeft = 120;
			publicVariable "timeLeft";
			"¡Las puntuaciones están igualadas! \n¡Añadidos 2 minutos de tiempo extra!" remoteExec ["hint",0];
		};
	};
	_displayString = timeLeft;
	
	[_displayString] call fnc_HUDUpdate;
};


if (isServer) then {
	if (scoreOpfor > scoreBlufor) then{
		winnerTeam = OPFOR;
		strWinnerTeam = "OPFOR";
	}
	else {
		winnerTeam = BLUFOR;
		strWinnerTeam = "BLUFOR";
	};
	
	publicVariable "winnerTeam";
	format ["FIN DEL JUEGO \nEl equipo ganador es: %1", strWinnerTeam] remoteExec ["hint",0];
	sleep 8;
	endTheMission = true;
	publicVariable "endTheMission";
};

waitUntil {endTheMission};

if (side group Player == winnerTeam) then {
	["end1",true,3,true,true] call BIS_fnc_endMission;
}
else {
	["end2",false,3,true,true] call BIS_fnc_endMission;
};