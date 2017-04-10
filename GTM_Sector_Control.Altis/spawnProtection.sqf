// Make players invulnerable in base
	
while {true} do
{
	{
		if (_x distance baseOpfor < 20 && side _x == EAST) then {
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		}
		else {
			_x allowDamage (_x getVariable ["playerAllowDamage", true]);
		};
		
		if (_x distance baseBlufor < 20 && side _x == WEST) then {
			_x allowDamage (_x getVariable ["playerAllowDamage", false]);
		}
		else {
			_x allowDamage (_x getVariable ["playerAllowDamage", true]);
		};
		
	} forEach allUnits;
	sleep 1;
};