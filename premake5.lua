include "Scripts/solution_items.lua"
include "Scripts/Filters.lua"
include "Scripts/Actions.lua"
include "Scripts/Dependencies.lua"

--VS Solution Settings
workspace "Titan"
    startproject "TitanEditor"
    architecture "x64"
    configurations {
        "Debug",
        "Release",
        "Shipping"
    }

    flags {
        "MultiProcessorCompile"
    }

    solution_items {
		--".editorconfig"
	}

--Projects
include "TitanEngine/TitanEngine.lua"
include "TitanEditor/TitanEditor.lua"


    