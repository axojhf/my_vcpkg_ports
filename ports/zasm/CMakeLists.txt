project(zasm LANGUAGES CXX)

if(MSVC)
    add_compile_options(/std:c++17)
else()
    add_compile_options(-Wall -O3 -std=c++17)
endif()

set(zasm_SOURCES
	"zasm/src/zasm/src/core/error.cpp"
	"zasm/src/zasm/src/core/filestream.cpp"
	"zasm/src/zasm/src/core/memorystream.cpp"
	"zasm/src/zasm/src/decoder/decoder.cpp"
	"zasm/src/zasm/src/encoder/encoder.cpp"
	"zasm/src/zasm/src/formatter/formatter.cpp"
	"zasm/src/zasm/src/program/data.cpp"
	"zasm/src/zasm/src/program/instruction.cpp"
	"zasm/src/zasm/src/program/program.cpp"
	"zasm/src/zasm/src/program/register.cpp"
	"zasm/src/zasm/src/program/saverestore.cpp"
	"zasm/src/zasm/src/program/saverestore.load.cpp"
	"zasm/src/zasm/src/program/saverestore.save.cpp"
	"zasm/src/zasm/src/serialization/serializer.cpp"
	"zasm/src/zasm/src/x86/x86.assembler.cpp"
	"zasm/src/zasm/src/x86/x86.register.cpp"
	"zasm/src/zasm/src/zasm.cpp"
	"zasm/src/zasm/src/encoder/encoder.context.hpp"
	"zasm/src/zasm/src/program/program.node.hpp"
	"zasm/src/zasm/src/program/program.state.hpp"
	"zasm/src/zasm/src/program/saverestorehelper.hpp"
	"zasm/src/zasm/src/program/saverestoretypes.hpp"
	"zasm/include/zasm/base/immediate.hpp"
	"zasm/include/zasm/base/instruction.hpp"
	"zasm/include/zasm/base/label.hpp"
	"zasm/include/zasm/base/memory.hpp"
	"zasm/include/zasm/base/meta.hpp"
	"zasm/include/zasm/base/mode.hpp"
	"zasm/include/zasm/base/operand.hpp"
	"zasm/include/zasm/base/register.hpp"
	"zasm/include/zasm/core/bitsize.hpp"
	"zasm/include/zasm/core/enumflags.hpp"
	"zasm/include/zasm/core/errors.hpp"
	"zasm/include/zasm/core/expected.hpp"
	"zasm/include/zasm/core/filestream.hpp"
	"zasm/include/zasm/core/math.hpp"
	"zasm/include/zasm/core/memorystream.hpp"
	"zasm/include/zasm/core/objectpool.hpp"
	"zasm/include/zasm/core/packed.hpp"
	"zasm/include/zasm/core/stream.hpp"
	"zasm/include/zasm/core/stringpool.hpp"
	"zasm/include/zasm/core/strongtype.hpp"
	"zasm/include/zasm/decoder/decoder.hpp"
	"zasm/include/zasm/encoder/encoder.hpp"
	"zasm/include/zasm/formatter/formatter.hpp"
	"zasm/include/zasm/program/align.hpp"
	"zasm/include/zasm/program/data.hpp"
	"zasm/include/zasm/program/embeddedlabel.hpp"
	"zasm/include/zasm/program/instruction.hpp"
	"zasm/include/zasm/program/labeldata.hpp"
	"zasm/include/zasm/program/node.hpp"
	"zasm/include/zasm/program/observer.hpp"
	"zasm/include/zasm/program/program.hpp"
	"zasm/include/zasm/program/saverestore.hpp"
	"zasm/include/zasm/program/section.hpp"
	"zasm/include/zasm/program/sentinel.hpp"
	"zasm/include/zasm/serialization/serializer.hpp"
	"zasm/include/zasm/x86/assembler.hpp"
	"zasm/include/zasm/x86/emitter.hpp"
	"zasm/include/zasm/x86/memory.hpp"
	"zasm/include/zasm/x86/meta.hpp"
	"zasm/include/zasm/x86/mnemonic.hpp"
	"zasm/include/zasm/x86/register.hpp"
	"zasm/include/zasm/x86/x86.hpp"
	"zasm/include/zasm/zasm.hpp"
)

find_library(Zydis NAMES Zydis)
find_path(Zydis_INCLUDE_DIR NAMES Zydis/Zydis.h)

if(BUILD_SHARED_LIBS)
	add_library(zasm SHARED)
	if(MSVC)
		set_target_properties(zasm PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS ON)
	endif()
else()
	add_library(zasm STATIC)
endif()

target_compile_features(zasm INTERFACE
	cxx_std_17
)

target_sources(zasm PRIVATE ${zasm_SOURCES})
add_library(zasm::zasm ALIAS zasm)
target_include_directories(zasm PUBLIC
	"zasm/include"
    ${Zydis_INCLUDE_DIR}
)

target_link_libraries(zasm PRIVATE
    ${Zydis} 
)

install(TARGETS zasm
    RUNTIME DESTINATION "bin"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib"
)
install(DIRECTORY "zasm/include/zasm" DESTINATION "${CMAKE_INSTALL_PREFIX}/include")