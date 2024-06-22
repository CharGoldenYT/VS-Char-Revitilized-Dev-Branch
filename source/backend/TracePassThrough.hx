package backend;

import flixel.system.debug.log.LogStyle;

class TracePassThrough
{
// simple, adds extra shiz yknow. formatting. also adds to the Haxe Core Debugger Log
    static var txt:String;
    static var textLog:String;
    public static function trace(v:Dynamic, type:String = 'default', ?infos:haxe.PosInfos, isLUA = false, luaLine:String = null)
        {
            if (!isLUA){
            txt = infos.fileName + ':' + infos.lineNumber + ':';
            } else if (luaLine == null) {
                txt = ': ';
            } else if (luaLine != null)
            {
                txt = luaLine + ':';
            }
            if (!isLUA){
            textLog = infos.fileName + ':' + infos.lineNumber + ': ' + Std.string(v);
            } else if (luaLine == null) {
                textLog = Std.string(v);
            } else if (luaLine != null)
            {
                textLog = luaLine + ': ' + Std.string(v);
            }
            switch(type.toLowerCase())
            {
                default:
                    txt = txt + Std.string(v);
                    FlxG.log.add(textLog);
                case 'warning':
                    txt = txt + 'WARN: ' + Std.string(v);
                    FlxG.log.advanced(textLog, LogStyle.WARNING);
                case 'warn':
                    txt = txt + 'WARN: ' + Std.string(v);
                    FlxG.log.advanced(textLog, LogStyle.WARNING);
                case 'error':
                    txt = txt + 'ERR: ' + Std.string(v);
                    FlxG.log.advanced(textLog, LogStyle.ERROR);
                case 'err':
                    txt = txt + 'ERR: ' + Std.string(v);
                    FlxG.log.advanced(textLog, LogStyle.ERROR);
                case 'fatal':
                    if (!isLUA) {
                    textLog = ' FATAL:' + infos.fileName + ':' + infos.lineNumber + ': ' + Std.string(v);
                    } else {
                        textLog = 'FATAL:' + textLog;
                    }
                    txt = txt + 'FATAL: ' + Std.string(v);
                    FlxG.log.advanced(textLog, LogStyle.ERROR);
                case 'info':
                    txt = txt + 'INFO: ' + Std.string(v);
            }
            haxe.Log.trace(txt, null);
        }
}