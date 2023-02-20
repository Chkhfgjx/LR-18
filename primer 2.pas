
begin
  var file_dlya_zabora_dannykh:text;
  var file_dlya_vyvoda_dannykh:text;
  assign(file_dlya_zabora_dannykh, 'D:\Учеба\МДК 05.02  Разработка кода информационных систем\Лабы\ЛР 18\filein_for_2.txt');
  assign(file_dlya_vyvoda_dannykh, 'D:\Учеба\МДК 05.02  Разработка кода информационных систем\Лабы\ЛР 18\fileout_for_2.txt');
  
  var Dannye:array of string;
  
  Reset(file_dlya_zabora_dannykh);
  var kolichestvo_strok:=0;
  while not eof(file_dlya_zabora_dannykh) do begin
    kolichestvo_strok += 1;
    readln(file_dlya_zabora_dannykh);
  end;
  
  SetLength(Dannye, kolichestvo_strok + 1);
  
  for var i:=1 to kolichestvo_strok do begin
    while not eoln(file_dlya_zabora_dannykh) do begin
      Read(file_dlya_zabora_dannykh, Dannye[i]);
    end;  
  end;  
  
  close(file_dlya_zabora_dannykh);
  Rewrite(file_dlya_vyvoda_dannykh);
  
  for var i:=kolichestvo_strok downto 1 do begin
    writeln(file_dlya_vyvoda_dannykh, Dannye[i]);
  end;
  
  close(file_dlya_vyvoda_dannykh);
end.