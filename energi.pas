unit energi;

interface
uses tipe;

procedure tambahEnergi(plusEnergi:integer);
procedure kurangEnergi(minusEnergi:integer);


implementation

procedure tambahEnergi(plusEnergi:integer);
{Menambahkan jumlah energi dari Chef ketika melakukan sebuah aksi}
{I.S. : Chef sudah ada energi yang tersimpan pada dirinya
* F.S. : Energi Chef bertambah ketika melakukan suatu aksi yang menambahkan energi}

{ALGORITMA LOKAL}
begin
	tipe.currentSimulasi.energi:= tipe.currentSimulasi.energi+ plusEnergi;
end;


procedure kurangEnergi(minusEnergi:integer);
{Mengurangi jumlah energi dari Chef ketika melakukan sebuah aksi}
{I.S. : Chef sudah ada energi yang tersimpan pada dirinya
* F.S. : Energi Chef berkurang ketika melakukan suatu aksi yang menambahkan energi}

{ALGORITMA LOKAL}

begin
	tipe.currentSimulasi.energi:= tipe.currentSimulasi.energi- minusEnergi;
end;
	
end.
