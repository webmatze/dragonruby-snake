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
  args.state.snake.pop

  # Draw the snake
  args.state.snake.each do |segment|
    args.outputs.solids << [segment[:x] * 10, segment[:y] * 10, 10, 10, 0, 255, 0]
  end

  # Draw the food
  args.outputs.solids << [args.state.food[:x] * 10, args.state.food[:y] * 10, 10, 10, 255, 0, 0]
end

