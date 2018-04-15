unit uang;

uses tipe;

interface

var
  currentSimulasi : data;
  
  
procedure tambahUang(plusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan jumlah uang dari chef

procedure kurangUang(minusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi jumlah uang dari chef


implementation

procedure tambahUang(plusUang:integer);
begin
	currentSimulasi.sum_uang=currentSimulasi.sum_uang + plusUang;
end;

procedure kurangUang(minusUang:integer);
begin
	currentSimulasi.sum_uang=currentSimulasi.sum_uang - minusUang;
end;

end.
