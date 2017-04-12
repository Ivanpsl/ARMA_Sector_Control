_flagAText2 = "";
_flagBText2 = "";
_flagCText2 = "";

while {true} do {

	if (_flagAText2 != flagAText) then {
		A setFlagTexture flagAText;
		_flagAText2 = flagAText;
	};
	if (_flagBText2 != flagBText) then {
		B setFlagTexture flagBText;
		_flagBText2 = flagBText;
	};
	if (_flagCText2 != flagCText) then {
		C setFlagTexture flagCText;
		_flagCText2 = flagCText;
	};
	
	waitUntil {_flagAText2 != flagAText || _flagBText2 != flagBText || _flagCText2 != flagCText};
};