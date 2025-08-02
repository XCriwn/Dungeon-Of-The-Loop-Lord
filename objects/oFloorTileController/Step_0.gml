if(global.floor_level == 1){

	if(step_countdown <= 0)  {createEnemies("goblin", 1); step_countdown = max_step_countdown;}
	else step_countdown--;

}

