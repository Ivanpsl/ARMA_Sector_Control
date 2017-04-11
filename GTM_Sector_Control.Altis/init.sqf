enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;
end = false;

//Estado de las banderas {0=libre, 1=blufor, 2=opfor}

flagAStatus=0;
flagBStatus=0;
flagCStatus=0;

waitUntil {!isNull player};

["teleportHandler", "onMapSingleClick", {
	if (_alt) then {
		player setPosATL _pos;
	};
}] call BIS_fnc_addStackedEventHandler;


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
	_x addAction ["Hoist your flag",{call fnc_hasCaptured},"",0,true,true,"","flagSide _target != playerSide _this",4,false];
} forEach flags;

["AmmoboxInit",[supplyOpfor,true,'playerSide _this == str EAST']] spawn BIS_fnc_arsenal;
["AmmoboxInit",[supplyBlufor,true,'playerSide _this == str WEST']] spawn BIS_fnc_arsenal;