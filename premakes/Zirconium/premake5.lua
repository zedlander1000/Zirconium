-- -- includes = {}
-- -- includes["GLFW"] = "Zirconium/lib/GLFW/include"

project "Zirconium"
    location "Zirconium"
    kind "SharedLib"
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
        "%{prjloc}/src",
        "%{prjloc}/lib/spdlog/include",
        -- "%{includes.GLFW}"
    }

    -- links
    -- {
    --     "GLFW",
    --     "opengl32.lib"
    -- }

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
            ("{COPY} %{cfg.buildtarget.relpath} %{wks.location}/bin/" .. outdir .. "/Sandbox")
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