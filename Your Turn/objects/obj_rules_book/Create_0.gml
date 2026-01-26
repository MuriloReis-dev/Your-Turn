book_spr = spr_book
page_spr = spr_page

margin = 15
padding = 5

line_space = 24
paragraph_space = 32

//txt_x = x - sprite_get_width(page_spr) + margin + padding // define a posição atual do cursor no texto (x)
//txt_y = y - sprite_get_height(page_spr) / 2 + margin + padding // define a posição atual do cursor no texto (y)

/*
	Página -2: capa (fora)
	Página -1: capa (dentro)
	Página *tamanho do livro*: contracapa (dentro)
	Página *tamanho do livro* + 1: contracapa (fora)
*/

current_pages = [-3, -2]

pages = [
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_card_player, 200, 200),
	new PageElementImage(spr_background_room, 500, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	],
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_blood, 200, 200),
	new PageElementImage(spr_numbers, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	],
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_table, 200, 200),
	new PageElementImage(spr_lightning, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	],
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_book, 200, 200),
	new PageElementImage(spr_shadows, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	],
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_background_table, 200, 200),
	new PageElementImage(spr_blink, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	],
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_card_opponent, 200, 200),
	new PageElementImage(spr_card_shadow, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	],
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_card_space, 200, 200),
	new PageElementImage(spr_page, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	]
]

