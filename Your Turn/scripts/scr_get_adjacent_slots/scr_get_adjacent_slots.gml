/// @description Pega posições adjacentes à posição verificada em uma array bidimensional que representa um grid [linha, coluna]
/// @param row Linha da posição verificada
/// @param col Coluna da posição verificada
function get_adjacent_slots(row, col)
{
    var result = [];

    var dirs = [
        [0,  1], // baixo
        [0, -1], // cima
        [1,  0], // direita
        [-1, 0]  // esquerda
    ];

    for (var i = 0; i < array_length(dirs); i++)
    {
        var nx = row + dirs[i][0];
        var ny = col + dirs[i][1];

        if (nx >= 0 && nx < array_length(global.board[row]) &&
			ny >= 0 && ny < array_length(global.board[col]))
        {
			array_push(result, global.board[nx][ny]);
        }
    }

    return result;
}
