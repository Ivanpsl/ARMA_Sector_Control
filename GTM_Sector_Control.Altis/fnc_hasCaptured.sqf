_target = _this select 0;
_caller = _this select 1;


//_target setFlagSide (side _caller);
if (_target == A) then {
	flagASide = (side _caller);
	publicVariable "flagASide";
};
if (_target == B) then {
	flagBSide = (side _caller);
	publicVariable "flagBSide";
};
if (_target == C) then {
	flagCSide = (side _caller);
	publicVariable "flagCSide";
};

sleep 1;
_target setFlagTexture "";
publicVariable "_target";
sleep 1;


if (side _caller == EAST) then {
	_target setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
	publicVariable "_target";
	sleep 1;
	format ["OPFOR now controls %1",str _target] remoteExec ["hint",0];
	if (_target == A) then {
		"SA" setMarkerColor "colorOPFOR";
	};
	if (_target == B) then {
		"SB" setMarkerColor "colorOPFOR";
	};
	if (_target == C) then {
		"SC" setMarkerColor "colorOPFOR";
	};
};
if (side _caller == WEST) then {
	_target setFlagTexture "\A3\Data_F\Flags\Flag_nato_CO.paa";
	publicVariable "_target";
	sleep 1;
	format ["BLUFOR now controls %1",str _target] remoteExec ["hint",0];
	if (_target == A) then {
		"SA" setMarkerColor "colorBLUFOR";
	};
	if (_target == B) then {
		"SB" setMarkerColor "colorBLUFOR";
	};
	if (_target == C) then {
		"SC" setMarkerColor "colorBLUFOR";
	};
};