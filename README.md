# battleship-war

## Description

This application will accept input.txt as input file which will have all necessary parameters to process the data. This application contains 5 classes as shown below. All of them will be available under lib folder
1. BattleshipGame: The main class that will manage the game.
2. Player: To represent each player.
3. Grid: To represent the player's grid.
4. Ship: To represent the ships.
5. Missile: To handle missile attacks and results.

## Installation

Any ruby version will be enough for this application.

## Usage

On your terminal execute below command
```
ruby /path/to/battleship_game.rb
```
Results

![Screenshot-from-2024-06-24-15-19-55](https://github.com/JeetDesai/battleship-war/assets/1021248/f1eb787d-e555-4594-854e-e296e268c931)


## Input output files

You can access input.txt and output.txt file in data folder

## Features

Based on mentioned parameters in input.txt, whole game will work. If you want to use different testcases to be executed, you just need to update input.txt file with coordinates details of ship and missile positions.

## Sample input (input.txt)

```
5
5
1,1:2,0:2,3:3,4:4,3
0,1:2,3:3,0:3,4:4,1
5
0,1:4,3:2,3:3,1:4,1
0,1:0,0:1,1:2,3:4,3
```

## Sample output (output.txt)

```
Player 1
O O _ _ _
_ X _ _ _
S _ _ X _
_ _ _ _ S
_ _ _ X _
Player 2
_ X _ _ _
_ _ _ _ _
_ _ _ X _
S O _ _ S
_ X _ O _
P1:3
P2:3
It is a draw
```
