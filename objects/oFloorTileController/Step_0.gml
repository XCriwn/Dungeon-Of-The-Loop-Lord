if(global.floor_level == 1){

	if(step_countdown <= 0)  {createEnemies("goblin", 1); step_countdown = max_step_countdown;}
	else step_countdown--;

}

if(global.floor_level == 2){

	if(step_countdown <= 0)  {createEnemies("Ghost", 1); step_countdown = max_step_countdown;}
	else step_countdown--;

}
if(global.floor_level == 3){

	if(step_countdown <= 0)  {createEnemies("Pawn", 1); step_countdown = max_step_countdown;}
	else step_countdown--;

}


