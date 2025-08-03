if(waitTime <= 0) {
	z_key = keyboard_check(vk_enter) or keyboard_check(ord("Z"));

	if(z_key) {game_end()}
}
else waitTime--;



