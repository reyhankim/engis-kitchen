unit uang;

interface
uses tipe;

var
	currentSimulasi : data;

procedure tambahUang(plusUang:integer);
procedure kurangUang(minusUang:integer);

implementation

procedure tambahUang(plusUang:integer);
{Menambahkan uang dari Chef ketika melakukan suatu kegiatan}
{I.S. : Chef sudah memiliki uang yang telah tersimpan di dirinya
* F.S. : Uang yang dimiliki chef akan bertambah ketika melakukan suatu aksi}

{ALGORITMA LOKAL}
begin
	tipe.currentSimulasi.sum_income:=tipe.currentSimulasi.sum_income + plusUang;
	tipe.currentSimulasi.sum_uang:= tipe.currentSimulasi.sum_uang + plusUang;
end;

procedure kurangUang(minusUang:integer);
{Mengurangi uang dari Chef ketika melakukan suatu kegiatan}
{I.S. : Chef sudah memiliki uang yang telah tersimpan di dirinya
* F.S. : Uang yang dimiliki chef akan berkurang ketika melakukan suatu aksi}

{ALGORITMA LOKAL}

begin
	tipe.currentSimulasi.sum_outcome:=tipe.currentSimulasi.sum_outcome + minusUang;
	tipe.currentSimulasi.sum_uang:= tipe.currentSimulasi.sum_uang - minusUang;
end;


end.
