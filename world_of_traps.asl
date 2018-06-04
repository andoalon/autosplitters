state("World of Traps")
{
	uint level_id : 0x0001CA44, 0x40;
	int lives : 0x000103F8, 0x4;
	
	// I'm not sure why but if I remove
	// the 0 offset from the variable below
	// it is not correct.
	// The amount of frames that have elapsed
	// since the beginning of the game
	// (gets paused if the game is paused)
	int frame_counter : 0x000111F8, 0x0;
	
	float player_pos_x : 0x00028C88, 0x28;
	float player_pos_y : 0x00028C88, 0x2C;
}

init
{
	// world 0 level 0 = Main Menu
	int world = 0;
	int level = 0;
}

update
{
	print("level_id = " + current.level_id);
	//print("lives = " + current.lives);
	//print("frame_counter = " + current.frame_counter);
	print("player_pos = {" + current.player_pos_x + ", " + current.player_pos_y + "}");
}

start
{
	// level_id 0 = Main menu
	if(old.level_id == 0 && current.level_id == 11)
	{
		vars.world = 1;
		vars.level = 1;
		
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
	if(old.level_id == 11 && current.level_id == 13)
	{
		vars.world = 1;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 13 && current.level_id == 14)
	{
		vars.world = 1;
		vars.level = 3;
		
		return true;
	}
	
	if(old.level_id == 14 && current.level_id == 15)
	{
		vars.world = 1;
		vars.level = 4;
		
		return true;
	}
	
	if(old.level_id == 15 && current.level_id == 20)
	{
		vars.world = 1;
		vars.level = 5;
		
		return true;
	}
	
	if(old.level_id == 20 && current.level_id == 21)
	{
		vars.world = 2;
		vars.level = 1;
		
		return true;
	}
	
	if(old.level_id == 21 && current.level_id == 23)
	{
		vars.world = 2;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 23 && current.level_id == 24)
	{
		vars.world = 2;
		vars.level = 3;
		
		return true;
	}
	
	if(old.level_id == 24 && current.level_id == 25)
	{
		vars.world = 2;
		vars.level = 4;
		
		return true;
	}
	
	if(old.level_id == 25 && current.level_id == 30)
	{
		vars.world = 2;
		vars.level = 5;
		
		return true;
	}
	
	if(old.level_id == 30 && current.level_id == 31)
	{
		vars.world = 3;
		vars.level = 1;
		
		return true;
	}
	
	if(old.level_id == 31 && current.level_id == 33)
	{
		vars.world = 3;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 33 && current.level_id == 34)
	{
		vars.world = 3;
		vars.level = 3;
		
		return true;
	}
	
	if(old.level_id == 34 && current.level_id == 71)
	{
		vars.world = 3;
		vars.level = 4;
		
		return true;
	}
	
	if(old.level_id == 71 && current.level_id == 70)
	{
		// "Easiest Level in Game" (last level copy)"
		vars.world = 0;
		vars.level = 1;
		
		return true;
	}
	
	if(old.level_id == 70 && current.level_id == 35)
	{
		// "That Level was Easy" (first level copy -- restart troll)"
		vars.world = 0;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 35 && current.level_id == 40)
	{
		vars.world = 3;
		vars.level = 5;
		
		return true;
	}
	
	if(old.level_id == 40 && current.level_id == 41)
	{
		vars.world = 4;
		vars.level = 1;
		
		return true;
	}
	
	if(old.level_id == 41 && current.level_id == 43)
	{
		vars.world = 4;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 43 && current.level_id == 44)
	{
		vars.world = 4;
		vars.level = 3;
		
		return true;
	}
	
	if(old.level_id == 44 && current.level_id == 45)
	{
		vars.world = 4;
		vars.level = 4;
		
		return true;
	}
	
	if(old.level_id == 45 && current.level_id == 50)
	{
		vars.world = 4;
		vars.level = 5;
		
		return true;
	}
	
	if(old.level_id == 50 && current.level_id == 51)
	{
		vars.world = 5;
		vars.level = 1;
		
		return true;
	}
	
	if(old.level_id == 51 && current.level_id == 53)
	{
		vars.world = 5;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 53 && current.level_id == 54)
	{
		vars.world = 5;
		vars.level = 3;
		
		return true;
	}
	
	if(old.level_id == 54 && current.level_id == 55)
	{
		vars.world = 5;
		vars.level = 4;
		
		return true;
	}
	
	if(old.level_id == 55 && current.level_id == 60)
	{
		vars.world = 5;
		vars.level = 5;
		
		return true;
	}
	
	if(old.level_id == 60 && current.level_id == 61)
	{
		vars.world = 6;
		vars.level = 1;
		
		return true;
	}
	
	if(old.level_id == 61 && current.level_id == 63)
	{
		vars.world = 6;
		vars.level = 2;
		
		return true;
	}
	
	if(old.level_id == 63 && current.level_id == 64)
	{
		vars.world = 6;
		vars.level = 3;
		
		return true;
	}
	
	if(old.level_id == 64 && current.level_id == 65)
	{
		vars.world = 6;
		vars.level = 4;
		
		return true;
	}
	
	if(old.level_id == 65 && current.level_id == 73)
	{
		// Final level
		vars.world = 6;
		vars.level = 5;
		
		return true;
	}
	
	// Need a way to detect the user is
	// in the credit screen, as it is display
	// in the same game level (same level_id)
	
	// Check if the position of the player is close enough
	// to the position of the 'finish' tile in the last level
	if (current.level_id == 73) // Final level
	{
		const float world_6_5_finish_pos_x = 75.0f;
		const float world_6_5_finish_pos_y = 135.0f;
		
		const float tile_size = 30.0f;
		
		// Might need to tweak this value to avoid false positives
		const float collided_distance_epsilon = tile_size * 1.4f;
		const float collided_distance_epsilon_square = collided_distance_epsilon * collided_distance_epsilon;
		
		
		float distance_x = current.player_pos_x - world_6_5_finish_pos_x;
		float distance_y = current.player_pos_y - world_6_5_finish_pos_y;
		
		float total_distance_square = distance_x * distance_x + distance_y * distance_y;
		
		//print("Distance = " + Math.Sqrt(total_distance_square) + ", Epsilon = " + Math.Sqrt(collided_distance_epsilon_square));
		
		if (total_distance_square < collided_distance_epsilon_square)
		{
			print("Collided with finish tile at position = { " + current.player_pos_x + ", " + current.player_pos_y + "}, at Distance = " + Math.Sqrt(total_distance_square) + ", Epsilon = " + Math.Sqrt(collided_distance_epsilon_square));
			
			return true;
		}
	}
}

reset
{
	// level_id 0 = Main menu
	if(current.level_id == 0)
	{
		vars.world = 0;
		vars.level = 0;
		
		return true;
	}
}
