//ACE Hotel Rooms System
//Price Tool
//Ver v1.0.3
//for v5.0
var mf:text;
    money:real;
begin
 write('Loading...');
 assign(mf,'money.acehrsys');
 rewrite(mf);
 writeln('[OK]');
 writeln('===ACE Hotel Rooms System Price Setting v1.0.3 (on v5.0.0beta8)===');
 write('Setting the price for 1 room in 1 day(RMB):');
 readln(money);
 if money<=0 then begin writeln('Error.'); halt; end;
 writeln(mf,money);
 close(mf);
 writeln('Set OK.');
end.
