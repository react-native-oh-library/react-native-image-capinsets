
cmake_minimum_required(VERSION 3.13)
set(CMAKE_VERBOSE_MAKEFILE on)
set(rnoh_image_capinsets_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")

file(GLOB rnoh_image_capinsets_SRC CONFIGURE_DEPENDS *.cpp)
file(GLOB_RECURSE rnoh_image_capinsets_generated_SRC "${rnoh_image_capinsets_generated_dir}/**/*.cpp")

add_library(rnoh_image_capinsets SHARED ${rnoh_image_capinsets_SRC} ${rnoh_image_capinsets_generated_SRC})
target_include_directories(rnoh_image_capinsets PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${rnoh_image_capinsets_generated_dir}
    ${CMAKE_CURRENT_SOURCE_DIR}/generated/react/render/components/react_native_image_capinsets
)

target_link_libraries(rnoh_image_capinsets PUBLIC rnoh)