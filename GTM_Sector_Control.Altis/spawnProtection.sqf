
safeDistance = 20;

while {true} do
{
		_x = player;
		if ((_x distance baseOpfor < safeDistance && side _x == EAST) || (_x distance baseBlufor < safeDistance && side _x == WEST)) then {
			inSpawn = true;
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		}
		else {
			inSpawn = false;
			_x allowDamage (_x getVariable ["playerAllowDamage", true]);
		};
		
		{
			if (_x distance baseBlufor < safeDistance*1.5) then {
				_x allowDamage (_x getVariable ["playerAllowDamage", false]);
			}
			else {
				_x allowDamage (_x getVariable ["playerAllowDamage", true]);
			};
		} forEach [w1,w2,w3];
		
		{
			if (_x distance baseOpfor < safeDistance*1.5) then {
				_x allowDamage (_x getVariable ["playerAllowDamage", false]);
			}
			else {
				_x allowDamage (_x getVariable ["playerAllowDamage", true]);
			};
		} forEach [e1,e2,e3];
		
		if (end) then {
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		};
		
	sleep 1;
};