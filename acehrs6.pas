{
********************
 Acehrs V6 Pre-apha
 With MySQL Storage
--------------------
Copyright 2008-2013
L&S Team. 
KERNEL
}

const version="v6.0.0 Pre-alpha";
       ver="v6";
       db-cfgfile="db.cfg";
       logfile="acehrs.log"

var db-cfg:text;
    log:text;
    
//Every function has their return value. All returan values are in long integer.
function log(content:string);
begin
 
function init:longint;
begin
 write('Welcome! System is initizing...<br/>');
 write('Starting log...<br/>');
 assign(log,logfile);
       