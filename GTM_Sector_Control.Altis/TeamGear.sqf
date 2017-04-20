_x = player;
_uniformx = "";
_headx = "";

if (side _x == west) then {
	while {true} do
	{
		if (not(uniform _x select [0,4] == "U_B_")) then {
			removeUniform _x;
			_x addUniform "U_B_CombatUniform_mcam";
			hint "Uniforme prohibido para este bando";
		};
		
		if (headgear _x select [0,9] == "H_HelmetO" || headgear _x select [0,13] == "H_HelmetSpecO" || headgear _x select [0,15] == "H_HelmetLeaderO") then {
			removeHeadgear _x;
			hint "Casco prohibido para este bando";
		};
		
		_uniformx = uniform _x;
		_headx = headgear _x;
		waitUntil {_uniformx != uniform _x || _headx != headgear _x};
	};
};

if (side _x == east) then {
	while {true} do
	{
		if (not(uniform _x select [0,4] == "U_O_") || "U_O_PilotCoveralls" == uniform _x) then {
			removeUniform _x;
			_x addUniform "U_O_CombatUniform_ocamo";
			hint "Uniforme prohibido para este bando";
		};
		
		if (headgear _x select [0,9] == "H_HelmetB" || headgear _x select [0,13] == "H_HelmetSpecB") then {
			removeHeadgear _x;
			hint "Casco prohibido para este bando";
		};
		
		_uniformx = uniform _x;
		_headx = headgear _x;
		waitUntil {_uniformx != uniform _x || _headx != headgear _x};
	};
};