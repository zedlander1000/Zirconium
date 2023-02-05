#pragma once
#include "Core.h"

namespace Zirconium {
	class ZIRCONIUM_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in client.
	Application* CreateApplication();
}