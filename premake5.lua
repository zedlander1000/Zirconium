workspace "Zirconium"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Zirconium"
    location "Zirconium"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "ZR_PLATFORM_WINDOWS",
            "ZR_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outdir .. "/Sandbox")
        }
    
    filter "configurations:Debug"
        defines "ZR_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "ZR_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "ZR_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Zirconium/vendor/spdlog/include",
        "Zirconium/src"
    }

    links
    {
        "Zirconium"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "ZR_PLATFORM_WINDOWS"
        }
    
    filter "configurations:Debug"
        defines "ZR_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "ZR_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "ZR_DIST"
        optimize "On"