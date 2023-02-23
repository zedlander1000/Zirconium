workspace "Zirconium"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Stores the location of the current project.
prjloc = "%{wks.location}/%{prj.name}"

-- Core project
group "core"
    include "premakes/Zirconium"
group ""

-- Example projects
group "examples"
    include "premakes/Sandbox"
group ""