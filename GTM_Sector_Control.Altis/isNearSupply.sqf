
_x = player;
while {true} do
{
	if ((_x distance supplyOpfor < 5 && side _x == EAST) || (_x distance supplyBlufor < 5 && side _x == WEST)) then {
		nearSupply = true;
		}
	else {
		nearSupply = false;
	};
	sleep 1;
}