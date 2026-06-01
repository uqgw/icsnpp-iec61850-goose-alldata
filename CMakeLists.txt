cmake_minimum_required(VERSION 3.5)
project(icsnpp-iec61850-goose-alldata)

find_package(Zeek REQUIRED)
include(ZeekPlugin)

add_subdirectory(spicy)
add_subdirectory(tests)

zeek_plugin_begin(ICSNPP IEC61850_GOOSE_ALLDATA)
    zeek_plugin_cc()
    zeek_plugin_link_library(spicy-goose)
zeek_plugin_end()
