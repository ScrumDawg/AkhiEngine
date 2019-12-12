#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Akhi {

	class AKHI_API Log
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

//Core Log Macros
#define AKHI_CORE_FATAL(...) ::Akhi::Log::GetCoreLogger()->fatal(__VA_ARGS__)
#define AKHI_CORE_ERROR(...) ::Akhi::Log::GetCoreLogger()->error(__VA_ARGS__)
#define AKHI_CORE_WARN(...) ::Akhi::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define AKHI_CORE_INFO(...) ::Akhi::Log::GetCoreLogger()->info(__VA_ARGS__)
#define AKHI_CORE_TRACE(...) ::Akhi::Log::GetCoreLogger()->trace(__VA_ARGS__)

//Client Log Macros
#define AKHI_FATAL(...) ::Akhi::Log::GetClientLogger()->fatal(__VA_ARGS__)
#define AKHI_ERROR(...) ::Akhi::Log::GetClientLogger()->error(__VA_ARGS__)
#define AKHI_WARN(...) ::Akhi::Log::GetClientLogger()->warn(__VA_ARGS__)
#define AKHI_INFO(...) ::Akhi::Log::GetClientLogger()->info(__VA_ARGS__)
#define AKHI_TRACE(...) ::Akhi::Log::GetClientLogger()->trace(__VA_ARGS__)


