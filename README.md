# mastermind
A command-line Mastermind game built in Ruby to practice OOP principles and basic computer AI.

## Description

A command-line implementation of Mastermind written in Ruby. You can play as the codebreaker and have the computer create the secret code. Or, you can reverse the roles and create a secret code for the computer to try and break. 


## Purpose

This project was built to practice:
- Object-oriented design and class responsibility seperation
- Managing shared state across interacting objects
- Refactoring to implement new features
- Implementing a simple rule-based AI
- Working with Ruby arrays, hashes, constants, and modules

## How to run

```bash
ruby game.rb
```

## Usage

Enter 1 or 2 to play as the breaker or codemaker. 

As the breaker:
- Try to guess the secret code in 12 turns.
- Feedback is provided if you have the correct symbol that turn.
- The game ends when you guess the secret code or reach round 12. 

As the codemaker:
- Enter your 4 letter code.
- The computer will try to break your code. 
- The game ends when the computer guesses the secret code or reaches round 12.


## Example Output

```
Turn | Guess         | Feedback
-----------------------------------
1    | ◆ ▲ ■ ★      | ○ ○
2    | ◆ ▲ ★ ✖      | ● ○ ○
3    | ◆ ★ ★ ★      | ● ○
4    | ◆ ▲ ■ ★      | ○ ○
Legend:
A = ◆   B = ▲   C = ■   D = ★   E = ✚   F = ✖
● = correct position
○ = correct symbol, wrong position
-----------------------------------
Enter your 4 letter guess.
abcd

```