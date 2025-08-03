
if (global.PlayerHP < 100) {
    global.PlayerHP += 10;
    if (global.PlayerHP > 100) {
        global.PlayerHP = 100;
    }
}