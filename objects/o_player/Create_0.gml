/// @description 

global.PlayerCount++;

move_keys = [false, false, false, false, false, false];
keys = [ord("D"), ord("W"), ord("A"), ord("S")];

move_speed = 128;
move_direction = 100;
last_direction = move_direction;
x_speed = 0;
y_speed = 0;

player_name="";

player_health = 3;
player_health_max = 3;
player_state = "move";
invincibility = 0;

shoot = false;

enum player_weapons {
	needle,
	shovel,
}
weapon = player_weapons.needle;