
if (isServer) then {
_flagTime = 1; //20

	while {!end} do
	{
		sleep _flagTime;
		{
			if (_x == EAST) then
			{
				scoreOpfor = scoreOpfor + 1;
			};
			if (_x == WEST) then
			{
				scoreBlufor = scoreBlufor + 1;
			};
		} foreach flagSides;
		
		publicVariable "scoreOpfor";
		publicVariable "scoreBlufor";
	};
};