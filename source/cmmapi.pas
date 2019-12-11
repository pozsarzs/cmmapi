{ +--------------------------------------------------------------------------+ }
{ | CMMAPI v0.1 * Command line utility for MMAPI library                     | }
{ | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@szerafingomba.hu>          | }
{ | cmmapi.pas                                                               | }
{ | Source code                                                              | }
{ +--------------------------------------------------------------------------+ }

// This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

program cmmapi;
const
  PRGNAME='cmmapi';
  PRGVER='0.1';

function address: pchar; cdecl; external 'mmapi';
function city: pchar; cdecl; external 'mmapi';
function devicedata(line: byte): pchar; cdecl; external 'mmapi';
function deviceportsname(line: byte): pchar; cdecl; external 'mmapi';
function devicetype: pchar; cdecl; external 'mmapi';
function deviceversion: pchar; cdecl; external 'mmapi';
function growinghousenumber: pchar; cdecl; external 'mmapi';
function uid(id: pchar): pchar; cdecl; external 'mmapi';
function url(u: pchar): pchar; cdecl; external 'mmapi';
function username: pchar; cdecl; external 'mmapi';
function version: pchar; cdecl; external 'mmapi';
procedure getdata; cdecl; external 'mmapi';
procedure getinfo; cdecl; external 'mmapi';

procedure showusage;
begin
  writeln('Usage:');
  writeln('  '+PRGNAME+' [command] [parameters]');
  writeln('  '+PRGNAME+' -h | --help     show usage');
  writeln('  '+PRGNAME+' -v | --version  show version information');
  writeln('  '+PRGNAME+' data uid url    write measured data');
  writeln('  '+PRGNAME+' device uid url  write device info');
  writeln('  '+PRGNAME+' ports uid url   write name of ports and error lights');
  writeln('  '+PRGNAME+' user uid url    write information about user');
  writeln;
end;

procedure showversion;
begin
  writeln(upcase(PRGNAME)+' version: '+PRGVER);
  writeln('MMAPI library version: ',version);
  writeln;
  writeln('This program was compiled at ',{$I %TIME%},' on ',{$I %DATE%},
    ' by ',{$I %USER%});
  writeln('FPC version: ',{$I %FPCVERSION%});
  writeln('Target OS:   ',{$I %FPCTARGETOS%});
  writeln('Target CPU:  ',{$I %FPCTARGETCPU%});
  halt(0);
end;

procedure showbadparameters;
begin
  writeln('Bad command line parameters. Use -h or --help to usage.');
end;

procedure writedatatostdout(suid, surl: ansistring; mode: byte);
var
  b: byte;
begin
  uid(pchar(suid));
  url(pchar(surl));
  if mode=3
    then getdata
    else getinfo;
  case mode of
    0: begin
         writeln(devicetype);
         writeln(deviceversion);
       end;
    1: begin
         writeln(username);
         writeln(city);
         writeln(address);
         writeln(growinghousenumber);
       end;
    2: for b:=0 to 31 do
         if length(deviceportsname(b))>0
           then writeln(deviceportsname(b));
    3: for b:=0 to 31 do
         if length(devicedata(b))>0
           then writeln(devicedata(b));
  end;
end;

begin
  if (paramcount=0) or (paramcount=2) then showusage;
  if paramcount=1 then
  case paramstr(1) of
    '-h':        showusage;
    '-v':        showversion;
    '--help':    showusage;
    '--version': showversion;
  else showbadparameters;
  end;
  if paramcount=3 then
  case paramstr(1) of
    'data':   writedatatostdout(paramstr(2),paramstr(3),3);
    'device': writedatatostdout(paramstr(2),paramstr(3),0);
    'ports':  writedatatostdout(paramstr(2),paramstr(3),2);
    'user':   writedatatostdout(paramstr(2),paramstr(3),1);
  else showbadparameters;
  end;
  halt(0);
end.
