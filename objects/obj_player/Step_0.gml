if (keyboard_check(ord("W")) || keyboard_check(vk_up)) { y -= 5; }
if (keyboard_check(ord("S")) || keyboard_check(vk_down)) { y += 5; }
if (keyboard_check(ord("A")) || keyboard_check(vk_left)) { x -= 5; }
if (keyboard_check(ord("D")) || keyboard_check(vk_right)) { x += 5; }
if (keyboard_check(vk_escape)) { game_end(); }