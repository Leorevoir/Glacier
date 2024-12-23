class Window

    getter window : Pointer(GLFW::Window)
    @clock : Clock

    def initialize(
        @width  :   Int32  =  1280,
        @height :   Int32  =  720,
        @title  :   String =  "Window Title")

        unless GLFW.init == 1
            raise "Failed to initialize GLFW"
        end

        title_ptr = @title.check_no_null_byte.to_unsafe.as(Pointer(Char))
        @window = GLFW.create_window(@width, @height, title_ptr, nil, nil)

        if @window.nil?
            GLFW.terminate
            raise "Failed to create GLFW window"
        end

        GLFW.make_context_current(@window)
        @clock = Clock.new
    end

    def render
        @clock.update
        GLFW.swap_buffers(@window)
        GLFW.poll_events
    end

    def close
        GLFW.destroy_window(window)
        GLFW.terminate
    end

    def delta_time : GLFW::Time
        @clock.delta_time
    end

    def total_time : GLFW::Time
        @clock.time
    end

end
