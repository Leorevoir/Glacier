require "../src/glacier"

window : Window = Window.new

loop do
    window.render
    puts "Elapsed Time: #{window.total_time} seconds"
    puts "Delta Time: #{window.delta_time} seconds"
end

