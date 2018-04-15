unit aksiSave;


interface
uses tipe;
procedure saveInventori(var arrInvMentah: array of isi_inventori; var arrInvOlahan: array of isi_inventori);
{Menyimpan inventori Simulasi ke dalam file eksternal listInvenMentah.dat dan listInvenOlahan.dat}


procedure saveResep(var arrResep: array of hasil_olah);
{Menyimpan seluruh resep pada arrResep ke dalam file eksternal resep.dat} 


implementation

function conv (X:integer) : string;
{Mengubah tipe integer menjadi string}


{ALGORITMA LOKAL}
begin
Str(X, conv)
end;

procedure saveInventori(var arrInvMentah: array of isi_inventori; var arrInvOlahan: array of isi_inventori);
{Menyimpan inventori Simulasi ke dalam file eksternal listInvenMentah.dat dan listInvenOlahan.dat}

{KAMUS LOKAL}
var
i,j : integer;
temp : string;
Mentah, Olahan : textfile;

{ALGORITMA LOKAL}
begin
assign(Mentah, 'listInvenMentah.dat');
rewrite(Mentah);
i := 1;
while (arrInvMentah[i].nama<>'') do
begin
	temp := arrInvMentah[i].nama + ' | ' + conv(arrInvMentah[i].dd)+'/'+conv(arrInvMentah[i].mm)+'/'+conv(arrInvMentah[i].yy)+' | '+conv(arrInvMentah[i].jumlah);
	write(Mentah, temp);
	i := i +1;
end;
close(Mentah);
assign(Olahan, 'listInvenOlahan.dat');
rewrite(Olahan);
j := 1;
while(arrInvOlahan[j].nama<>'') do
begin
	temp := arrInvOlahan[j].nama + ' | ' + conv(arrInvOlahan[j].dd)+'/'+conv(arrInvOlahan[j].mm)+'/'+conv(arrInvOlahan[j].yy)+' | ' + conv(arrInvOlahan[j].jumlah);
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
temp  : string;

{ALGORITMA LOKAL}
begin
assign(resep, 'resep.dat');
rewrite(resep);
i:= 1;
while (arrResep[i].nama <> '') do
	begin
	temp := arrResep[i].nama +' | ' + conv(arrResep[i].harga) + ' | '+ conv(arrResep[i].n) + ' | ' + arrResep[i].bahan[1];
	for j:= 2 to arrResep[i].n do
	begin
	temp := temp + ' | ' + arrResep[i].bahan[j];
	write(resep,temp);
	i := i+1;
	end;
close(resep);
end;
end;
end.
	
