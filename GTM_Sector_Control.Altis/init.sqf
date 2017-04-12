enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;
end = false;
timeLeft = 0;


flagASide = independent;
flagBSide = independent;
flagCSide = independent;

flagSides = [flagASide,flagBSide,flagCSide];

/*
flagAText = "ind";
flagBText = "ind";
flagCText = "ind";
*/



waitUntil {!isNull player};

["teleportHandler", "onMapSingleClick", {
	if (_alt) then {
		player setPosATL _pos;
	};
}] call BIS_fnc_addStackedEventHandler;


fnc_hasCaptured = compile preprocessFileLineNumbers "fnc_hasCaptured.sqf";
fnc_HUDUpdate = compile preprocessFileLineNumbers "hud_update.sqf";
//[] call compile preprocessFileLineNumbers "hud_create.sqf";


execVM "hud_create.sqf";
execVM "spawnProtection.sqf";
execVM "flagScore.sqf";
execVM "flagMarkers.sqf";
execVM "maintainRating.sqf";
execVM "timer.sqf";


{
	_x setFlagSide independent;
	_x setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa";
	//_x addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagSide _target != side _this",4,false];
} forEach flags;

A addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagASide != side _this",4,false];
B addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagBSide != side _this",4,false];
C addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagCSide != side _this",4,false];

flagASide = EAST;

["AmmoboxInit",[supplyOpfor,true,{side _this == EAST}]] spawn BIS_fnc_arsenal;
["AmmoboxInit",[supplyBlufor,true,{side _this == WEST}]] spawn BIS_fnc_arsenal;

/*
while {true} do
{
	if (flagASide == "EAST") then {
		A setFlagSide independent
};
*/