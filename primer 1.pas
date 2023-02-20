const MAXSIZE = 50;
type Stack = record  { стек рассчитан на 50 символов }
      tags: array[1..MAXSIZE] of char;
      size: integer; { число элементов }
     end;
     
procedure Push( var S: Stack; x: char);
begin
  if S.size = MAXSIZE then Exit;  // выход, если произошло переполнение стека
  S.size := S.size + 1;
  S.tags[S.size] := x; // добавляем элемент
end;

function Pop ( var S:Stack ): char;
begin
  if S.size = 0 then begin
    Result := char(255); // 255 - пустой символ, ошибка - стек пуст
    Exit;
  end;
  Result := S.tags[S.size];
  S.size := S.size - 1;
end;

function isEmptyStack ( S: Stack ): Boolean;
begin
  Result := (S.size = 0);
end;

  var  expr: string;
    br1, br2: char;  { угловые скобки }
    i, k: integer;
    upper: char;    { верхний символ, снятый со стека }
    error: Boolean; { признак ошибки }
    S: Stack;
    
begin
  br1 := '<'; br2 := '>';
  S.size := 0;
  error := False;
  writeln('Введите html-текст');
  readln(expr);
  
  
  for i:=1 to length(expr) { проходимся по всем символам строки expr }
 do begin
       if expr[i] = br1 then begin { открывающая скобка < }
        Push(S, expr[i]); { втолкнуть в стек }
        break;
      end;
      if expr[i] = br2  then begin { закрывающая скобка < }
        upper := Pop(S); { снять символ со стека }
        error := upper <> br1; { ошибка: стек пуст или не та скобка }
        break;
      end;
 
    if error then break; // была ошибка, значит, прерываем цикл
  end; { здесь вставляется цикл с обработкой строки } 
  
  
  if not error  and  isEmptyStack(S) then
       writeln('Текст верный.')
  else writeln('Текст составлен неверно.')
end.