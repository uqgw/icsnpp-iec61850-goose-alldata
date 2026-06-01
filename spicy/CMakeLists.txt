set(SPICY_SOURCES
    goose.spicy
)

spicy_add_analyzer(
    NAME goose
    SOURCES ${SPICY_SOURCES}
    SCRIPTS ../scripts/main.zeek
    SCOPE ICSNPP::IEC61850_GOOSE_ALLDATA
)

add_library(spicy-goose STATIC ${SPICY_SOURCES})
