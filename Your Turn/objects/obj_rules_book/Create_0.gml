book_spr = spr_book
page_spr = spr_page

margin = 15
padding = 5

line_space = 24
paragraph_space = 32

/*
	Página -2: capa (fora)
	Página -1: capa (dentro)
	Página *tamanho do livro*: contracapa (dentro)
	Página *tamanho do livro* + 1: contracapa (fora)
*/

current_pages = [-1, 0]

pages =
[
	new Page("Esse é o Título", 1,
	[
	new PageElementText("Primeiro  Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro ", fnt_Arial, false),
	new PageElementText("BOOOLD ", fnt_Arial_bold, false),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementImage(spr_card_player, 200, 200),
	new PageElementImage(spr_background_room, 350, 200, false),
	new PageElementText("Primeiro Teste Primeiro Primeiro Teste Primeiro Primeiro Teste Primeiro Primeiro Teste Primeiro Primeiro Teste Primeiro Primeiro Teste Primeiro Primeiro Teste Primeiro Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro Teste Primeiro ", fnt_Arial)
	]),
	new Page("", 2,
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_blood, 200, 200),
	new PageElementImage(spr_numbers, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	]),
	new Page(" ", 3,
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_table, 200, 200),
	new PageElementImage(spr_lightning, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	]),
	new Page(" ", 4,
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_book, 200, 200),
	new PageElementImage(spr_shadows, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	]),
	new Page(" ", 5,
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_background_table, 200, 200),
	new PageElementImage(spr_blink, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	]),
	new Page(" ", 6,
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_card_opponent, 200, 200),
	new PageElementImage(spr_card_shadow, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	]),
	new Page(" ", 7,
	[
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial),
	new PageElementText("Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo Teste Segundo ", fnt_Arial),
	new PageElementImage(spr_card_space, 200, 200),
	new PageElementImage(spr_page, 200, 200),
	new PageElementText("Primeiro Teste Primeiro", fnt_Arial)
	])
]

