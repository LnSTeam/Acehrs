//ACE Hotel Rooms System
//Cleaner
//for v6.0
var log:text;
    yn:string[1];
    i:integer;
begin
 writeln('===ACE Hotel Rooms System Temp File Clear Tools(On v6.0.0 Pre-¦Á===');
 write('>Clearing acehrs.log...');
 assign(log,'acehrs.log');
 rewrite(log);
 close(log);
 writeln('[OK]');
 write('>Clearing room.stat...');
 assign(log,'room.stat');
 rewrite(log);
 close(log);
 writeln('[OK]');
 writeln('>Clear OK.');
 write('>Can I clear the record.rooms and record.acehrsys (y/n)? WARNING!:This option can clear rooms info!');
 readln(yn);
 if yn='n' then halt;
 write('>Clearing record.rooms...');
 assign(log,'record.rooms');
 rewrite(log);
 for i:=1 to 1000 do writeln(log,3,' ','No in');
 close(log);
 assign(log,'record.acehrsys');
 rewrite(log);
 writeln(log,'0 0');
 writeln('[OK]');
 writeln('>Clear OK.');
 readln;
end.
