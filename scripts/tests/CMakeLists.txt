include(ZeekPlugin)

zeek_add_test(
    NAME goose-allData
    SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/goose-allData.btest
)
