if (isServer) then {
	createMarker ["BO", baseOpfor];
	"BO" setMarkerType "hd_flag";
	"BO" setMarkerColor "colorOPFOR";
	"BO" setMarkerText "Base Opfor";

	createMarker ["BB", baseBlufor];
	"BB" setMarkerType "hd_flag";
	"BB" setMarkerColor "colorBLUFOR";
	"BB" setMarkerText "Base Blufor";

	createMarker ["SA", A];
	"SA" setMarkerType "hd_objective";
	"SA" setMarkerText "Sector A";

	createMarker ["SB", B];
	"SB" setMarkerType "hd_objective";
	"SB" setMarkerText "Sector B";

	createMarker ["SC", C];
	"SC" setMarkerType "hd_objective";
	"SC" setMarkerText "Sector C";

	"respawn_west" setMarkerType "Empty";
	"respawn_east" setMarkerType "Empty";
	"respawn_vehicle_west" setMarkerType "Empty";
	"respawn_vehicle_east" setMarkerType "Empty";
};

/*
sleep 0.5;

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