//ACE Hotel Rooms System
//Price Tool
//for v6.0
var mf:text;
    money:real;
begin
 write('Loading...');
 assign(mf,'money.acehrsys');
 rewrite(mf);
 writeln('[OK]');
 writeln('===ACE Hotel Rooms System Price Setting Tools(on v6.0 Pre-¦Á)===');
 write('Setting the price for 1 room in 1 day(RMB):');
 readln(money);
 if money<=0 then begin writeln('Error.'); halt; end;
 writeln(mf,money);
 close(mf);
 writeln('Set OK.');
end.
