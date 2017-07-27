_maxTime = 3600; //3600
//_startDelay = 20;
timeLeft = _maxTime;

winnerTeam = "";
endTheMission = false;


//waitUntil {!isNull player && time > _startDelay};
waitUntil {readyBlufor && readyOpfor};

//_previousTime = time;

while {!end} do
{
	uiSleep 0.25;
	if (isServer) then {
		//timeLeft = timeLeft -(time - _previousTime);
		timeLeft = timeLeft - 0.25;
		//_previousTime = time;
		publicVariable "timeLeft";
		if (timeLeft <= 0 && scoreBlufor != scoreOpfor) then {
			uiSleep 2;
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
		strWinnerTeam = "OPFOR";
		winnerTeam = OPFOR;
	}
	else {
		strWinnerTeam = "BLUFOR";
		winnerTeam = BLUFOR;
	};
	
	publicVariable "strWinnerTeam";
	publicVariable "WinnerTeam";
	format ["FIN DEL JUEGO \nEl equipo ganador es: %1", strWinnerTeam] remoteExec ["hint",0];
	sleep 8;
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