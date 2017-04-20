enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;
end = false;
timeLeft = 0;
nearSupply = false;
inSpawn = true;

friendlyKillPenalty = 12;
suicidePenalty = 10;
kScoreEarned = 5;
kScoreDelay = 20;


flagASide = independent;
flagBSide = independent;
flagCSide = independent;

flagAText = "\A3\Data_F\Flags\Flag_white_CO.paa";
flagBText = "\A3\Data_F\Flags\Flag_white_CO.paa";
flagCText = "\A3\Data_F\Flags\Flag_white_CO.paa";

fnc_hasCaptured = compile preprocessFileLineNumbers "fnc_hasCaptured.sqf";
fnc_HUDUpdate = compile preprocessFileLineNumbers "hud_update.sqf";
//[] call compile preprocessFileLineNumbers "hud_create.sqf";


execVM "hud_create.sqf";
execVM "spawnProtection.sqf";
execVM "isNearSupply.sqf";
execVM "flagScore.sqf";
execVM "flagMarkers.sqf";
execVM "maintainRating.sqf";
execVM "texturesUpdate.sqf";
execVM "TeamGear.sqf";
execVM "TeamVehicles.sqf";
execVM "timer.sqf";

{
	_x setFlagSide sideFriendly;
} forEach flags + [baseOpfor,baseBlufor];

A addAction ["Iza tu bandera",{call fnc_hasCaptured},"",7,true,true,"","flagASide != side _this",4,false];
B addAction ["Iza tu bandera",{call fnc_hasCaptured},"",7,true,true,"","flagBSide != side _this",4,false];
C addAction ["Iza tu bandera",{call fnc_hasCaptured},"",7,true,true,"","flagCSide != side _this",4,false];


["AmmoboxInit",[supplyOpfor,true,{side _this == EAST}]] spawn BIS_fnc_arsenal;
["AmmoboxInit",[supplyBlufor,true,{side _this == WEST}]] spawn BIS_fnc_arsenal;

if (isServer) then {
	onPlayerConnected {
		_owner publicVariableClient "timeLeft";
		_owner publicVariableClient "end";
		
		_owner publicVariableClient "flagASide";
		_owner publicVariableClient "flagBSide";
		_owner publicVariableClient "flagCSide";
		
		_owner publicVariableClient "flagAText";
		_owner publicVariableClient "flagBText";
		_owner publicVariableClient "flagCText";
		
		_owner publicVariableClient "scoreOpfor";
		_owner publicVariableClient "scoreBlufor";
	};
};

/*
if (isServer) then {
	sleep 0.1;
	flagASide = EAST;
	"SA" setMarkerColor "colorOPFOR";
	flagAText = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
};
*/


waitUntil {!isNull player};

["teleportHandler", "onMapSingleClick", {
	if (_alt) then {
		player setPosATL _pos;
	};
}] call BIS_fnc_addStackedEventHandler;