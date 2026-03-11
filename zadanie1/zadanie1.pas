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

procedure BubbleSort(); 
var 
    i, j, n, temp: integer; 
    flag: Boolean;
begin 
    n := 50; 
    for i := 1 to n - 1 do 
    begin 
        flag := False; 
        for j := 1 to n - i do 
        begin 
            if list[j] > list[j+1] then 
            begin 
                temp := list[j]; 
                list[j] := list[j+1]; 
                list[j+1] := temp; 
                flag := True; 
            end; 
        end; 
        if not flag then
            exit;
    end; 
end;

var i: 
    integer; 
begin 
    GenerateNumbers(); 
    writeln('Lista przed BubbleSort:'); 
    for i := 1 to 50 do 
        write(list[i], ' '); 
    writeln; 
    BubbleSort(); 
    writeln('Lista po BubbleSort:'); 
    for i := 1 to 50 do 
        write(list[i], ' '); 
    writeln;
end.