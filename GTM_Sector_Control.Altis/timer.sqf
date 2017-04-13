_maxTime = 3600;
timeLeft = _maxTime + 1;
winnerTeam = "";

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
			"Teams scores are equal! \nAdded 1 minute of extra time!" remoteExec ["hint",0];
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

	format ["GAME OVER\nThe winner team is %1", _winnerTeam] remoteExec ["hint",0];
};

sleep 10;

if (side Player == _winnerTeam) then {
	["end1",true,3,true,true] call BIS_fnc_endMission;
}
else {
	["end2",false,3,true,true] call BIS_fnc_endMission;
};