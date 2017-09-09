/// scr_cancelKey();
if (gamepad_is_connected(0)) {
    return dashKey;
} else {
    return attackKey;
}
