class Clock

    getter time       : GLFW::Time = 0.0
    getter delta_time : GLFW::Time = 0.0

    @paused       : Bool = false
    @paused_time  : GLFW::Time = 0.0
    @last_time    : GLFW::Time = 0.0

    def initialize
        @last_time = GLFW.get_time
    end

    def update
        return if @paused

        current = GLFW.get_time
        @delta_time = current - @last_time
        @time += @delta_time
        @last_time = current
    end

    def pause
        return if @paused

        @paused = true
        @paused_time = GLFW.get_time
    end

    def resume
        return unless @paused

        @paused = false
        paused_duration = GLFW.get_time - @paused_time
        @last_time += paused_duration
    end

    def paused? : Bool
        @paused
    end

end

