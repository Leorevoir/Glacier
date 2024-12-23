@[Link("glfw")]

# lib GLFW for Crystal
# binds GLFW C functions to access it in Crystal for my Glacier API
# tested with NixOS unstable using the repository's flake.nix
lib GLFW

    fun init                =     glfwInit : Int32

    fun create_window       =     glfwCreateWindow(
        width   :   Int32,
        height  :   Int32,
        title   :   Pointer(Char),
        monitor :   Pointer(Void),
        share   :   Pointer(Window)) : Pointer(Window)

    fun window_should_close =     glfwWindowShouldClose(
        window  :   Pointer(Window)) : Int32

    fun make_context_current =    glfwMakeContextCurrent(
        window : Pointer(Window)) : Void

    fun swap_buffers        =     glfwSwapBuffers(
        window  :   Pointer(Window)) : Void

    fun poll_events         =     glfwPollEvents : Void

    fun destroy_window      =     glfwDestroyWindow(
        window  :   Pointer(Window)) : Void

    fun terminate           =     glfwTerminate : Void

    fun get_time            =     glfwGetTime : GLFW::Time


end
