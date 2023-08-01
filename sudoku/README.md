# sudoku

This is a simple 4x4 Sudoku puzzle program written in Prolog. The program utilizes both recursion and static methods to solve Sudoku puzzles efficiently, based on the original implementation by Professor Luis Eduardo da Silva.

##

### Acknowledgment

I would like to acknowledge Professor Luis Eduardo da Silva for providing the foundation and majority of the code for this Sudoku solver. My contribution was limited to completing the implementation as an assignment for the Logic Programming course.

##

### How to Use

To solve a Sudoku puzzle, use the sudoku/1 predicate, passing the unsolved puzzle as an argument. The puzzle should be represented as a list of lists, where empty cells are denoted by an underscore '_'.

#### Example of Consulting: 
```prolog
sudoku([[4,_,_,_],[_,3,_,_],[_,_,1,_],[_,1,_,2]]).