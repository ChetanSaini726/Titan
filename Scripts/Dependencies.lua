--Variables

--Output Directory Path
binDir = "%{wks.location}/Build/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
objDir = "%{wks.location}/Build/obj/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    
--Include Directories
IncludeDir = {}
IncludeDir["VulkanSDK"] = "%VULKAN_SDK%/Include"
IncludeDir["SDL2"] = "%{wks.location}/Externals/SDL2/include"

--Lib Directory Path
LibraryDir = {}
LibraryDir["VulkanSDK"] = "%VULKAN_SDK%/Lib"
LibraryDir["SDL2"] = "%{wks.location}/Externals/SDL2/lib"

--Source Files Path
h   = "**.h"
hpp = "**.hpp"
cpp = "**.cpp"

--Include header files only path
TitanEngineInc = "%{wks.location}/TitanEngine/Include"