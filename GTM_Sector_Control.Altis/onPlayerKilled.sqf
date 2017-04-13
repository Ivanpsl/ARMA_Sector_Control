
_friendlyKillPenalty = 12;
_suicidePenalty = 10;
_kScoreEarned = 5;
_kScoreDelay = 20;

if (!end) then {
	_casualty = _this select 0;
	_killer = _this select 1;

	if (timeLeft <= _kScoreDelay) then {
		sleep (timeLeft - 0.1);
	}
	else {
		sleep _kScoreDelay;
	};
	
	if (side group _casualty == side group _killer && _casualty != _killer) then
	{
		if (side group _casualty == EAST) then
		{
			scoreOpfor = scoreOpfor - _friendlyKillPenalty;
		};
		if (side group _casualty == WEST) then
		{
			scoreBlufor = scoreBlufor - _friendlyKillPenalty;
		};
	}
	else
	{
		if (_casualty == _killer) then
		{
			if (side group _casualty == EAST) then
			{
				scoreOpfor = scoreOpfor - _suicidePenalty;
			};
			if (side group _casualty == WEST) then
			{
				scoreBlufor = scoreBlufor - _suicidePenalty;
			};
		};
	};

	if ((side group _casualty == EAST) && (side group _killer == WEST)) then
	{
		scoreBlufor = scoreBlufor + _kScoreEarned;
		scoreOpfor = scoreOpfor - _kScoreEarned;
	};
	if ((side group _casualty == WEST) && (side group _killer == EAST)) then
	{
		scoreBlufor = scoreBlufor - _kScoreEarned;
		scoreOpfor = scoreOpfor + _kScoreEarned;
	};
	publicVariable "scoreOpfor";
	publicVariable "scoreBlufor";
};