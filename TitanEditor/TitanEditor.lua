project "TitanEditor"
    kind "ConsoleApp"
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
        "%{TitanEngineInc}"
    }

    links {
        "TitanEngine"
    }

    postbuildcommands {
        "{COPY} \"%{LibraryDir.SDL2}\\SDl2.dll\" \"%{cfg.targetdir}\""
    }