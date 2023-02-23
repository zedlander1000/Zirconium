#include <Zirconium.h>

class Sandbox : public Zirconium::Application {
public:
    Sandbox() {

    }

    ~Sandbox() {
    
    }
};

Zirconium::Application* Zirconium::CreateApplication() {
    return new Sandbox();
}