
waitUntil {!isNull player};
_initialPosition = getPos player;

while {!readyBlufor || !readyOpfor} do
{
		_x = player;
		if !((_x distance baseOpfor < safeDistance && side _x == EAST) || (_x distance baseBlufor < safeDistance && side _x == WEST)) then {
			_x setPos _initialPosition;
			hint "La partida aún no ha comenzado";
		};
};

sleep 0.1;

hint "¡EMPIEZA EL JUEGO!";