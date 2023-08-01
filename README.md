# DragonRuby Snake Game

This is a simple implementation of the classic Snake game using the DragonRuby game toolkit.

## Game Description

In this game, you control a snake that moves around the screen. The snake grows by eating food that appears at random positions. The game ends when the snake hits itself or the edge of the screen.

The snake starts moving slowly, and its speed increases each time it eats food. The goal of the game is to make the snake as long as possible.

## Controls

Use the arrow keys to change the direction of the snake:

- Up Arrow: Move up
- Down Arrow: Move down
- Left Arrow: Move left
- Right Arrow: Move right

## Running the Game

### Using smaug
You can use [smaug](https://smaug.dev/) to install the dragonruby toolkit and that run the game.

To install smaug on macos you can use:

```bash
brew tap ereborstudios/tap
brew install smaug
```

See https://smaug.dev/cli/install/ for more instructions.

To run the game using smaug you can use:

```bash
smaug run
```

### Using pure DragonRuby

To run the game, you need to have DragonRuby installed. If you don't have it, you can download it from the [DragonRuby website](http://dragonruby.org).

Once you have DragonRuby installed, you can run the game by executing the following command in the terminal:

```
dragonruby path/to/game/directory
```

Replace `path/to/game/directory` with the path to the directory where you have the game files.

## License

This game is released under the MIT License. See the LICENSE file for details.
