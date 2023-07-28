def tick args
  # Initialize game state
  args.state.snake ||= [{x: 10, y: 10}]
  args.state.direction ||= {x: 1, y: 0}
  args.state.food ||= {x: 15, y: 15}

  # Draw the snake
  args.state.snake.each do |segment|
    args.outputs.solids << [segment[:x] * 10, segment[:y] * 10, 10, 10, 0, 255, 0]
  end

  # Draw the food
  args.outputs.solids << [args.state.food[:x] * 10, args.state.food[:y] * 10, 10, 10, 255, 0, 0]
end

