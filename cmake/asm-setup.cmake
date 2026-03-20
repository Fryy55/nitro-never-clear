target_compile_options(${PROJECT_NAME} PRIVATE ${NASM_FLAGS})

target_link_options(${PROJECT_NAME} PRIVATE
    -z noexecstack
    -s
)

get_target_property(INCLUDE_DIRS ${PROJECT_NAME} INCLUDE_DIRECTORIES)

string(JOIN [[", "-I]] INCLUDE_ARGS ${INCLUDE_DIRS})
string(JOIN [[", "]] NASM_ARGS ${NASM_FLAGS})
string(APPEND SETTINGS [["${NASM_ARGS}", "-I${INCLUDE_ARGS}"]
    }
}]]
)
string(CONFIGURE "${SETTINGS}" SETTINGS)

file(GLOB WORKSPACE_FILE *.code-workspace)
file(READ "${WORKSPACE_FILE}" FILE_CONTENTS)
string(REGEX REPLACE [["settings": {.*}]] "${SETTINGS}" FILE_CONTENTS "${FILE_CONTENTS}")
file(WRITE "${WORKSPACE_FILE}" "${FILE_CONTENTS}")