TODO:
Refactor so instead of just checking if the move is legal; I want it so each piece has a function that generates legal moves in an array; then I would check if the to_position is in one of the array; then check if to_position is bigger or smaller than from_position.
Make it so you can't move to a position if on it's road it's blocked by a piece
Check if the king is in check, or checkmate(generate legal moves for the kings, if it's 0 while in check, then they lost)
Implement castling
Implement saving

COMPLETED:
Make it so you can't move to a position if it's occupied by a piece with the same color moving