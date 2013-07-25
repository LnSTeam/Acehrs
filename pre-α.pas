//**********************************
//*Project:ACE Hotel Rooms System  *
//*Version:V6.0(Pre-¦Á)             *
//*Progeramming Code:Dev. Version  *
//*Program Lines(Info In):         *
//*Programming Ver List:           *
//*   6.0 Pre-¦Á                    *
//*Program By L&S Team.            *
//**********************************
uses dos;
var rooms:array[1..1000] of record
                             sts:1..4;//1=Setting;2=Full;3=Null;4=No Use.2.3Final Edit.Orig.var to integer.
                             nam:string[10];//3.0Add, pepole name.
                             group:string;
                            end;
    re:record mon:longint; an:longint; end; //Record all money and check in/out.
    rec,rm,reco:text;//rec:Record the opreating log.2.4Add.rm:Record the rooms.3.4Add
    i:1..1000;
    code:word;
procedure log(s:string);  //5.0Add.
var h,m,sec,s100:word;
    y,mon,d,dw:word;
begin
 getdate(y,mon,d,dw);
 gettime(h,m,sec,s100);
 writeln(rec,y,'-',mon,'-',d,' ',h,':',m,':',sec,'.',s100,': ',s);
end;
procedure command(cmd:string);forward;//Forward use.
procedure helpi;//Help List
begin
 writeln(' ===Help V6.0 Pre-¦Á===');
 writeln(' help       Get some help.');
 writeln(' use        Change a room into Using.');//3.5Edit
 writeln(' set        Set a rooms status and the name.');//4.0Add
 writeln(' cluse      Change a room into No using.');//3.5Add
 writeln(' ls         List the rooms status and more or List some rooms status and more. You can save it to a file.');
 writeln(' sr         Print a rooms status.');//2.1Add,3.0Edit
 //writeln(' ipr        List some rooms status.');//2.2Add,3.0Edit
 //writeln(' gpuse      Change some rooms into Using for a group.');
 //writeln(' gpcluse    Change some rooms into No using for a group.');
 writeln(' record     Print the records.');
 writeln(' abt        About this system.');//2.3Add,3.1Edit,short the command.
 writeln(' exit       Exit this system.');
 writeln(' These softwares was programmed by FreePascal and Lazarus.');//3.5Add
 writeln(' Copyright 2008-2013 L&S Team [OpenSource][Freeware]');
 writeln(' 2013-7-1');
 log('Help');//2.4Add
 command('');
end;
procedure recordi;//5.0Preview1Add.
begin
 writeln(' Money:',re.mon,' Check in/out:',re.an);
 log('Record');
end;
procedure help_cmd;//5.0b8Add.
begin
 writeln(' ===Usage V6.0 Pre-¦Á===');
 writeln(' acehrsys [cmd]');
 writeln('  cmd: These commands:');
 helpi;
 log('Usage');
