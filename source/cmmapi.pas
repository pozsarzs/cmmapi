program cmmapi;
uses
  mmapi;
const
  PRGNAME='cmmapi';
  PRGVER='0.1';

procedure usage;
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

procedure version;
begin
  writeln(PRGNAME+' v'+PRGVER);
  writeln;
  writeln('This application was compiled at ',{$I %TIME%},' on ',{$I %DATE%},
    ' by ',{$I %USER%});
  writeln('FPC version: ',{$I %FPCVERSION%});
  writeln('Target OS:   ',{$I %FPCTARGETOS%});
  writeln('Target CPU:  ',{$I %FPCTARGETCPU%});
  halt(0);
end;

procedure badparameters;
begin
  writeln('Bad command line parameters. Use -h or --help to usage.');
end;

procedure writedatatostdout(mode: byte);
var
  b: byte;
begin
  uid(paramstr(2));
  url(paramstr(3));
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
  if (paramcount=0) or (paramcount=2) then usage;
  if paramcount=1 then
  case paramstr(1) of
    '-h':        usage;
    '-v':        version;
    '--help':    usage;
    '--version': version;
  else badparameters;
  end;
  if paramcount=3 then
  case paramstr(1) of
    'data':   writedatatostdout(3);
    'device': writedatatostdout(0);
    'ports':  writedatatostdout(2);
    'user':   writedatatostdout(1);
  else badparameters;
  end;
  halt(0);
end.