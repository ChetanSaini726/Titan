#include "Engine/EntryPoint.hpp"
#include "TitanWindow.h"

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
