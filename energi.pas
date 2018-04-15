unit energi;

interface

procedure tambahEnergi(plusEnergi:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan sebuah energi dari chef

procedure kurangEnergi(minusEnergi:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi sebuah energi dari chef


implementation

procedure tambahEnergi(plusEnergi:integer);
begin
	currentSimulasi.energi=currentSimulasi.energi+plusEnergi;
end;

procedure kurangEnergi(minusEnergi:integer);
begin
	currentSimulasi.energi=currentSimulasi.energi-minusEnergi;
end;

end.
