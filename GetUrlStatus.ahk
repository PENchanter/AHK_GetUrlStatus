;	REF: https://www.autohotkey.com/boards/viewtopic.php?t=1315
;	<provided by> tmplinshi <on date> 2014-01-08
; usage:

MsgBox, % GetUrlStatus("http://items.pw/47ApdKUMcg", 10) ; Wait up to 10 seconds ; should return: 404 or nothing (NULL)
MsgBox, % GetUrlStatus("https://www.autohotkey.com/docs/AutoHotkey.htm") ; should return: 202
Return

GetUrlStatus(URL, Timeout = -1)
{
ComObjError(0)
static WinHttpReq := ComObjCreate("WinHttp.WinHttpRequest.5.1")
WinHttpReq.Open("HEAD", URL, True)
WinHttpReq.Send()
WinHttpReq.WaitForResponse(Timeout) ; Return: Success = -1, Timeout = 0, No response = Empty String
Return, WinHttpReq.Status()
}
