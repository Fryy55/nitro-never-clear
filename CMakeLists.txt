cmake_minimum_required(VERSION 3.16)

project(NitroNeverClear VERSION 1.0.0 LANGUAGES ASM_NASM)

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS src/*.asm)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE
    src/macros
    src/utils
)
target_compile_options(${PROJECT_NAME} PRIVATE
    -w+all
    -w-reloc
)
target_link_options(${PROJECT_NAME} PRIVATE
    -z noexecstack
    -s
)

# add extra settings/flags here
set(SETTINGS
    [["settings": {
        "nasm.extraFlags": ["-w+all", "-w-reloc", "-I]]
)
get_target_property(INCLUDE_DIRS ${PROJECT_NAME} INCLUDE_DIRECTORIES)

string(JOIN [[", "-I]] INCLUDE_ARGS ${INCLUDE_DIRS})
string(APPEND SETTINGS [[${INCLUDE_ARGS}"]
    }
}]]
)
string(CONFIGURE "${SETTINGS}" SETTINGS)

file(GLOB WORKSPACE_FILE *.code-workspace)
file(READ "${WORKSPACE_FILE}" FILE_CONTENTS)
string(REGEX REPLACE [["settings": {.*}]] "${SETTINGS}" FILE_CONTENTS "${FILE_CONTENTS}")
file(WRITE "${WORKSPACE_FILE}" "${FILE_CONTENTS}")