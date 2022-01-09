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