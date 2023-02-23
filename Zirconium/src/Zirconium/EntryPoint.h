#pragma once

#ifdef ZR_PLATFORM_WINDOWS

extern Zirconium::Application* Zirconium::CreateApplication();

int main(int arc, char** argv) {
    Zirconium::Log::Init();
    ZR_CORE_WARN("Log init");
    ZR_INFO("Log init");

    auto app = Zirconium::CreateApplication();
    app->Run();
    delete app;
}

#endif