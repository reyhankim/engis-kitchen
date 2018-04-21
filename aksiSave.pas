unit aksiSave;


interface

uses tipe;

procedure saveInventori();
procedure saveResep();
procedure saveSimulasi();

implementation

function convInttoStr (X:integer) : string;
{Mengubah tipe integer menjadi string}
{I.S. : masukan X yang berupa integer
* F.S. : keluaran yang berupa string}


{ALGORITMA LOKAL}
begin
Str(X, convInttoStr)
end;

procedure saveInventori();
{Menyimpan inventori Simulasi ke dalam file eksternal listInvenMentah.dat dan listInvenOlahan.dat}
{I.S. : Inventori tersimpan di arrInvMentah dan arrInvOlahan
* F.S. : Inventori tersimpan di file eksternal "listInvenMentah.dat" dan "listInvenOlahan.dat"}

{KAMUS LOKAL}
var
i,j : integer;
temp : string; {variabel untuk menyimpan input dari arrInvMentah dan arrInvOlahan secara sementara, sebelum ditulis ke file eksternal}
Mentah, Olahan : textfile; {nama file eksternal}

{ALGORITMA LOKAL}
begin
assign(Mentah, 'listInvenMentah.dat');
rewrite(Mentah);
i := 1;
while (arrInvMentah[i].nama<>'') do {Berhenti ketika arrInvMentah[i] kosong}
begin
	temp := arrInvMentah[i].nama + ' | ' + convInttoStr(arrInvMentah[i].dd)+'/'+convInttoStr(arrInvMentah[i].mm)+'/'+convInttoStr(arrInvMentah[i].yy)+' | '+convInttoStr(arrInvMentah[i].jumlah); {Menyimpan input sebelum dimasukkan ke file eksternal "lisInvenMentah.dat"}
	writeln(Mentah, temp);
	i := i +1;
end;
close(Mentah);
assign(Olahan, 'listInvenOlahan.dat');
rewrite(Olahan);
j := 1;
while(arrInvOlahan[j].nama<>'') do {Berhenti ketika arrInvOlahan[i] kosong}
begin
	temp := arrInvOlahan[j].nama + ' | ' + convInttoStr(arrInvOlahan[j].dd)+'/'+convInttoStr(arrInvOlahan[j].mm)+'/'+convInttoStr(arrInvOlahan[j].yy)+' | ' + convInttoStr(arrInvOlahan[j].jumlah); {Menyimpan input sebelum dimasukkan ke file eksternal "lisInvenOlahan.dat"}
	writeln(Olahan, temp);
	j := j +1;
end;
close(Olahan);
end;



procedure saveResep();
{Menyimpan seluruh resep pada arrResep ke dalam file eksternal resep.dat} 
{I.S. : Resep tersimpan di arrResep
* F.S. : Resep tersimpan di file eksternal "resep.dat"}

{KAMUS LOKAL}
var
resep : textfile; {nama file eksternal}
i,j	  : integer;
temp  : string; {variabel untuk menyimpan input dari arrResep secara sementara, sebelum ditulis ke file eksternal}

{ALGORITMA LOKAL}
begin
assign(resep, 'resep.dat');
rewrite(resep);
i:= 1;
while (arrResep[i].nama <> '') do {Berhenti ketika arrResep[i] kosong}
	begin
	temp := arrResep[i].nama +' | ' + convInttoStr(arrResep[i].harga) + ' | '+ convInttoStr(arrResep[i].n) + ' | ' + arrResep[i].bahan[1]; {Menyimpan input sebelum dimasukkan ke file eksternal "resep.dat", sebagai kondisi awal}
	for j:= 2 to arrResep[i].n do
	begin
	temp := temp + ' | ' + arrResep[i].bahan[j]; {Menyimpan input sebelum dimasukkan ke file eksternal "resep.dat", dengan pengulangan untuk menyimpan daftar bahan}
	end;
	writeln(resep,temp);
	i := i+1;
	end;
close(resep);
end;

procedure saveSimulasi();
{Save data simulasi dari array dataSimulasi ke file eksternal.}
{I.S. : data simulasi tersimpan pada array dataSimulasi
* F.S. : data simulasi tersimpan pada file eksternal "dataSimulasi.dat"}

{KAMUS LOKAL}
var
Stat : textfile; {nama file eksternal}
i    : integer;
temp : string; {variabel untuk menyimpan input dari dataSimulasi secara sementara, sebelum ditulis ke file eksternal}

{ALGORITMA LOKAL}
begin
assign(Stat, 'dataSimulasi.dat');
rewrite(Stat); 
i := 1;
while (i<=10) do {Berhenti ketika i>10}
	begin
	if (dataSimulasi[i].nomor<>0) then
	begin
	temp := convInttoStr(dataSimulasi[i].nomor) + ' | ' + convInttoStr(dataSimulasi[i].dd) + '/'+ convInttoStr(dataSimulasi[i].mm)+'/'+ convInttoStr(dataSimulasi[i].yy) + ' | ' + convInttoStr(dataSimulasi[i].hh_hidup) + ' | '+ convInttoStr(dataSimulasi[i].energi) + ' | ' + convInttoStr(dataSimulasi[i].inven_cap) + ' | ' + convInttoStr(dataSimulasi[i].mentah_dibeli) + ' | '+ convInttoStr(dataSimulasi[i].bhn_olah_dibuat) + ' | ' + convInttoStr(dataSimulasi[i].bhn_olah_dijual) + ' | '+ convInttoStr(dataSimulasi[i].resep_dijual) + ' | '+ convInttoStr(dataSimulasi[i].sum_income)+ ' | ' + convInttoStr(dataSimulasi[i].sum_outcome) + ' | ' + convInttoStr(dataSimulasi[i].sum_uang) ; {Menyimpan input sebelum dimasukkan ke file eksternal "lisInvenOlahan.dat"}
	writeln(Stat, temp);
	end;
	i :=i +1 ;
	end;
close(Stat); {i>10}
end;
end.
