**Aim:**

The aim is to create a chess engine using as much functional programming as possible, while making sure it is fully covered by tests.

**Approach:**

It uses the Minimax Algorithm to determine the best move in any given scenario.

**Architecture:**

This engine uses the following components:

1. Constants (fixed values, no variation or functionality involved)
2. States (pure data structs, no functionality involved)
3. Handlers (purely functional, no state involved)

**Constants:**

1. Pieces (yes pieces are constants, later I'll explain how)
2. Rank and file indices
3. Chess board configuration

**States:**

The following states are used to store data:

1. AdvancementState
2. BoardState
3. GameState
4. MoveState
5. PlayerState
6. SquareState

These states are hashable so they can stored for memoization.

**Handlers:**

The following handlers are used to manipulate the aforementioned states:

1. AIHandler
2. BestMoveHandler
3. BoardHandler
4. EvaluationValueHandler
5. GameHandler
6. LegalMovesHandler
7. MoveGenerationHandler
8. MovementDirectionHandler
9. MovementStrategyHandler
10. MovementTypeHandler
11. MemoizationHandler

**Elaboration of components:**

**Pieces:**

Every piece has the following information:

1. Movement strategies (an array of MovementStrategy enum)
2. Capture strategies (an array of MovementStrategy enum)
3. Movement types (an array of MovementType enum)
4. Movement direction (MovementDirection enum)
5. Is allowed to be captured? (boolean - only false for kings)
6. Is eligible for promotion? (boolean - only true for pawns)
7. Color (white or black)
8. Symbol (a letter for piece representation)

**Movement strategy:**

1. Diagonal (for bishops, queens, kings and pawns while attacking)
2. Straight (for rooks, queens, kings and pawns)
3. L shaped (for knights)

**Movement type:**

1. Step (for kings and pawns)
2. Slide (for bishops, rooks and queens)
3. Slide from file, rank, number of files to slide from, number of ranks to slide from (for kings while castling and pawns on the first move)
4. Hop (for knights)

**Movement direction:**

1. Forward (for pawns)
2. Any (for all other pieces)

**Eligible for promotion:**

1. Yes for certain ranks and promotion options (for pawns on certain ranks)
2. No

**AdvancementState:**

Has the following:

1. File advancement (Integer to indicate how many files a piece was advanced by)
2. Rank advancement (Integer to indicate how many ranks a piece was advanced by)

**BoardState:**

Has the following:

A 2 dimensional array of 64 square states

**GameState:**

Has the following:

1. Board state (indicates the current board state tied with this game state)
2. White player (state of the white player tied with this game state)
3. Black player (state of the black player tied with this game state)
4. Current player (whether white is the current player or black is)

**MoveState:**

1. Which square is this move from
2. Which square is this move to
3. What is the evaluation value of this move (will be helpful for the AI)

**PlayerState:**

1. Is the player AI controlled?
2. What is the color of the player?

**SquareState:**

1. File index of the square
2. Rank index of the square
3. Piece placed on the square

**AIHandler:**

Has an input function that takes the game state and fires the delegate method once it has computed the move

**BestMoveHandler:**

Determines the best move using the minimax algorithm (up to a certain depth)

**BoardHandler:**

Takes a move state and a board state. Then it plays the given move on the board and returns the new board state (returns a board state).

**EvaluationValueHandler:**

Takes a board state and a player state. Takes all the pieces of that particular player from the board and calculates the following information:

1. Total piece value
2. Total mobility value (how many moves are available?)

**GameHandler:**

Takes a move state and a game state. Then it plays the given move on the game and returns the new game state (returns a game state).

**LegalMovesHandler:**

Takes a move state and a board state. Then it determines if the move is valid on that given board state (returns a boolean).

**MoveGenerationHandler:**

Takes a square state and a board state. Then it determines all the moves possible for the piece placed on that square on that given board (returns an array of move states).

**MovementDirectionHandler:**

Takes a move state, a movement direction and a color. Then it determines if that move is possible in that direction for that color of the piece (returns a boolean).

**MovementStrategyHandler:**

Takes a move state and an array of movement strategies. Then it determines if that move is possible with those movement strategies.

**MovementTypeHandler:**

Takes a move state and an array of movement types. Then it determines if that move is possible with those movement types.

**MemoizationHandler:**

Takes all of the aforementioned handlers and memoizes their results based on their inputs, so they can be utilized later instead of being re-computed.

**Working principle:**

Here is a summary of it's working principle:

1. It utilizes the well-known **minimax algorithm** for constructing decision trees
3. Then it traverses that tree, evaluates the highest ranked move and plays it
4. The depth of decision tree is **4**.

Here's a screenshot of the bot playing itself:

![Screenshot](https://github.com/AdnanZahid/ChessSwift/blob/master/Screenshot.png)

**Graphical programming:*

Graphical programming is done in Apple's SceneKit framework (used for 3D graphics programming).
