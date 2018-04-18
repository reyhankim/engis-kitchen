unit aksiSave;


interface
uses tipe;
procedure saveInventori(var arrInvMentah: array of isi_inventori; var arrInvOlahan: array of isi_inventori);
{Menyimpan inventori Simulasi ke dalam file eksternal listInvenMentah.dat dan listInvenOlahan.dat}


procedure saveResep(var arrResep: array of hasil_olah);
{Menyimpan seluruh resep pada arrResep ke dalam file eksternal resep.dat} 


implementation

function convInttoStr (X:integer) : string;
{Mengubah tipe integer menjadi string}


{ALGORITMA LOKAL}
begin
Str(X, convInttoStr)
end;

procedure saveInventori(var arrInvMentah: array of isi_inventori; var arrInvOlahan: array of isi_inventori);
{Menyimpan inventori Simulasi ke dalam file eksternal listInvenMentah.dat dan listInvenOlahan.dat}

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
	write(Mentah, temp);
	i := i +1;
end;
close(Mentah);
assign(Olahan, 'listInvenOlahan.dat');
rewrite(Olahan);
j := 1;
while(arrInvOlahan[j].nama<>'') do {Berhenti ketika arrInvOlahan[i] kosong}
begin
	temp := arrInvOlahan[j].nama + ' | ' + convInttoStr(arrInvOlahan[j].dd)+'/'+convInttoStr(arrInvOlahan[j].mm)+'/'+convInttoStr(arrInvOlahan[j].yy)+' | ' + convInttoStr(arrInvOlahan[j].jumlah); {Menyimpan input sebelum dimasukkan ke file eksternal "lisInvenOlahan.dat"}
	write(Olahan, temp);
	j := j +1;
end;
close(Olahan);
end;



procedure saveResep(var arrResep: array of hasil_olah);
{Menyimpan seluruh resep pada arrResep ke dalam file eksternal resep.dat}

{KAMUS LOKAL}
var
resep : textfile;
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
	write(resep,temp);
	i := i+1;
	end;
close(resep);
end;
end.
