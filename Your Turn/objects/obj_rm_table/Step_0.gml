#region Selecionar Carta
// verifica se é a carta mais ao topo
var card = get_inst_on_top(obj_card)
if(card != noone && !card.played) card.selected = true
#endregion