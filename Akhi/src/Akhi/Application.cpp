#include "akhipch.h"
#include "Application.h"

#include "Akhi/Events/ApplicationEvent.h"
#include "Akhi/Log.h"

#include <GLFW/glfw3.h>


Akhi::Application::Application()
{
	m_Window = std::unique_ptr<Window>(Window::Create());
}

Akhi::Application::~Application()
{
}

void Akhi::Application::Run()
{
		
	while (m_Running)
	{
		glClearColor(1, 0, 1, 1);
		glClear(GL_COLOR_BUFFER_BIT);
		m_Window->OnUpdate();
	}
}
