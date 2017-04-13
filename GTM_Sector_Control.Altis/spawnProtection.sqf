// Make players invulnerable in base

_safeDistance = 15;

while {true} do
{
		_x = player;
		if ((_x distance baseOpfor < _safeDistance && side _x == EAST) || (_x distance baseBlufor < _safeDistance && side _x == WEST)) then {
			inSpawn = true;
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		}
		else {
			inSpawn = false;
			_x allowDamage (_x getVariable ["playerAllowDamage", true]);
		};
		
	sleep 1;
};