enum PAGE_EL_TYPE {
    TEXT,
    IMAGE
}

/// @description Estrutura para conteúdo para a página de um livro (Texto)
/// @param _text Texto
/// @param _font Fonte do texto
/// @param _lbreak Quebra de linha
function PageElementText(_text, _font, _lbreak = true) constructor
{
	type = PAGE_EL_TYPE.TEXT
	text = _text
	font = _font
	lbreak = _lbreak
}

/// @description Estrutura para conteúdo para a página de um livro (Imagem)
/// @param _image Imagem
/// @param _w Largura da imagem
/// @param _h Altura da imagem
/// @param _lbreak Quebra de linha
function PageElementImage(_image, _w, _h, _lbreak = true) constructor
{
	type = PAGE_EL_TYPE.IMAGE
	image = _image
	w = _w
	h = _h
	lbreak = _lbreak
}