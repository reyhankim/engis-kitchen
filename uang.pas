unit uang;

interface

procedure tambahUang(var currentSimulasi: tipe.data; plusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan jumlah uang dari chef

procedure kurangUang(var currentSimulasi: tipe.data; minusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi jumlah uang dari chef


implementation

procedure tambahUang(var currentSimulasi: tipe.data; plusUang:integer);
begin
	currentSimulasi.sum_uang=currentSimulasi.sum_uang + plusUang;
end;

procedure kurangUang(var currentSimulasi: tipe.data; minusUang:integer);
begin
	currentSimulasi.sum_uang=currentSimulasi.sum_uang - minusUang;
end;
