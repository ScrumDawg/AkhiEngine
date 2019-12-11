#pragma once

#ifdef AKHI_PLATFORM_WINDOWS

extern Akhi::Application* Akhi::CreateApplication();

int main(int argc, char** argv)
{
	Akhi::Log::Init();
	AKHI_CORE_WARN("Initialized Log!");
	AKHI_INFO("Hi!");

	auto app = Akhi::CreateApplication();
	app->Run();
	delete app;
}

#endif // AKHI_PLATFORM_WINDOWS

