unit energi;

interface

procedure tambahEnergi(var currentSimulasi: tipe.data; plusEnergi:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan sebuah energi dari chef

procedure kurangEnergi(var currentSimulasi: tipe.data; minusEnergi:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi sebuah energi dari chef


implementation

procedure tambahEnergi(var currentSimulasi:tipe.data; plusEnergi:integer);
begin
	currentSimulasi.energi=currentSimulasi.energi+plusEnergi;
end;

procedure kurangEnergi(var currentSimulasi:tipe.data; minusEnergi:integer);
begin
	currentSimulasi.energi=currentSimulasi.energi-minusEnergi;
end;
