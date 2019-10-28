NOTIFY sip:$user$@$dsthost$;transport=UDP SIP/2.0
Via: SIP/2.0/UDP 127.0.0.1:5081;branch=$BRANCH$;rport;alias
To: <sip:$MBID$@$dsthost$>
From: <sip:voicebox@voicebox.sipwise.local>;tag=4711
CSeq: 1 NOTIFY
Call-Id: $CALL_ID$
Contact: <sip:voicebox@127.0.0.1:5070>
Event: message-summary
User-Agent: Sipwise NGCP Application Server
Content-Type: application/simple-message-summary
Content-Length: $BODYLEN$
$MWI_ID$

$BODY_MW$
$BODY_VM$

