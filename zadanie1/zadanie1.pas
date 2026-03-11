program zadanie1;

uses
    SysUtils;

type 
    IntList = array[1..50] of integer;

var
    list: IntList;

procedure GenerateNumbers();
    var
        i: integer;
    begin
    Randomize;
    for i := 1 to 50 do
        list[i] := Random(101);
    end;

var
  i: integer;
begin
  GenerateNumbers();
  writeln('Lista: ');
  for i := 1 to 50 do
    write(list[i], ' ');
  writeln;
end.