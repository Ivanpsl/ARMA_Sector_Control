enableSaving [false, false];

flags = [A,B,C];
scoreBlufor = 0;
scoreOpfor = 0;
end = false;
timeLeft = 0;


flagASide = independent;
flagBSide = independent;
flagCSide = independent;

flagAText = "\A3\Data_F\Flags\Flag_white_CO.paa";
flagBText = "\A3\Data_F\Flags\Flag_white_CO.paa";
flagCText = "\A3\Data_F\Flags\Flag_white_CO.paa";


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
execVM "texturesUpdate.sqf";
execVM "timer.sqf";

{
	_x setFlagSide (side Player);
	//_x setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa";
	//_x addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagSide _target != side _this",4,false];
} forEach flags;

A addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagASide != side _this",4,false];
B addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagBSide != side _this",4,false];
C addAction ["Hoist your flag",{call fnc_hasCaptured},"",7,true,true,"","flagCSide != side _this",4,false];


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
		
		/*
		if (flagASide == EAST) then {
			"SA" setMarkerColor "colorOPFOR";
		};
		if (flagASide == WEST) then {
			"SA" setMarkerColor "colorOPFOR";
		};

		if (flagBSide == EAST) then {
			"SB" setMarkerColor "colorOPFOR";
		};
		if (flagBSide == WEST) then {
			"SB" setMarkerColor "colorOPFOR";
		};

		if (flagCSide == EAST) then {
			"SC" setMarkerColor "colorOPFOR";
		};
		if (flagCSide == WEST) then {
			"SC" setMarkerColor "colorOPFOR";
		};
		*/
	};
};

if (isServer) then {
	sleep 0.1;
	flagASide = EAST;
	"SA" setMarkerColor "colorOPFOR";
	flagAText = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
};