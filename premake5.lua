workspace "Titan"
    startproject "TitanEditor"
    architecture "x64"
    configurations {"Debug", "Release", "Shipping"}
    flags {"MultiProcessorCompile"}

filter "system:windows"
    systemversion "latest"
    defines {"PLATFORM_WIN"}

filter "configurations:Debug"
    buildoptions "/MTd"
    defines {"TN_DEBUG"}
    runtime "Debug"
    symbols "on"
    optimize "off"

filter "configurations:Release"
    buildoptions "/MT"
    defines {"TN_RELEASE"}
    runtime "Release"
    symbols "on"
    optimize "on"
    
filter "configurations:Shipping"
    buildoptions "/MT"
    defines {"TN_SHIPPING"}
    runtime "Release"
    symbols "off"
    optimize "speed"
    
--Output Directory Path
binDir = "../Build/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
objDir = "../Build/obj/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
    
--Include Directories
IncludeDir = {}

--Source Files Path
h   = "source/**.h"
hpp = "source/**.hpp"
cpp = "source/**.cpp"

--Include header files only path
TitanEngineInc = "../TitanEngine/source"

--Projects
include "TitanEngine"
include "TitanEditor"

newaction {
    trigger = "clean",
    description = "Remove all vs and build files",
    execute = function()
        print("Deleting all vs and build files!")
        os.rmdir("./Build")
        os.rmdir("./.vs")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.filters")
        os.remove("**.user")
        print("Finished!")
    end
}


    