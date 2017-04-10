enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;


fnc_hasCaptured = compile preprocessFileLineNumbers "fnc_hasCaptured.sqf";

execVM "spawnProtection.sqf";
execVM "flagScore.sqf";
execVM "flagMarkers.sqf";

{
	_x setFlagSide independent;
	_x setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa";
} forEach flags;


{
"" remoteExec ["_x addAction ["Hoist your flag",{[_x,_this] call {fnc_hasCaptured}},"",0,true,true,"",(flagSide _x != side _this),-1,false,""]",-2];
} forEach flags;