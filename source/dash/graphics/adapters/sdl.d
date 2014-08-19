module dash.graphics.adapters.sdl;
import dash.core.dgame;
import dash.graphics.graphics;
import dash.graphics.adapters.adapter;
import dash.utility;

import derelict.opengl3.gl3;
import gfm.sdl.sdl, gfm.sdl.window;
import std.string;

class Sdl : Adapter
{
private:
    SDL2 sdl;
    SDL2Window window;
    SDL2GLContext glContext;

public:
    static @property Sdl get() { return cast(Sdl)Graphics.adapter; }

    override void initialize()
    {
        // Initialize OpenGL
        DerelictGL3.load();
        // Initialize SDL
        sdl = new SDL2( null );
        // Load properties from config.
        loadProperties();

        //SDL_Init( SDL_INIT_VIDEO );

        /*window = SDL_CreateWindow(
            DGame.instance.title.toStringz(),
            SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
            width, height,
            SDL_WINDOW_OPENGL
        );*/
        window = new SDL2Window( sdl, ( screenWidth - width ) / 2, ( screenHeight - height ) / 2, width, height );

        window.setTitle( DGame.instance.title );

        //context = SDL_GL_CreateContext( window );
        glContext = new SDL2GLContext( window );
        glContext.makeCurrent();

        DerelictGL3.reload();
    }

    override void shutdown()
    {
        /*SDL_GL_DeleteContext( context );
        SDL_DestroyWindow( window );
        SDL_Quit();*/
        glContext.close();
        window.close();
        sdl.close();
    }

    override void resize()
    {
        loadProperties();

        window.setSize( width, height );
    }

    override void refresh()
    {
        resize();
    }

    override void swapBuffers()
    {
        window.swapBuffers();
    }

    override void openWindow()
    {

    }

    override void closeWindow()
    {

    }

    override void messageLoop()
    {

    }
}