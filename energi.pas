unit energi;

interface
uses tipe;
var
  currentSimulasi :data;

procedure tambahEnergi(var plusEnergi:integer);
//prosedur dimana ketika melakukan suatu aksi akan menambahkan sebuah energi dari chef

procedure kurangEnergi(var minusEnergi:integer);
//prosedur dimana ketika melakukan suatu aksi akan mengurangi sebuah energi dari chef


implementation

procedure tambahEnergi(var plusEnergi:integer);
begin
	currentSimulasi.energi:= currentSimulasi.energi+ plusEnergi;
end;

procedure kurangEnergi(var minusEnergi:integer);
begin
	currentSimulasi.energi:= currentSimulasi.energi- minusEnergi;
end;

end.
