/// @description Show what mode is active. You can draw anything instead.
if (line_active)
{
    draw_text (x, y, string_hash_to_newline("Line"));
}
else
{
    draw_text (x, y, string_hash_to_newline("Node"));
}

