#pragma once

#ifdef AKHI_PLATFORM_WINDOWS

extern Akhi::Application* Akhi::CreateApplication();

int main(int argc, char** argv)
{
	printf("Game App started!");
	auto app = Akhi::CreateApplication();
	app->Run();
	delete app;
}

#endif // AKHI_PLATFORM_WINDOWS

