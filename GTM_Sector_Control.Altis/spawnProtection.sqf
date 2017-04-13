// Make players invulnerable in base

_safeDistance = 15;

_allVehiclesEast = [e1,e2,e3];
_allVehiclesWest = [w1,w2,w3];


while {true} do
{
		_x = player;
		if ((_x distance baseOpfor < _safeDistance && side _x == EAST) || (_x distance baseBlufor < _safeDistance && side _x == WEST)) then {
		//if (true) then {
			inSpawn = true;
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		}
		else {
			inSpawn = false;
			_x allowDamage (_x getVariable ["playerAllowDamage", true]);
		};
		
		{
			if (_x distance baseOpfor < (1.5 * _safeDistance)) then {
				_x allowDamage (_x getVariable ["playerAllowDamage", false]);
			}
			else {
				_x allowDamage (_x getVariable ["playerAllowDamage", true]);
			};
		} forEach _allVehiclesEast;
		
		{
			if (_x distance baseBlufor < (1.5 * _safeDistance)) then {
				_x allowDamage (_x getVariable ["playerAllowDamage", false]);
			}
			else {
				_x allowDamage (_x getVariable ["playerAllowDamage", true]);
			};
		} forEach _allVehiclesWest;
		
		
	sleep 1;
};