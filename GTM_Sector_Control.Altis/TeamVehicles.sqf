
if (side player == east) then {
	while {true} do
	{
		waitUntil {player in w1 or player in w2 or player in w3};
		moveOut player;
	};
};

if (side player == west) then {
	while {true} do
	{
		waitUntil {player in e1 or player in e2 or player in e3};
		moveOut player;
	};
};