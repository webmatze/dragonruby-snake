def tick args
  # Initialize game state
  args.state.snake ||= [{x: 10, y: 10}]
  args.state.direction ||= {x: 1, y: 0}
  args.state.food ||= {x: 15, y: 15}

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

  # Move the snake
  head = args.state.snake.first
  new_head = {x: head[:x] + args.state.direction[:x], y: head[:y] + args.state.direction[:y]}
  args.state.snake.unshift(new_head)

  # Check if the snake has eaten the food
  if args.state.snake.first[:x] == args.state.food[:x] && args.state.snake.first[:y] == args.state.food[:y]
    # Spawn new food at a random position
    args.state.food = {x: rand(64), y: rand(48)}
  else
    # If the snake didn't eat the food, remove the last segment
    args.state.snake.pop
  end

  # Draw the snake
  args.state.snake.each do |segment|
    args.outputs.solids << [segment[:x] * 10, segment[:y] * 10, 10, 10, 0, 255, 0]
  end

  # Draw the food
  args.outputs.solids << [args.state.food[:x] * 10, args.state.food[:y] * 10, 10, 10, 255, 0, 0]
end

