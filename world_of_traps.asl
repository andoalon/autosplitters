state("World of Traps")
{
	uint level_id : 0x0001CA44, 0x40;
	//int lives : 0x000103F8, 0x4;
	
	// I'm not sure why but if I remove
	// the 0 offset from the variable below
	// it is not correct.
	// The amount of frames that have elapsed
	// since the beginning of the game
	// (gets paused if the game is paused)
	//int frame_counter : 0x000111F8, 0x0;
	
	float player_pos_x : 0x00028C88, 0x28;
	float player_pos_y : 0x00028C88, 0x2C;
}

startup
{
	print("World of Traps autosplitter by andoalon. Version: 1.1");
}

init
{
	vars.current_level_index = 0;

	vars.level_ids = new int[]{
		0, // Main menu
		11 /* 1-1 */, 13 /* 1-2 */, 14 /* 1-3 */, 15 /* 1-4 */, 20 /* 1-5 */,
		21 /* 2-1 */, 23 /* 2-2 */, 24 /* 2-3 */, 25 /* 2-4 */, 30 /* 2-5 */,
		31 /* 3-1 */, 33 /* 3-2 */, 34 /* 3-3 */, 71 /* 3-4 */, 70 /* "Easiest Level in Game" */, 35 /* "That Level was Easy" */, 40 /* 3-5 */,
		41 /* 4-1 */, 43 /* 4-2 */, 44 /* 4-3 */, 45 /* 4-4 */, 50 /* 4-5 */,
		51 /* 5-1 */, 53 /* 5-2 */, 54 /* 5-3 */, 55 /* 5-4 */, 60 /* 5-5 */,
		61 /* 6-1 */, 63 /* 6-2 */, 64 /* 6-3 */, 65 /* 6-4 */, 73 /* 6-5 */
	};
}

start
{
	const int main_menu_level_id = 0;
	const int level_1_1_id = 11;

	if(old.level_id == main_menu_level_id && current.level_id == level_1_1_id)
	{
		//print("[start]: current_level_index = " + vars.current_level_index);
		vars.current_level_index = 1;
		
		return true;
	}
}

split
{
	// I still don't have a way to tell if the player
	// went to the level selection menu and then goto
	// to the next level. At least they cannot go directly
	// to the last level as this script forces you to follow
	// the order
	int current_level_index = 0;
	
	if (vars.current_level_index < vars.level_ids.Length - 1)
	{
		if (current.level_id == vars.level_ids[vars.current_level_index + 1]
			 && old.level_id == vars.level_ids[vars.current_level_index])
		{
			//print("[split]: current_level_index = " + vars.current_level_index + " (and now +1)");

			++vars.current_level_index;
			return true;
		}
	}
	
	// Need a way to detect the user is
	// in the credit screen, as it is display
	// in the same game level (same level_id)
	
	// Check if the position of the player is close enough
	// to the position of the 'finish' tile in the last level
	if (current.level_id == 73) // Final level
	{
		const float level_6_5_finish_pos_x = 75.0f;
		const float level_6_5_finish_pos_y = 135.0f;
		
		const float tile_size = 30.0f;
		
		// Might need to tweak this value to avoid false positives
		const float collided_distance_epsilon = tile_size * 1.4f;
		const float collided_distance_epsilon_square = collided_distance_epsilon * collided_distance_epsilon;
		
		
		float distance_x = current.player_pos_x - level_6_5_finish_pos_x;
		float distance_y = current.player_pos_y - level_6_5_finish_pos_y;
		
		float total_distance_square = distance_x * distance_x + distance_y * distance_y;
		
		//print("Distance = " + Math.Sqrt(total_distance_square) + ", Epsilon = " + Math.Sqrt(collided_distance_epsilon_square));
		
		if (total_distance_square < collided_distance_epsilon_square)
		{
			//print("Collided with finish tile at position = { " + current.player_pos_x + ", " + current.player_pos_y + "}, at Distance = " + Math.Sqrt(total_distance_square) + ", Epsilon = " + Math.Sqrt(collided_distance_epsilon_square));
			
			return true;
		}
	}
}

reset
{
	const int main_menu_level_id = 0;

	if(current.level_id == main_menu_level_id)
	{		
		vars.current_level_index = 0;
		//print("[reset]: current_level_index = " + vars.current_level_index);

		return true;
	}
}
