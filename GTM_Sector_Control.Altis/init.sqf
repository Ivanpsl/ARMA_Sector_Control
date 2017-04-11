enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;
end = false;


fnc_hasCaptured = compile preprocessFileLineNumbers "fnc_hasCaptured.sqf";

sidePlayer = side player;

execVM "spawnProtection.sqf";
execVM "flagScore.sqf";
execVM "flagMarkers.sqf";
execVM "timer.sqf";

[] call compile preprocessFileLineNumbers "hud_create.sqf";

fnc_HUDUpdate = compile preprocessFileLineNumbers "hud_update.sqf";


{
	_x setFlagSide independent;
	_x setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa";
} forEach flags;


{
	_x addAction ["Hoist your flag",{call fnc_hasCaptured},nil,0,true,true,"","flagSide _target != playerSide _this",4,false];
} forEach flags;