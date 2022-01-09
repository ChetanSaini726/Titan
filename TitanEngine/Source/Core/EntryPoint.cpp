#include "Engine/EntryPoint.hpp"
#include "TitanWindow.hpp"

namespace Titan
{

	int TitanApp::TitanMain()
	{

		VulkanEngine engine;

		engine.init();

		engine.run();

		engine.cleanup();

		return 0;
	}
}
