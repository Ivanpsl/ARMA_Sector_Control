//PENDIENTE DE MODIFICAR


private ["_missionText", "_ui", "_timeText"];


_timeText = _this select 0;

_zeromin = "";
_zeroseg = "";


disableSerialization;


//MOSTRANDO TIEMPO 

_minutos = floor (timeLeft / 60);
_segundos =  floor (timeLeft mod 60);


_ui = uiNamespace getVariable "DTASHUD";

if (_segundos < 10) then {
	_zeroseg = "0";
}
else {
	_zeroseg = "";
};

if (_minutos < 10) then {
	_zeromin = "0";
}
else {
	_zeromin = "";
};

if (timeLeft <= 0) then
	{
		_segundos = "0";
		_minutos = "0";
		_zeromin = "0";
		_zeroseg = "0";
	};
	
	
_timeText= format ["%4%1:%3%2",_minutos, _segundos , _zeroseg, _zeromin];

//Actualizamos hud de banderas:
//A
if(flagSide A == EAST)then
{
	(_ui displayCtrl 1011) ctrlSetBackgroundColor [1,0,0,0.6];
};
if (flagSide A == WEST) then
{
	(_ui displayCtrl 1011) ctrlSetBackgroundColor [0,0,1,0.6];
};
//B
if(flagSide B == EAST)then
{
	(_ui displayCtrl 1012) ctrlSetBackgroundColor [1,0,0,0.6];
};
if (flagSide B == WEST) then
{
	(_ui displayCtrl 1012) ctrlSetBackgroundColor [0,0,1,0.6];
};
//C
if(flagSide C == EAST)then
{
	(_ui displayCtrl 1013) ctrlSetBackgroundColor [1,0,0,0.6];
};
if (flagSide C == WEST) then
{
	(_ui displayCtrl 1013) ctrlSetBackgroundColor [0,0,1,0.6];
};

(_ui displayCtrl 1001) ctrlSetText _timeText;


(_ui displayCtrl 1002) ctrlSetText "¿?";

(_ui displayCtrl 1101) ctrlSetText str scoreBlufor;
(_ui displayCtrl 1102) ctrlSetText str scoreOpfor;