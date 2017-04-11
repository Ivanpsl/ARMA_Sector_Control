//Evitar que el jugador cambie de bando por fuego amigo:

while {true} do {
	if (rating player < 0) then {
		player addRating (-1*(rating player));
	};
};