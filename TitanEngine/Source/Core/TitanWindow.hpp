#pragma once

class VulkanEngine
{

public:
	bool _isInitialized{false};

	int _frameNumber{0};

	struct SDL_Window *_window{nullptr};

	// initializes everything in the engine
	void init();

	// shuts down the engine
	void cleanup();

	// draw loop
	void draw();

	// run main loop
	void run();
};
