newoption {
    trigger     = "with-version",
    value       = "STRING",
    description = "Current UAL version",
    default     = "6.0.0",
}

-- x86
workspace "Ultimate-ASI-Loader-Win32"
   configurations { "Release", "Debug" }
   architecture "x86"
   location "build"
   buildoptions {"-std:c++latest"}
   
   defines { "rsc_CompanyName=\"ThirteenAG\"" }
   defines { "rsc_LegalCopyright=\"MIT License\""} 
   if(_OPTIONS["with-version"]) then
      defines { "rsc_FileVersion=\"" .. _OPTIONS["with-version"] .. "\"", "rsc_ProductVersion=\"" .. _OPTIONS["with-version"] .. "\"" }
   else
      defines { "rsc_FileVersion=\"1.0.0.0\"", "rsc_ProductVersion=\"1.0.0.0\"" }
   end
   defines { "rsc_InternalName=\"%{prj.name}\"", "rsc_ProductName=\"%{prj.name}\"", "rsc_OriginalFilename=\"%{prj.name}.dll\"" }
   defines { "rsc_FileDescription=\"Ultimate ASI Loader\"" }
   defines { "rsc_UpdateUrl=\"https://github.com/ThirteenAG/Ultimate-ASI-Loader\"" }
     
project "Ultimate-ASI-Loader-Win32"
   kind "SharedLib"
   language "C++"
   targetdir "bin/Win32/%{cfg.buildcfg}"
   targetname "dinput8"
   targetextension ".dll"
   
   includedirs { "source" }
   includedirs { "external" }
   
   files { "source/dllmain.h", "source/dllmain.cpp" }
   files { "source/x86.def" }
   files { "source/xlive/xliveless.h", "source/xlive/xliveless.cpp", "source/xlive/xliveless.rc"}
   files { "source/resources/*.rc" }
   files { "external/d3d8to9/source/*.hpp", "external/d3d8to9/source/*.cpp" }
   files { "external/MemoryModule/*.h", "external/MemoryModule/*.c" }
   files { "external/ModuleList/*.hpp" }

   local dxsdk = os.getenv "DXSDK_DIR"
   if dxsdk then
      includedirs { dxsdk .. "/include" }
      libdirs { dxsdk .. "/lib/x86" }
   elseif os.isdir("external/minidx9") then
      includedirs { "external/minidx9/Include" }
      libdirs { "external/minidx9/Lib/x86" }
   else
      includedirs { "C:/Program Files (x86)/Microsoft DirectX SDK (June 2010)/include" }
      libdirs { "C:/Program Files (x86)/Microsoft DirectX SDK (June 2010)/lib/x86" }
   end
   
   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG", "D3D8TO9NOLOG" }
      optimize "On"
      staticruntime "On"
      
project "MessageBox"
   kind "SharedLib"
   language "C++"
   targetdir "bin/Win32/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/MessageBox.cpp" }
   files { "source/resources/Versioninfo.rc" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"
      
project "ExeUnprotect"
   kind "SharedLib"
   language "C++"
   targetdir "bin/Win32/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/ExeUnprotect.cpp" }
   files { "source/resources/Versioninfo.rc" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"
      
project "OverloadFromFolderDLL"
   kind "SharedLib"
   language "C++"
   targetdir "bin/Win32/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/OverloadFromFolderDLL.cpp" }
   files { "source/resources/Versioninfo.rc" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"

project "MonoLoader"
   kind "SharedLib"
   language "C++"
   targetdir "bin/Win32/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/MonoLoader.cpp" }
   files { "source/resources/Versioninfo.rc" }

   includedirs { "source/demo_plugins/minhook/include" }
   includedirs { "source/demo_plugins/minhook/src" }
   
   files { "source/demo_plugins/minhook/include/**" }
   files { "source/demo_plugins/minhook/src/**" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"
      
-- x64
workspace "Ultimate-ASI-Loader-x64"
   configurations { "Release", "Debug" }
   architecture "x86_64"
   location "build"
   buildoptions {"-std:c++latest"}
   
   defines { "rsc_CompanyName=\"ThirteenAG\"" }
   defines { "rsc_LegalCopyright=\"MIT License\""} 
   if(_OPTIONS["with-version"]) then
      defines { "rsc_FileVersion=\"" .. _OPTIONS["with-version"] .. "\"", "rsc_ProductVersion=\"" .. _OPTIONS["with-version"] .. "\"" }
   else
      defines { "rsc_FileVersion=\"1.0.0.0\"", "rsc_ProductVersion=\"1.0.0.0\"" }
   end
   defines { "rsc_InternalName=\"%{prj.name}\"", "rsc_ProductName=\"%{prj.name}\"", "rsc_OriginalFilename=\"%{prj.name}.dll\"" }
   defines { "rsc_FileDescription=\"Ultimate ASI Loader\"" }
   defines { "rsc_UpdateUrl=\"https://github.com/ThirteenAG/Ultimate-ASI-Loader\"" }
   
   defines { "X64" }
     
project "Ultimate-ASI-Loader-x64"
   kind "SharedLib"
   language "C++"
   targetdir "bin/x64/%{cfg.buildcfg}"
   targetname "dinput8"
   targetextension ".dll"
   
   includedirs { "source" }
   includedirs { "external" }
   
   files { "source/dllmain.h", "source/dllmain.cpp" }
   files { "source/x64.def" }
   files { "source/resources/Versioninfo.rc" }
   
   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"
      
project "RE7Demo.InfiniteAmmo"
   kind "SharedLib"
   language "C++"
   targetdir "bin/x64/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/RE7Demo.InfiniteAmmo.cpp" }
   files { "source/resources/Versioninfo.rc" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"

project "MessageBox_x64"
   kind "SharedLib"
   language "C++"
   targetdir "bin/x64/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/MessageBox.cpp" }
   files { "source/resources/Versioninfo.rc" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"
      
project "OverloadFromFolderDLL_x64"
   kind "SharedLib"
   language "C++"
   targetdir "bin/x64/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/OverloadFromFolderDLL.cpp" }
   files { "source/resources/Versioninfo.rc" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"

project "MonoLoader_x64"
   kind "SharedLib"
   language "C++"
   targetdir "bin/x64/%{cfg.buildcfg}/scripts"
   targetextension ".asi"
   
   files { "source/demo_plugins/MonoLoader.cpp" }
   files { "source/resources/Versioninfo.rc" }

   includedirs { "source/demo_plugins/minhook/include" }
   includedirs { "source/demo_plugins/minhook/src" }
   
   files { "source/demo_plugins/minhook/include/**" }
   files { "source/demo_plugins/minhook/src/**" }

   characterset ("UNICODE")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      staticruntime "On"