_maxTime = 3600;
timeLeft = _maxTime + 1;
_winnerTeam = "";

while {!end} do
{
	timeLeft = timeLeft - 1;
	if (isServer) then {
		if (timeLeft < 0 && scoreBlufor != scoreOpfor) then {
			end = true;
		};
		if (timeLeft < 0 && scoreBlufor == scoreOpfor) then {
			timeLeft = timeLeft + 61;
			"Teams scores are equal! \nAdded 1 minute of extra time!" remoteExec ["hint",0];
		};
		publicVariable "timeLeft";
		publicVariable "end";
		
		publicVariable "flagASide";
		publicVariable "flagBSide";
		publicVariable "flagCSide";
		
		publicVariable "flagAText";
		publicVariable "flagBText";
		publicVariable "flagCText";
	};
	_displayString = timeLeft;
	
	[_displayString] call fnc_HUDUpdate;
	sleep 1;
};

if (isServer) then {
	if (scoreOpfor > scoreBlufor) then{
		_winnerTeam = "OPFOR";
	}
	else {
		_winnerTeam = "BLUFOR";
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