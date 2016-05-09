params ["_dragger", "_dragged", "_state"];

_state = toUpper _state;
if !(_state in ["DRAGGING", "CARRYING", "VEHICLE"]) exitWith {};

switch (_state) do {
    case "DRAGGING": {

        detach _dragged;

        if (alive _dragger && {isNull objectParent _dragged}) then {
            [_dragged, "acts_injuredlyingrifle02_180"] call derp_fnc_syncAnim;
        };

        if (alive _dragger && {isNull objectParent _dragger}) then {
            _dragger playAction "released";
        };

        _dragger setVariable ["derp_revive_isDragging", false, true];
        _dragged setVariable ["derp_revive_isDragged", false, true];
    };

    case "CARRYING": {
        detach _dragged;

        if (alive _dragger && {isNull objectParent _dragged}) then {
            [_dragged, "acts_injuredlyingrifle02_180"] call derp_fnc_syncAnim;
        };

        if (alive _dragger && {isNull objectParent _dragger}) then {
            _dragger playMove "";
        };

        _dragger setVariable ["derp_revive_isCarrying", false, true];
        _dragged setVariable ["derp_revive_isCarried", false, true];
    };

    case "VEHICLE": {
        detach _dragged;

        if (alive _dragger && {isNull objectParent _dragger}) then {
            _dragger playMove "";
        };

        _dragged moveInCargo cursorObject;

        _dragger setVariable ["derp_revive_isCarrying", false, true];
        _dragged setVariable ["derp_revive_isCarried", false, true];
        _dragger setVariable ["derp_revive_isDragging", false, true];
        _dragged setVariable ["derp_revive_isDragged", false, true];
    };
};