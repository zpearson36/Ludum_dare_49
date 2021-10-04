/// @description Insert description here
// You can write your code in this editor
c_color = c_yellow
takeoverable = collision_circle(x, y, SMOKEWIDTH / 2, oTakeoverable, false, false)
if(takeoverable != noone)
{
	c_color = c_lime
}


if(!collision_rectangle(x + (sign(xspd) * (SMOKEWIDTH / 2)), y - (SMOKEWIDTH / 2),
		                x + (sign(xspd) * (SMOKEWIDTH / 2)), y + (SMOKEWIDTH / 2),
						oBarrier, false, false)
   and
   !collision_rectangle(x - (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2),
		                x + (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2),
						oBarrier, false, false)
  )
{
   just_created = false
}
xspd_offset = sin(coef * pi) / 5
yspd_offset = cos(2 * coef * pi) / 5
coef += .01
if(coef >= 2) coef = 0