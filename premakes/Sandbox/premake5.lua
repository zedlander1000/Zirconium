project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outdir .. "/%{prj.name}")

    files
    {
        "%{prjloc}/src/**.h",
        "%{prjloc}/src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/Zirconium/lib/spdlog/include",
        "%{wks.location}/Zirconium/src"
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