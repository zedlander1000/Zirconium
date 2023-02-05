#pragma once

#ifdef ZR_PLATFORM_WINDOWS

extern Zirconium::Application* Zirconium::CreateApplication();

int main(int arc, char** argv) {
	auto app = Zirconium::CreateApplication();
	app->Run();
	delete app;
}
#endif