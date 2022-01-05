project "TitanEditor"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "Extra"
    links {"TitanEngine"}

    targetdir (binDir)
    objdir (objDir)

    files {
        "source/**.h",
        "source/**.hpp",
        "source/**.cpp"
    }

    includedirs {
        TitanEngineInc
    }