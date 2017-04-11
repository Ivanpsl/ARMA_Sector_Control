// Make players invulnerable in base

_safeDistance = 30;

_x = player;
while {true} do
{
	//{
		if ((_x distance baseOpfor < _safeDistance && side _x == EAST) || (_x distance baseBlufor < _safeDistance && side _x == WEST)) then {
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		}
		else {
			_x allowDamage (_x getVariable ["playerAllowDamage", true]);
		};
		
	//} forEach allUnits;
	sleep 1;
};