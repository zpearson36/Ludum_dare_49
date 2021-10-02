/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case PLAYER_STATE.IDLE:
	{
		sprite_index = sSlime_Idle
		if(global.move_right)
		{
			state = PLAYER_STATE.WALKING;
			image_xscale = 1;
			xspd = SLIMESPEED
			break;
		}
		if(global.move_left)
		{
			state = PLAYER_STATE.WALKING;
			image_xscale = -1
			xspd = -SLIMESPEED
			break;
		}
		if(global.move_down)
		{
			state = PLAYER_STATE.CROUCHING
		    sprite_index = sSlime_Crouch
			break;
		}
		break;
	}
	case PLAYER_STATE.WALKING:
	{
		if(!global.move_right and !global.move_left)
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		if(global.move_down)
		{
			state = PLAYER_STATE.CROUCHEDWALKING
			break;
		}
		sprite_index = sSlime_Walk
		x += xspd
		break;
	}
	case PLAYER_STATE.CROUCHING:
	{
		show_debug_message(image_index)
		if(image_index >= 3)
		{
			state = PLAYER_STATE.CROUCHED
		}
		break;
	}
	case PLAYER_STATE.CROUCHED:
	{
		sprite_index = sSlime_Crouched
		if(global.move_down)
		{
			if(global.move_right)
			{
				state = PLAYER_STATE.CROUCHEDWALKING;
				image_xscale = 1;
				xspd = SLIMESPEED
				break;
			}
			if(global.move_left)
			{
				state = PLAYER_STATE.CROUCHEDWALKING;
				image_xscale = -1
				xspd = -SLIMESPEED
				break;
			}
		}
		else
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		break;
	}
	case PLAYER_STATE.CROUCHEDWALKING:
	{
		if(global.move_down)
		{
			if(!global.move_right and !global.move_left)
			{
				state = PLAYER_STATE.CROUCH
				xspd = 0
				break;
			}
			if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
			{
				state = PLAYER_STATE.CROUCH
				xspd = 0
				break;
			}
		}
		else
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		sprite_index = sSlime_CrouchWalk
		x += xspd
		break;
	}
	
}