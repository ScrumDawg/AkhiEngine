#include <Akhi.h>

class Sandbox : public Akhi::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox() 
	{

	}
};

Akhi::Application* Akhi::CreateApplication()
{
	return new Sandbox();
}