if (!visible) exit

if (keyboard_check_pressed(vk_right))
{
    current_pages[0] = min(current_pages[0] + 2, array_length(pages) + 2);
    current_pages[1] = min(current_pages[1] + 2, array_length(pages) + 3);
}

if (keyboard_check_pressed(vk_left))
{
    current_pages[0] = max(current_pages[0] - 2, -3);
    current_pages[1] = max(current_pages[1] - 2, -2);
}
