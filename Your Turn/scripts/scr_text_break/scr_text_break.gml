/// @description Divide uma string em dois elementos: uma linha que cabe na largura definida e o resto da string
/// @param text A string a ser dividida
/// @param width A largura máxima de uma linha em pixels
function text_break(text, width)
{
	var words = string_split(text, " ")
	var line = ""
	
	for (var i = 0; i < array_length(words); i++)
	{
		if (i > 0 && i < array_length(words)) // caso não seja a primeira nem a última palavra
			line += " "
		
		if (string_width(line + words[i]) < width) // caso a próxima palavra não passe da linha
			line += words[i] // adiciona a próxima palavra
		else // passou da linha
		{
			if (string_width(words[i]) > width) // caso a palavra seja maior do que a linha
			{
				for (var c = 0; c < string_length(words[i]); c++) // para cada caractere
				{
					// caso o próximo caracter não passe da linha
					if (string_width(line + string_char_at(words[i], c + 1)) < width)
						line += string_char_at(words[i], c + 1) // adiciona caractere
					else // passou da linha
						break
				}
			}
			else
				break
		}
	}
	
	var rest = string_delete(text, 0, string_length(line))
	
	rest = string_trim_start(rest)
	
	return [line, rest]
}