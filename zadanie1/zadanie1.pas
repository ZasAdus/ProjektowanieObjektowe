program zadanie1;

uses
    SysUtils;

type 
    IntList = array of integer;

var
    list: IntList;

procedure GenerateNumbers(min, max, count: integer);
    var
        i: integer;
    begin
    if max < min then
    begin
        write('Błąd: niepoprawny zakres, kończenie programu...');
        writeln; 
        Halt;
    end;
    if count < 1 then
    begin
        write('Błąd: nie można wyenerować listy mniejszej od 1, kończenie programu...');
        writeln; 
        Halt;
    end;
    SetLength(list, count);
    Randomize;
    for i := 0 to count - 1 do
        list[i] := min + Random(max - min + 1);
    end;

procedure BubbleSort(); 
var 
    i, j, n, temp: integer; 
    flag: Boolean;
begin 
    n := Length(list); 
    for i := 0 to n - 2 do 
    begin 
        flag := False; 
        for j := 0 to n - i - 2 do 
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

var 
    i, code, number, min, max, count: integer; 
    input: string;
begin
    writeln('Podaj minimalną liczbę:'); 
    readln(input);
    Val(input, number, code);
    if code <> 0 then
    begin
        write('Błąd: podany input nie jest liczbą całkowitą, kończenie programu...');
        writeln; 
        Halt;
    end;
    min := number;
    writeln('Podaj maksymalną liczbę:'); 
    readln(input);
    Val(input, number, code);
    if code <> 0 then
    begin
        write('Błąd: podany input nie jest liczbą całkowitą, kończenie programu...');
        writeln; 
        Halt;
    end;
    max := number;
    writeln('Podaj ile liczb wygenerować:'); 
    readln(input);
    Val(input, number, code);
    if code <> 0 then
    begin
        write('Błąd: podany input nie jest liczbą całkowitą, kończenie programu...');
        writeln; 
        Halt;
    end;
    count := number;
    GenerateNumbers(min, max, count); 
    writeln('Lista przed BubbleSort:'); 
    for i := 0 to Length(list) - 1 do 
        write(list[i], ' '); 
    writeln; 
    BubbleSort(); 
    writeln('Lista po BubbleSort:'); 
    for i := 0 to Length(list) - 1 do 
        write(list[i], ' '); 
    writeln;
end.