
if (isServer) then {
_flagTime = 5; //20

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
		} forEach [flagASide,flagBSide,flagCSide];
	};
};