enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;
end = false;


fnc_hasCaptured = compile preprocessFileLineNumbers "fnc_hasCaptured.sqf";

execVM "spawnProtection.sqf";
execVM "flagScore.sqf";
execVM "flagMarkers.sqf";
execVM "timer.sqf";

{
	_x setFlagSide independent;
	_x setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa";
} forEach flags;


{
	_x addAction ["Hoist your flag",{call fnc_hasCaptured},nil,0,true,true,"","true",4,false];
	//player addAction [("<t color=""#FF4444"">" + "Open Virtual Arsenal" + "</t>"), {["Open", true] call BIS_fnc_arsenal}, true, 0, false, false];
	//player addAction ["Hint Hello!", {hint format ["Hello %1!", _this select 3]}, name player];
} forEach flags;


//_veh addAction [_x select 0, "classaction.sqf", [_x, WEST], 4, false, true, "", _cond];






//player addAction ["Hoist your flag", {fnc_hasCaptured}, nil, 0, true, true, "", {flagSide _x != side player}, 1, false, ""];