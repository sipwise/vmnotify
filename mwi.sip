NOTIFY sip:$user$@$dsthost$;transport=UDP SIP/2.0
To: <sip:$MBID$@$dsthost$>
From: <sip:voicebox@voip.sipwise.local>;tag=4711
CSeq: 1 NOTIFY
Call-Id: $CALL_ID$
Event: message-summary
Content-Type: application/simple-message-summary
Content-Length: $BODYLEN$

$BODY_MW$
$BODY_VM$
