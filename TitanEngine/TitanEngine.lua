project "TitanEngine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "Extra"

    targetdir ("%{binDir}/%{prj.name}")
    objdir ("%{objDir}/%{prj.name}")

    files {
        h,
        hpp,
        cpp
    }

    includedirs {
        "include",
        "%{IncludeDir.VulkanSDK}",
        "%{IncludeDir.SDL2}"
    }

    libdirs {
        "%{LibraryDir.VulkanSDK}",
        "%{LibraryDir.SDL2}"
    }

    links {
        "SDL2.lib",
        "SDL2main.lib"
    }

    