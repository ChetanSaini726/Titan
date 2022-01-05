workspace "Titan"
    startproject "Editor"
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
binDir = "build/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
objDir = "build/obj/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
    
--Include directories
IncludeDir = {}

--Projects

--Engine
project "Engine"
    location "%{prj.name}"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "Extra"

    targetdir (binDir)
    objdir (objDir)

    files {
        "%{prj.name}/include/**.h",
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/include"
    }

--Editor
project "Editor"
    location "%{prj.name}"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "Extra"
    links {"Engine"}

    targetdir (binDir)
    objdir (objDir)

    files {
        "%{prj.name}/include/**.h",
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/include",
        "Engine/include"
    }


    