end;
procedure about;//This procedure has many edits at 3.1 verison.
begin
 writeln(' ===About V6.0 Pre-¦Á===');
 writeln(' [OpenSource][Freeware]');
 writeln(' Copyright 2008-2013 L&S Team');
 writeln(' ACE Hotel Rooms System:');
 writeln('  Version 6.0 Pre-¦Á');
 writeln('  Coding Code:Dev. Version');
 writeln('  OS (Just for the pre-complied version) :');
 writeln('   Windows 98/2000/XP/Vista/7/8 ');
 writeln(' System Tools:');
 writeln('  acehrsclr.exe    System records cleaner.');
 writeln('  acehrsmset.exe   System price setting.');//3.5Add;
 writeln(' Developers:');
 writeln('  Pater Lv (laosb@lasteam.net) System Kernel Design & Coder');
 writeln('  Cao Yani (374644153@qq.com) System Tester');
 writeln('   Mike Zhuo (zzxzhuo@lasteam.net) System Main Developer & Captain of team');
 writeln('  Ted Zhang (tedzhang@lasteam.tk) System Main Developer');
 writeln(' Press Enter to go on...');
 readln;
 writeln(' Web Pages:');
 writeln('  http://acehrs.sf.net/ (Thanks SourceForge.net)');
 writeln('  http://acehrs.lasteam.tk/ (Thanks GitHub)');
 writeln('  http://laosb.lasteam.tk/ (Pater Lv)');
 writeln('  http://www.lasteam.net/');
 writeln(' Blogs:');
 writeln('  http://laosb.lasteam.tk/ (Pater Lv)');
 writeln('  http://zzxzhuo.lasteam.tk/ (Mike Zhuo)');
 writeln(' Wibo(Tencent):');
 writeln('  @aceworkshop (Pater Lv)');
 writeln('  @lastran (Team)');
 writeln('  @zzxzhuo (MikeZhuo)');
 writeln(' Source Code:');
 writeln('  acehrsys.pas    System source code.');
 writeln('  acehrsclr.pas   System cleaner source code.');
 writeln('  acehrsmfset.pas System Price settings source code.');
 writeln(' >I am happy to got a lot of support with my netfriends.');
 writeln('                                         ----By Pater Lv');
 writeln(' >Oh...OK,Okay,I agree...');
 writeln('          ----By Pater Lv');
 log('About');//2.4Add
 command('');
end;
procedure ipr;//2.2Add
var beginp,endp:integer;//Save part begin point and end point,"i" is loop couter.
    status:string;//Save status.
begin
 write(' Please enter the beginning of the area(1-1000):');
 readln(beginp);
 if (beginp<1) or (beginp>1000) then begin
  writeln(' E:This is not a room number. Back to command line.');
  log('Ipr [Error: BEGERR]');//2.4Add
  command('');
 end;
 write(' Please enter the ending of the area(1-1000):');
 readln(endp);
 if (beginp>endp) or ((endp<1) or (endp>1000)) then begin
  writeln(' E:This is not a room number. Back to command line.');
  log('Ipr [Error: ENDERR]');//2.4Add
  command('');
 end;
 writeln(' ===Rooms List(',beginp,' to ',endp,') V6.0 Pre-¦Á===');
 writeln(' No.|Status |Name');
 for i:=beginp to endp do begin
  if rooms[i].sts=1 then status:='Setting';
  if rooms[i].sts=2 then status:='Full';
  if rooms[i].sts=3 then status:='Null';
  if rooms[i].sts=4 then status:='Not use';
  writeln(i:5,'|',status,'|',rooms[i].nam);
 end;
 writeln('============');//2.4Add
 log('Ipr');//2.4Add
 command('');
end;
procedure sr;//2.1Add
var room:integer;
    st:string;//Save status.
begin
 write(' Please enter the room number:');
 readln(room);
 if (room<0) or (room>1000) then begin
  writeln(' E:It is not a room.');
  log('Sr [ERROR]');
  command('');
 end;
 if rooms[room].sts=1 then st:='Setting';
 if rooms[room].sts=2 then st:='Full';
 if rooms[room].sts=3 then st:='Null';
 if rooms[room].sts=4 then st:='No use';
 writeln(' Status:',st,' Name:',rooms[room].nam);
 log('Sr');//2.4Add
 command('');
end;
procedure seti;//Set status.This procedure have a big edited at 2.0 verison.
var num,st:integer;//num:Save room number. st:Status.
    nam:string[10];//nam:Save recorded name.
begin
 write(' Room number:');
 readln(num);
 write(' How is it(1=Setting;2=Full;3=Null;4=No use):');
 readln(st);
 writeln(' Name:');
 readln(nam);
 if (st<0) or (st>4) then begin //input is not in 1 to 4.
  writeln(' E:It is wrong.');
  log('Set [Error: STERR]');//2.4Add
  command('');
 end;
 rooms[num].sts:=st;
 rooms[num].nam:=nam;//3.0Edit
 writeln(' OK.');
 log('Set');//2.4Add
 command('');
