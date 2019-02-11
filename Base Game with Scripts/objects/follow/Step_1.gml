//wrap
if x > room_width-global.roomborder x=global.roomborder
if y > room_height-global.roomborder y=global.roomborder
if y < global.roomborder y = room_height-global.roomborder
if x < global.roomborder x=room_width-global.roomborder


//some old and broken movement code of mine, it works well for demonstrations though, feel free to use it.
if keyboard_check(vk_left)
    {
    image_angle = image_angle + 5
    }
if keyboard_check(vk_right)
    {
    image_angle = image_angle - 5
    }

if speed < 20
    {
    speedmult = 0.5
    }
    
if speed > 20
    {
    speedmult = 0.2
    }
if keyboard_check(vk_up)
    {
    direction = image_angle + 90
    speed = speed + speedmult*((angle_difference(direction,image_angle)+1)/(abs(angle_difference(direction,image_angle)+1)))
    }
if keyboard_check(vk_down)
    {
    direction = direction
    speed = speed/1.1
    }
if keyboard_check(vk_down)+keyboard_check(vk_up) = 0
    {
    speed = speed/1.001
    }
    

if speed > 20
    {
    speed = speed -1
    }

