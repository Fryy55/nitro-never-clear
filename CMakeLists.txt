cmake_minimum_required(VERSION 3.16)

project(NitroNeverClear VERSION 1.0.0 LANGUAGES ASM_NASM)

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS src/*.asm)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE
    src/macros
    src/data
    src/utils
)

# add extra flags and settings here
set(NASM_FLAGS -w+all -w-reloc)
set(SETTINGS
    [["settings": {
        "nasm.extraFlags": []]
)

include(cmake/asm-setup.cmake)