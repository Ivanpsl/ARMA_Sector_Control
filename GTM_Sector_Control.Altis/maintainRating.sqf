//Evitar que el jugador cambie de bando por fuego amigo:

while {true} do {
	waitUntil {rating player < 0};
	player addRating (-1*(rating player));
};