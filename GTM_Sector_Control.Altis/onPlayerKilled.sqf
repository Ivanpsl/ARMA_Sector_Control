
_friendlyKillPenalty = 3;
_suicidePenalty = 2;
_kScoreDelay = 0; //15


if (!end) then {
	_casualty = _this select 0;
	_killer = _this select 1;

	if (timeLeft <= _kScoreDelay) then {
		sleep (timeLeft - 0.1);
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
	publicVariable "scoreOpfor";
	publicVariable "scoreBlufor";
};