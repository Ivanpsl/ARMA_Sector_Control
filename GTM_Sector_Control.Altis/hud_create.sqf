//PENDIENTE DE MODIFICAR

private ["_ui", "_timer", "_mission", "_scoreW", "_scoreE"];
nearSupply = true;


while {true} do {
	disableSerialization;
	cutRsc ["DTASHUD","PLAIN"];
	_ui = uiNamespace getVariable "DTASHUD";

	_timer = _ui displayCtrl 1001;
	_mission = _ui displayCtrl 1002;
	_flagAInfo =_ui displayCtrl 1011;
	_flagBInfo =_ui displayCtrl 1012;
	_flagCInfo =_ui displayCtrl 1013;
	_scoreW = _ui displayCtrl 1101;
	_scoreE = _ui displayCtrl 1102;

	{_x ctrlShow true} forEach [_timer, _mission, _scoreW, _scoreE];

	_mission ctrlSetBackgroundColor [if (side Player == WEST) then {0} else {1}, 0, if (side Player == WEST) then {1} else {0}, 0.3];
	waitUntil {nearSupply};
	waitUntil {!nearSupply};
};