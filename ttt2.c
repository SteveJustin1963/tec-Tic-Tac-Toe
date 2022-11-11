// 1. start with an empty 3x3 grid
// 2. player 1 chooses a position on the grid by putting an 'X' in one of the empty cells
// 3. player 2 chooses a position on the grid by putting an 'O' in one of the empty cells
// 4. if either player has three of their symbols in a row horizontally, vertically, or diagonally, that player wins the game
// 5. if all the cells on the grid are filled and neither player has won, the game ends in a drawwrite me a program to do this


convert to c code

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 3

void print_grid(char grid[MAX_SIZE][MAX_SIZE]);
void clear_grid(char grid[MAX_SIZE][MAX_SIZE]);
int check_win(char grid[MAX_SIZE][MAX_SIZE]);
int check_draw(char grid[MAX_SIZE][MAX_SIZE]);

int main(void)
{
    char grid[MAX_SIZE][MAX_SIZE];
    int player = 1;
    int row, col;
    int win = 0;
    int draw = 0;

    clear_grid(grid);

    while (win == 0 && draw == 0)
    {
        print_grid(grid);
        printf("Player %d, enter row and column: ", player);
        scanf("%d %d", &row, &col);
        if (grid[row][col] == ' ')
        {
            if (player == 1)
            {
                grid[row][col] = 'X';
            }
            else
            {
                grid[row][col] = 'O';
            }
            win = check_win(grid);
            draw = check_draw(grid);
            if (player == 1)
            {
                player = 2;
            }
            else
            {
                player = 1;
            }
        }
        else
        {
            printf("That space is already taken.\n");
        }
    }

    print_grid(grid);
    if (win == 1)
    {
        printf("Player %d wins!\n", player);
    }
    else
    {
        printf("Draw!\n");
    }

    return 0;
}

void print_grid(char grid[MAX_SIZE][MAX_SIZE])
{
    int i, j;

    for (i = 0; i < MAX_SIZE; i++)
    {
        for (j = 0; j < MAX_SIZE; j++)
        {
            printf("%c ", grid[i][j]);
        }
        printf("\n");
    }
}

void clear_grid(char grid[MAX_SIZE][MAX_SIZE])
{
    int i, j;

    for (i = 0; i < MAX_SIZE; i++)
    {
        for (j = 0; j < MAX_SIZE; j++)
        {
            grid[i][j] = ' ';
        }
    }
}

int check_win(char grid[MAX_SIZE][MAX_SIZE])
{
    int i, j;
    int win = 0;

    for (i = 0; i < MAX_SIZE; i++)
    {
        if (grid[i][0] != ' ' && grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2])
        {
            win = 1;
        }
        if (grid[0][i] != ' ' && grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i])
        {
            win = 1;
        }
    }
    if (grid[0][0] != ' ' && grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2])
    {
        win = 1;
    }
    if (grid[0][2] != ' ' && grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0])
    {
        win = 1;
    }

    return win;
}

int check_draw(char grid[MAX_SIZE][MAX_SIZE])
{
    int i, j;
    int draw = 1;

    for (i = 0; i < MAX_SIZE; i++)
    {
        for (j = 0; j < MAX_SIZE; j++)
        {
            if (grid[i][j] == ' ')
            {
                draw = 0;
            }
        }
    }

    return draw;
}
