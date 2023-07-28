def tick args
  # Initialize game state
  args.state.pixel_grid ||= 20
  args.state.grid_width ||= 64
  args.state.grid_height ||= 48
  args.state.snake ||= [{x: args.state.pixel_grid, y: args.state.pixel_grid}]
  args.state.direction ||= {x: 1, y: 0}
  args.state.food ||= {x: 15, y: 15}
  args.state.tick_count ||= 0
  args.state.speed ||= 10

  # Change direction based on keyboard input
  if args.inputs.keyboard.key_down.up
    args.state.direction = {x: 0, y: 1}
  elsif args.inputs.keyboard.key_down.down
    args.state.direction = {x: 0, y: -1}
  elsif args.inputs.keyboard.key_down.left
    args.state.direction = {x: -1, y: 0}
  elsif args.inputs.keyboard.key_down.right
    args.state.direction = {x: 1, y: 0}
  end

  # Move the snake every N ticks
  if args.state.tick_count % args.state.speed == 0
    # Move the snake
    head = args.state.snake.first
    new_head = {x: head[:x] + args.state.direction[:x], y: head[:y] + args.state.direction[:y]}
    args.state.snake.unshift(new_head)

    # Check if the snake has hit itself or the edge of the screen
    if new_head[:x] < 0 || new_head[:y] < 0 || new_head[:x] >= args.state.grid_width || new_head[:y] >= args.state.grid_height || args.state.snake[1..-1].any? { |segment| segment[:x] == new_head[:x] && segment[:y] == new_head[:y] }
      # Reset the game
      args.state.snake = [{x: args.state.pixel_grid, y: args.state.pixel_grid}]
      args.state.direction = {x: 1, y: 0}
      args.state.food = {x: 15, y: 15}
      return
    end

    # Check if the snake has eaten the food
    if args.state.snake.first[:x] == args.state.food[:x] && args.state.snake.first[:y] == args.state.food[:y]
      # Spawn new food at a random position
      args.state.food = {x: rand(args.state.grid_width), y: rand(args.state.grid_height)}
    else
      # If the snake didn't eat the food, remove the last segment
      args.state.snake.pop
    end
  end

  # Increment the tick count
  args.state.tick_count += 1

  # Draw the snake
  args.state.snake.each do |segment|
    args.outputs.solids << [segment[:x] * args.state.pixel_grid, segment[:y] * args.state.pixel_grid, args.state.pixel_grid, args.state.pixel_grid, 0, 255, 0]
  end

  # Draw the food
  args.outputs.solids << [args.state.food[:x] * args.state.pixel_grid, args.state.food[:y] * args.state.pixel_grid, args.state.pixel_grid, args.state.pixel_grid, 255, 0, 0]
end

