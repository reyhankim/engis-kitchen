unit uang;

interface
uses tipe;

var
	currentSimulasi : data;

procedure tambahUang(var plusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan jumlah uang dari chef

procedure kurangUang(var minusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi jumlah uang dari chef


implementation

procedure tambahUang(var plusUang:integer);
begin
	currentSimulasi.sum_uang:=currentSimulasi.sum_uang + plusUang;
end;

procedure kurangUang(var minusUang:integer);
begin
	currentSimulasi.sum_uang:=currentSimulasi.sum_uang - minusUang;
end;

end.