end;//This procedure is no-uses.3.5Del.4.0Add
procedure cluse;
var mf:text;//Read the Money List
    money,time,room,amoney:longint;
    yn:char;//5.0b8Add.
begin
 assign(mf,'money.acehrsys');
 reset(mf);
 readln(mf,money);
 close(mf);
 if money=0 then begin
  writeln('E:The price is not right. Please set the price by acehrsmfset . Do you want to run it? [Y/N]');//5.0b8Edit.
  readln(yn); //5.0b8Add. Run the acehrsmfset .
  if (yn='Y')or(yn='y') then exec('acehrsmfset','');//No param.
  exit;
 end;
 write(' How many days does she/he stay:');
 readln(time);
 write(' What room does that person use(1-1000):');
 readln(room);
 if rooms[room].sts=3 then begin write('E:There is no one in this room. Back to Command Line.'); exit; end;
 if (room<1)or(room>1000) then begin
  writeln(' E:It is not a room number. Back to Command Line.');
  log('Cluse [ERROR]');
  command('');
 end;
 rooms[room].sts:=3;
 rooms[room].nam:='No in';
 amoney:=money*time;
 writeln('Price:',amoney); //5.0Preview1Edit. Remove "RMB".
 inc(re.mon,amoney);
 inc(re.an);
 log('Cluse');
 writeln('OK');
 command('');
end;
procedure use;//3.5Add
var room:0..1000;
    iname:string;
    i:1..1000;
begin
 write(' Please enter the room number which you want to use or enter 0 to auto select a room to use (0..1000):');
 readln(room);
 if room=0 then begin //5.0b7Add. Auto-select
  writeln(' Seaching a room to use...');
  for i:=1 to 1000 do
   if rooms[i].sts=3 then begin room:=i; exit; end;
   writeln(' Find a room. The room is ',room,'.');
 end;
 write(' Please enter the name of that personal who want to use:');
 readln(iname);
 if rooms[room].sts=2 then begin writeln(' E:This room is used. Come back to command line.'); command(''); exit; end;
 rooms[room].nam:=iname;
 rooms[room].sts:=2;
 inc(re.an);
 log('Use');
 writeln(' OK!');
 command('');
end;
procedure ls;//List Of Rooms
var status:string;//Room status.
    filetf:string;//Save file if use.2.0Add
    f:text;//File.2.0Add
    boo:char;//5.0Preview2Add.
begin
 writeln(' What do you want to do?(A=List all rooms;P=List rooms in a part)');
 readln(boo);
 if ((boo='A') or (boo='a')) then ipr;//In the UNIX-based OS kernels, the UPCASE char & lowcase char is different.
 writeln(' ===Rooms List V6.0 Pre-¦Á===');
 writeln(' No. |Status |Name');
 for i:=1 to 1000 do begin
  if rooms[i].sts=1 then status:='Setting';
  if rooms[i].sts=2 then status:='Full';
  if rooms[i].sts=3 then status:='Null';
  if rooms[i].sts=4 then status:='No use';
  writeln(i:5,'|',status,'|',rooms[i].nam);
 end;
 writeln('============');//2.4Add
 write(' Save rooms list to file?(File path:"%Program Path%/room.stat")(Y/N):');//2.0AddBegin
 readln(filetf);
 if (filetf='Y') or (filetf='y') then begin
  assign(f,'room.stat');
  rewrite(f);
  writeln(f,' ===Rooms List V6.0 Pre-¦Á===');
  writeln(f,' No. |Status |Name');
  for i:=1 to 1000 do
  begin
   if rooms[i].sts=1 then status:='Setting';
   if rooms[i].sts=2 then status:='Full';
   if rooms[i].sts=3 then status:='Null';
   if rooms[i].sts=4 then status:='No use';
   writeln(f,i:5,'|',status,'|',rooms[i].nam);
  end;
  close(f);
  writeln(' File is saved.');
  log('Ls [Save]');//2.4Add
  command('');
 end
 else begin//2.4EditBegin
  writeln(' No saving.');//2.0AddEnd.2.3Edit,Orig. not have " ".
  log('Ls [No Save]');//2.4Add
  command('');
 end;
