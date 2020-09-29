#8x8 board game = 64
#16 pieces on board white and black
#=> 1 king, 1 queen, 2 rooks, 2 knights, 2 bishops, 8 pawns
#game over if checkmate => king has no moves that not gonna kick him out
#random if black or white => white moves first
#if piece is moved => occupied => remove enemy piece, else set piece
#moves:
#king => one square in any direction
#rook => any number of squares along rank or file, cannot leap over pieces
#bishop => moves diagonal, not over other pieces
#queen => rook + bishop, not over other pieces
#knight => 2,1 in any direction, only pieces that can leap over others
#pawn => move one or two pos => two only on first move => can capture opponent
#     if enemy pawn is in front of it one position left or right