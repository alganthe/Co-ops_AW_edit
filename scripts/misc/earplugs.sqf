/*
* Author: MykeyRM [AW]
* Add earplugs
*
* Arguments:
*
* Return Value:
* Nothing
*/
if (!isNil "MEP_KD") then {
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", MEP_KD];
};

_PlugsTakenHint  = "<t color='#ff9d00' size='1.3' shadow='1' shadowColor='#000000' align='center'>*** Earplugs Recieved ***  </t>";   //Item taken hint.

_howtoHint = "<t  size='1' shadow='1' shadowColor='#000000' align='center'>   [Pause/Break] key to Insert and Remove </t>";          //Instructions hint.

hint parseText (_PlugsTakenHint + _howtoHint);

PlugsIN = 2;//Add keybind to player [Pause/Break] key - US keyboard.
MEP_KD = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 197) then {
    switch (PlugsIN) do {
        case 1: { PlugsIN = 2; 2 fadeSound 1; player groupChat 'EARPLUGS REMOVED'; };
        case 2: { PlugsIN = 1; 2 fadeSound 0.2; player groupChat 'EARPLUGS FITTED';  };
        default { };
    };
}"];
