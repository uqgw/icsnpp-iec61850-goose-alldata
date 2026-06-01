module ICSNPP::IEC61850_GOOSE_ALLDATA;

export {
    redef enum Notice::Type += {
        Goose_ConfRev_Mismatch,
        Goose_Unexpected_State_Change
    };
}

event ICSNPP::IEC61850_GOOSE_ALLDATA::LOG(rec: GooseInfo)
    {
    # Example: confRev anomaly
    if ( rec$confRev != null && rec$confRev > 100000 )
        NOTICE([$note=Goose_ConfRev_Mismatch,
                $msg=fmt("Suspicious confRev %d for gocbRef %s", rec$confRev, rec$gocbRef),
                $sub=rec$gocbRef]);

    # Example: state change detection based on allData
    if ( rec$allData != null )
        {
        for (v in rec$allData)
            {
            if ( /"type":"string","value":"TRIP"/ in v )
                NOTICE([$note=Goose_Unexpected_State_Change,
                        $msg=fmt("GOOSE TRIP detected in dataset %s", rec$dataSet),
                        $sub=rec$gocbRef]);
            }
        }
    }
