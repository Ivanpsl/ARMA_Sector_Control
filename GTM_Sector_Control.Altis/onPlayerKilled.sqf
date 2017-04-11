_friendlyKillPenalty = 0;
_suicidePenalty = 0;
_kScoreDelay = 15;


_casualty = _this select 0;
_killer = _this select 1;

if (!end) then {
	if (timeLeft <= _kScoreDelay) then {
		sleep (timeLeft - 1);
	}
	else {
		sleep _kScoreDelay;
	};
	
	if (side _casualty == side _killer && name _casualty != name _killer) then
	{
		if (side _casualty == EAST) then
		{
			scoreOpfor = scoreOpfor - _friendlyKillPenalty;
		};
		if (side _casualty == WEST) then
		{
			scoreBlufor = scoreBlufor - _friendlyKillPenalty;
		};
	}
	else
	{
		if (side _casualty == EAST && (side _killer != WEST || name _casualty == name _killer)) then
		{
			scoreOpfor = scoreOpfor - _suicidePenalty;
		};
		if (side _casualty == WEST && (side _killer != EAST || name _casualty == name _killer)) then
		{
			scoreBlufor = scoreBlufor - _suicidePenalty;
		};
	};

	if ((side _casualty == EAST) && (side _killer == WEST)) then
	{
		scoreBlufor = scoreBlufor + 1;
		scoreOpfor = scoreOpfor - 1;
	};
	if ((side _casualty == WEST) && (side _killer == EAST)) then
	{
		scoreBlufor = scoreBlufor - 1;
		scoreOpfor = scoreOpfor + 1;
	};
};