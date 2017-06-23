
if (!end && timeLeft > 0) then {
	_casualty = _this select 0;
	_killer = _this select 1;
	
	_sideGroupCasualty = side group _casualty;
	_sideGroupKiller = side group _killer;
	_nameCasualty = name _casualty;
	_nameKiller = name _killer;

	if (timeLeft <= 1.5*kScoreDelay) then {
		uiSleep (timeLeft + random (1.5));
	}
	else {
		sleep (random kScoreDelay + 0.5*kScoreDelay);
	};
	
	if (_sideGroupCasualty == _sideGroupKiller && _nameCasualty != _nameKiller) then
	{
		if (_sideGroupCasualty == EAST) then
		{
			scoreOpfor = scoreOpfor - friendlyKillPenalty;
		};
		if (_sideGroupCasualty == WEST) then
		{
			scoreBlufor = scoreBlufor - friendlyKillPenalty;
		};
	}
	else
	{
		if (_nameCasualty == _nameKiller) then
		{
			if (_sideGroupCasualty == EAST) then
			{
				scoreOpfor = scoreOpfor - suicidePenalty;
			};
			if (_sideGroupCasualty == WEST) then
			{
				scoreBlufor = scoreBlufor - suicidePenalty;
			};
		};
	};

	if ((_sideGroupCasualty == EAST) && (_sideGroupKiller == WEST)) then
	{
		scoreBlufor = scoreBlufor + kScoreEarned;
		scoreOpfor = scoreOpfor - kScoreEarned;
	};
	if ((_sideGroupCasualty == WEST) && (_sideGroupKiller == EAST)) then
	{
		scoreBlufor = scoreBlufor - kScoreEarned;
		scoreOpfor = scoreOpfor + kScoreEarned;
	};

	publicVariable "scoreOpfor";
	publicVariable "scoreBlufor";
};