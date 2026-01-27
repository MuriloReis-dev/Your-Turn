/// @description Divide uma string em linhas de texto separadas em uma array
/// @param text A string a ser dividida
/// @param width A largura máxima de uma linha em pixels
function text_break(text, width)
{
	var words = string_split(text, " ")
	var result = []
	var line = ""
	
	for (var i = 0; i < array_length(words); i++)
	{
		if (string_length(line) > 0) line += " "
		
		// se a próxima palavra ultrapassar a linha
		if (string_width(line + words[i]) > width)
		{
			if (string_width(words[i]) > width) // caso a palavra seja maior do que a linha
			{
				for (var c = 0; c < string_length(words[i]); c++)
				{
					// verifica se o próximo caractere passa da linha
					if (string_width(line + string_char_at(words[i], c + 1)) > width)
					{
						array_push(result, line)
						line = ""
					}
					line += string_char_at(words[i], c + 1)
				}
			}
			else
			{
				array_push(result, line)
				line = words[i]
			}
		}
		else
			line += words[i]
	
		if (i == array_length(words) - 1) array_push(result, line)
	}
	
	return result
}