private [_target,_caller];

_target setFlagSide (side _caller);

sleep 1;
_target setFlagTexture "";
sleep 2;


if (side _caller == EAST) then {
	_target setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
	sleep 1;
	""OPFOR now controls %1",_target" remoteExec ["hint",-2];
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
	sleep 1;
	""BLUFOR now controls %1",_target" remoteExec ["hint",-2];
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