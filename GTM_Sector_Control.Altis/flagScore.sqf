_flagTime = 20;

while {!end} do
{
	sleep _flagTime;
	{
		if (flagSide _x == EAST) then
		{
			scoreOpfor = scoreOpfor + 1;
		};
		if (flagSide _x == WEST) then
		{
			scoreBlufor = scoreBlufor + 1;
		};
	} foreach flags;
};