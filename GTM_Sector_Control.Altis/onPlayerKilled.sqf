_friendlyKillPenalty = 0;
_suicidePenalty = 0;


_casualty = this select 0;
_killer = this select 1;

if (side _casualty == side _killer) then
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
	if (side _casualty == EAST && side _killer != WEST) then
	{
		scoreOpfor = scoreOpfor - _suicidePenalty;
	};
	if (side _casualty == WEST && side _killer != EAST) then
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