unit uang;

interface
uses tipe;

var
	currentSimulasi : data;

procedure tambahUang(plusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan jumlah uang dari chef

procedure kurangUang(minusUang:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi jumlah uang dari chef


implementation

procedure tambahUang(plusUang:integer);
begin
	tipe.currentSimulasi.sum_income:=tipe.currentSimulasi.sum_income + plusUang;
	tipe.currentSimulasi.sum_uang:= tipe.currentSimulasi.sum_uang + plusUang;
end;

procedure kurangUang(minusUang:integer);
begin
	tipe.currentSimulasi.sum_outcome:=tipe.currentSimulasi.sum_outcome + minusUang;
	tipe.currentSimulasi.sum_uang:= tipe.currentSimulasi.sum_uang - minusUang;
end;



end.
