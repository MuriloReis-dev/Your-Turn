if (global.game_state != GAME_STATE.MENU) exit;

#region Variáveis

var book_w = sprite_get_width(book_spr)
var book_h = sprite_get_height(book_spr)

var page_w = sprite_get_width(page_spr)
var page_h = sprite_get_height(page_spr)

#endregion

#region Fundo Escuro
draw_set_alpha(0.6);
draw_rectangle_colour(
	0,
	0,
	display_get_gui_width(),
	display_get_gui_height(),
	c_black,
	c_maroon,
	c_black,
	c_black,
	false);
draw_set_alpha(1);
#endregion

#region Capa e Contracapa

if (current_pages[1] <= -2)
{
	draw_sprite(book_spr, 0, x + (sprite_get_width(book_spr) / 2), y)
	exit
}
if (current_pages[0] >= array_length(pages) + 1)
{
	draw_sprite(book_spr, 2, x - (sprite_get_width(book_spr) / 2), y)
	exit
}

#endregion

#region Fundo do Livro
// aumenta espaço para páginas
var left_xscale = image_xscale + (current_pages[0] + 1) * (5 / (book_w / 2))
var right_xscale = image_xscale + (array_length(pages) - current_pages[1]) * (5 / (book_w / 2))

// Lado esquerdo
draw_sprite_part_ext(
	book_spr,
	1,
	0,
	0,
	book_w / 2,
	book_h,
	x - (book_w / 2) * left_xscale,
	y - (book_h / 2),
	left_xscale,
	image_yscale,
	image_blend,
	image_alpha
)

// Lado direito
draw_sprite_part_ext(
	book_spr,
	1,
	book_w / 2,
	0,
	book_w / 2,
	book_h,
	x,
	y - (book_h / 2),
	right_xscale,
	image_yscale,
	image_blend,
	image_alpha
)

#endregion

#region Páginas
// desenha o efeito de páginas anteriores na esquerda
for (var i = 0; i <= current_pages[0]; i++)
{
	draw_rectangle_colour(
		x - page_w - 4 * (i + 1),
		y - page_h / 2,
		x - page_w - 4 * i,
		//resolve pixel sobrando em caso de sprites com altura par
		page_h / 2 % 2 == 0 ? y - 1 + page_h / 2 : y + page_h / 2,
		#7F7C4C,
		#FFF899,
		#FFF899,
		#7F7C4C,
		false)
}

// desenha a página na esquerda
if (current_pages[0] >= 0)
	draw_sprite(page_spr, 0, x, y)

// desenha o efeito de próximas páginas na direita
for (var i = 0; i <= array_length(pages) - current_pages[1] - 1; i++)
{
	draw_rectangle_colour(
		x + page_w + 4 * i,
		y - page_h / 2,
		x + page_w + 4 * (i + 1),
		//resolve pixel sobrando em caso de sprites com altura par
		page_h / 2 % 2 == 0 ? y - 1 + page_h / 2 : y + page_h / 2,
		#FFF899,
		#7F7C4C,
		#7F7C4C,
		#FFF899,
		false)
}

// desenha a página na direita
if (current_pages[1] <= array_length(pages) - 1)
	draw_sprite(page_spr, 1, x + page_w, y)

#endregion

#region Conteúdo
draw_set_colour(c_black)

// Esquerda
if (current_pages[0] >= 0 && current_pages[0] <= array_length(pages) - 1)
{
	var txt_x = x - page_w + margin + padding
	var txt_y = y - page_h / 2 + margin + padding
	
	for (var i = 0; i < array_length(pages[current_pages[0]]); i++)
	{
		var el = pages[current_pages[0]][i]
		if (el.type == PAGE_EL_TYPE.TEXT)
		{
			draw_set_font(el.font)
			
			draw_text_ext(txt_x, txt_y, el.text, line_space, page_w - 2 * (margin + padding))
			
			// coloca o cursor abaixo do texto
			txt_y += string_height_ext(el.text, line_space, page_w - 2 * (margin + padding))
		}
		if (el.type == PAGE_EL_TYPE.IMAGE)
		{
			draw_sprite_stretched(el.image, 0, txt_x, txt_y, el.w, el.h)
			
			txt_y += el.h
		}
		
		//txt_y += font_get_size(draw_get_font()) / 2 // corrige espaçamento pelo tamanho da fonte
		
		// começa novo parágrafo
		if (el.lbreak) txt_y += paragraph_space - line_space
	}
	draw_text(txt_x, txt_y, current_pages[0])
}

// Direita
if (current_pages[1] >= 0 && current_pages[1] <= array_length(pages) - 1)
{
	var txt_x = x + margin + padding
	var txt_y = y - page_h / 2 + margin + padding
	
	for (var i = 0; i < array_length(pages[current_pages[1]]); i++)
	{
		var el = pages[current_pages[1]][i]
		if (el.type == PAGE_EL_TYPE.TEXT)
		{
			draw_set_font(el.font)
			
			draw_text_ext(txt_x, txt_y, el.text, line_space, page_w - 2 * (margin + padding))
			
			// coloca o cursor abaixo do texto
			txt_y += string_height_ext(el.text, line_space, page_w - 2 * (margin + padding))
		}
		if (el.type == PAGE_EL_TYPE.IMAGE)
		{
			draw_sprite_stretched(el.image, 0, txt_x, txt_y, el.w, el.h)
			
			txt_y += el.h
		}
		
		//txt_y += font_get_size(draw_get_font()) / 2 // corrige espaçamento pelo tamanho da fonte
		
		// começa novo parágrafo
		if (el.lbreak) txt_y += paragraph_space - line_space
	}
}

#endregion