end;
procedure exiti;//2.4Add
var yn:char;
begin
 write('Are you sure to exit?[Y/N]'); readln(yn); //5.0b8Add.
 if (yn='n')or(yn='N') then exit;
 log('===Log End===');
 close(rec);
 assign(rm,'record.rooms'); rewrite(rm);
 for i:=1 to 1000 do
  writeln(rm,rooms[i].sts,' ',rooms[i].nam);//3.4Add
 close(rm);
 assign(reco,'record.acehrsys');
 rewrite(reco);
 writeln(reco,re.mon,' ',re.an);
 close(reco);
 halt;
end;
procedure command(cmd:string);//Commands Shell
begin
 write('>');
 if cmd='' then readln(cmd);
 //Under there are Commands Shell List.
 if cmd='help' then helpi;
 if cmd='--help' then help_cmd;//5.0b8Add, the usage for command-line mode.
 if cmd='/?' then help_cmd;//5.0Preview2Add, the DOS-like call help at command-line mode.
 if cmd='?' then helpi;//5.0Preview2Add, the shortest way to get help.
 if cmd='set' then seti;//2.0Edit,Orig.:if cmd='setting'......{3.5Del}{4.0Restore}
 if cmd='use' then use;
 if cmd='cluse' then cluse;
 if cmd='ls' then ls;
 //if cmd='ipr' then ipr;//2.2Add,5.0Preview2Del. You can use "ipr" in "ls".
 if cmd='sr' then sr;//2.1Add
 if cmd='abt' then about;//2.3Add,3.0Edit
 if cmd='record' then recordi;//5.0Preview1Add.
 if cmd='exit' then exiti;//2.4Edit,Orig.:if cmd='exit' then halt;
//In last three lines,it's not a command.If delect this...2.3Edit,Orig. have "else".
 writeln(' E:It is not a command. Back.');
 log('Command [Error]');
 command('');
 end;
begin//Main program has a big edit at 2.2 verison.
 writeln(' Loading...');
 write(' Loading rooms array...');
 for i:=1 to 1000 do begin rooms[i].sts:=3; rooms[i].nam:='No in'; end;//2.3Final Edit,Orig.:for i:=1 to 1000 do rooms[i]:=3; and delect var with i.3.0Edit,Resume to Orig..
 writeln('[OK]');
 write(' Loading records...');
 assign(reco,'records.acehrsys');
 reset(reco);
 read(re.mon,re.an);
 close(reco);
 writeln('[OK]');
 write(' Starting log...(Log Path:%Program Path%\acehrs.log)');//2.4AddBegin
 assign(rec,'acehrs.log');
 append(rec);
 log('===Log Start===');
 writeln('[OK]');
 write(' Looking for command-line commands...');
 if paramstr(1)<>'' then begin
  writeln('[Found some commands]');
  command(paramstr(1))
 end
                    else writeln('[Commands not found]');
 write(' Loading rooms array...');//3.4AddBegin
 assign(rm,'record.rooms');
 reset(rm);
 for i:=1 to 1000 do begin
  read(rm,rooms[i].sts);
  readln(rm,rooms[i].nam);
 end;
 close(rm);
 writeln('[OK]');//3.4AddEnd
 writeln(' ===ACE Hotel Rooms System Version V6.0 Pre-¦Á===');
 writeln(' Type "?" or "help" to get help, or type "abt" to get more infomation.'); //5.0b8Edit.
 command('');
end.

