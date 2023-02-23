#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Zirconium {
    class ZIRCONIUM_API Log
    {
    public:
        static void Init();

        inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
        inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
    private:
        static std::shared_ptr<spdlog::logger> s_CoreLogger;
        static std::shared_ptr<spdlog::logger> s_ClientLogger;
    };
}

#define ZR_CORE_ERROR(...) ::Zirconium::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ZR_CORE_WARN(...) ::Zirconium::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ZR_CORE_INFO(...) ::Zirconium::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ZR_CORE_TRACE(...) ::Zirconium::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ZR_CORE_FATAL(...) ::Zirconium::Log::GetCoreLogger()->fatal(__VA_ARGS__)

#define ZR_ERROR(...) ::Zirconium::Log::GetClientLogger()->error(__VA_ARGS__)
#define ZR_WARN(...) ::Zirconium::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ZR_INFO(...) ::Zirconium::Log::GetClientLogger()->info(__VA_ARGS__)
#define ZR_TRACE(...) ::Zirconium::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ZR_FATAL(...) ::Zirconium::Log::GetClientLogger()->fatal(__VA_ARGS__)