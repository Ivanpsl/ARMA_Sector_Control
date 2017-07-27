_maxTime = 3600; //3600
//_startDelay = 20;
timeLeft = _maxTime;

winnerTeam = "";
endTheMission = false;


//waitUntil {!isNull player && time > _startDelay};
waitUntil {readyBlufor && readyOpfor};

_previousTime = time;

while {!end} do
{
	sleep 0.5;
	if (isServer) then {
		timeLeft = timeLeft -(time - _previousTime);
		_previousTime = time;
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
		strWinnerTeam = "OPFOR";
		WinnerTeam = OPFOR;
	}
	else {
		strWinnerTeam = "BLUFOR";
		WinnerTeam = BLUFOR;
	};
	
	publicVariable "strWinnerTeam";
	publicVariable "WinnerTeam";
	format ["FIN DEL JUEGO \nEl equipo ganador es: %1", strWinnerTeam] remoteExec ["hint",0];
	sleep 10;
	endTheMission = true;
	publicVariable "endTheMission";
};

waitUntil {endTheMission};

if (side group Player == winnerTeam) then {
	endMission "END1";
}
else {
	endMission "LOSER";
};