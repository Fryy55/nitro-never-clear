cmake_minimum_required(VERSION 3.16)

project(NitroNeverClear VERSION 1.0.0 LANGUAGES ASM_NASM)

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS src/*.asm)

add_executable(${PROJECT_NAME} ${SOURCES})