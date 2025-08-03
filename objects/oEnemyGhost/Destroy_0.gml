if (global.PlayerHP < 100) {
    global.PlayerHP += 5;
    if (global.PlayerHP > 100) {
        global.PlayerHP = 100;
    }
}