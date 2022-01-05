project "TitanEngine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "Extra"

    targetdir (binDir)
    objdir (objDir)

    files {
        "source/**.h",
        "source/**.hpp",
        "source/**.cpp"
    }

    includedirs {
    }