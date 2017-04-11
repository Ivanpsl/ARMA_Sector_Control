_maxTime = 3600;
timeLeft = _maxTime + 1;
_winnerTeam = "";

while {!end} do
{
	timeLeft = timeLeft - 1;
	sleep 1;
	if (timeLeft < 0 && scoreBlufor != scoreOpfor) then {
		end = true;
	};
	if (timeLeft < 0 && scoreBlufor == scoreOpfor) then {
		timeLeft = timeLeft + 61;
		"Teams scores are equal! \nAdded 1 minute of extra time!" remoteExec ["hint",0];
	};
	_displayString = timeLeft;
	
	[_displayString] call fnc_HUDUpdate;
};

if (scoreOpfor > scoreBlufor) then{
	_winnerTeam = "OPFOR";
}
else {
	_winnerTeam = "BLUFOR";
};

format ["GAME OVER\nThe winner team is %1", _winnerTeam] remoteExec ["hint",0];
sleep 10;

["end1",true,3,true,true] call BIS_fnc_endMission;