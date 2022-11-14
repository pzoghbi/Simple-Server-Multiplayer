/// @description 

if invincibility return 0;
if (player_state == "move"){
	player_health -= 1;
	if (player_health>0){
		invincibility = 100;
	} 
}