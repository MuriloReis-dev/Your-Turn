#region Variáveis

var book_w = sprite_get_width(book_spr)
var book_h = sprite_get_height(book_spr)

var page_w = sprite_get_width(page_spr)
var page_h = sprite_get_height(page_spr)

#endregion

#region Fundo Escuro
draw_set_alpha(0.3);
draw_rectangle_colour(
	0,
	0,
	display_get_gui_width(),
	display_get_gui_height(),
	c_black,
	c_orange,
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

// executa para as páginas atuais
for (var i = 0; i < array_length(current_pages); i++)
{
	if (current_pages[i] >= 0 && current_pages[i] <= array_length(pages) - 1)
	{
		var page = pages[current_pages[i]]
		
		var txt_x = margin + padding
		var txt_y = margin + padding
		
		#region Desenha o título
		if (string_length(page.title) > 0)
		{
			draw_set_font(fnt_Title)
			
			txt_x = (page_w - string_width(page.title)) / 2
			
			draw_text(
				x + (page_w * (i - 1)) + txt_x,
				y - page_h / 2 + txt_y,
				page.title)
			
			// vai para próxima linha
			txt_x = margin + padding
			txt_y += paragraph_space
		}
		#endregion
	
		#region Desenha os elementos da página
		for (var e = 0; e < array_length(page.content); e++)
		{
			var content = page.content[e]
			
			// TEXTO
			if (content.type == PAGE_EL_TYPE.TEXT)
			{
				draw_set_font(content.font)
				
				var rest = content.text
				while (string_length(rest) > 0)
				{
					// quebra o texto
					var splited = text_break(rest, page_w - txt_x - (margin + padding))
					
					// separa a linha do resto
					var line = splited[0]
					rest = splited[1]
					
					// escreve linha
					draw_text(
						x + (page_w * (i - 1)) + txt_x,
						y - page_h / 2 + txt_y,
						line)
					
					// move cursor
					txt_x += string_width(line)
						
					// vai para próxima linha
					if (string_length(rest) > 0)
					{
						txt_x = margin + padding
						txt_y += line_space
					}
				}
			}
			
			// IMAGEM
			if (content.type == PAGE_EL_TYPE.IMAGE)
			{
				// desenha a imagem
				draw_sprite_stretched(
					content.image,
					0,
					x + (page_w * (i - 1)) + txt_x,
					y - page_h / 2 + txt_y,
					content.w,
					content.h)
			
				
				if (content.lbreak)
					txt_y += content.h
				else
					txt_x += content.w
			}
		
			// começa novo parágrafo
			if (content.lbreak)
			{
				txt_x = + margin + padding
				txt_y += paragraph_space
			}
		}
		#endregion
		
		#region Desenha o Rodapé
		if (string_length(page.baseboard) > 0)
		{
			draw_set_font(fnt_Arial_bold)
			
			txt_x = i == 0 ? margin + padding : page_w - (margin + padding) - string_width(page.baseboard)
			txt_y = page_h - (margin + padding) - string_height(page.baseboard)
			
			draw_text(
				x + (page_w * (i - 1)) + txt_x,
				y - page_h / 2 + txt_y,
				page.baseboard)
		}
		#endregion
	}
}

#endregion
