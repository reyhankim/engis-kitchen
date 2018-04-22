// HamdaniF
// 4-9-2018
// Lihat Statistik - rev2

unit aksiStatistik;

interface

uses
	tipe;

var
	currentSimulasi : data;
	arrBahanMentah : array of bahan_mentah;
	arrBahanOlahan : array of hasil_olah;

procedure lihatStatistik();
{Menampilkan statistik informasi yang sedang dijalankan atau di-stopSimulasi. Buat selengkap dan serapi mungkin~ (bentuk tabel, blablabla) }

Implementation
procedure lihatStatistik();

//kamus lokal
var
	temp2,temp,space,L,k,j,i: integer;

BEGIN
	writeln('==Statistik==');
	writeln;
	writeln('Today ',currentSimulasi.dd,'/',currentSimulasi.mm,'/',currentSimulasi.yy);
	writeln('Hari ke -',currentSimulasi.hh_hidup);
	writeln('Energi     :',currentSimulasi.energi);
	writeln('Jumlah Uang:','Rp ',currentSimulasi.sum_uang);
	writeln();
	writeln();
	
	writeln('=======Bahan Mentah=======');
	writeln;
	i:=1;
	writeln('________________________________________');
	writeln('|        Nama        '{20},'|  Harga  '{7},'|Durasi expire'{13},'|');
	if (arrBahanMentah[1].nama <> '') then
		begin
			while(arrBahanMentah[i].nama<> '') do
				begin
					space := 20 - length(arrBahanMentah[i].nama);
					write('|',arrBahanMentah[i].nama);
					for L:=1 to space do
						begin
							write(' ');
						end;
					i:=i+1;
			
			write('|');
			temp := 0;
			temp2 := arrBahanMentah[i].harga;
			while ( temp2 >10) do
				begin
					temp:=temp+1;
					temp2 := temp2 div 10;
				end;
			write(arrBahanOlahan[i].harga);
			for L:=1 to 7-temp do
				begin
					write(' ');
				end;
		
			write('|');
			temp := 0;
			temp2 := arrBahanMentah[i].dur_exp;
			while ( temp2 >10) do
				begin
					temp:=temp+1;
					temp2 := temp2 div 10;
				end;
			write(arrBahanMentah[i].dur_exp);
			for L:=1 to 13-temp do
				begin
					write(' ');
				end;
		
			write('|');
			i:=i+1;
			writeln;
		end;
		end
	else
		write('----------------Bahan kosong----------------');

writeln;

	writeln('==========Hasil Olahan==========');{20}
	writeln;
	writeln('__________________________________________________');
	k:=1;
	writeln('|','        Nama        '{20},'|',' Harga '{7},'|','Jumlah'{5},'|','      Bahan       '{18},'|');
if (arrBahanOlahan[1].nama<>'') then
	begin
	while(arrBahanOlahan[k].nama<>'') do
		begin
		write('|');
		space := 20 - length(arrBahanOlahan[k].nama);
		write(arrBahanOlahan[k].nama);
		for L:=1 to space do
			begin
				write(' ');
			end;
		
		write('|');
		temp := 0;
		temp2 := arrBahanOlahan[k].harga;
		while ( temp2 >10) do
			begin
				temp:=temp+1;
				temp2 := temp2 div 10;
			end;
		write(arrBahanOlahan[k].harga);
		for L:=1 to 7-temp do
			begin
				write(' ');
			end;
		
		write('|');
		temp := 0;
		temp2 := arrBahanOlahan[k].n;
		while ( temp2 >10) do
			begin
				temp:=temp+1;
				temp2 := temp2 div 10;
			end;
		write(arrBahanOlahan[k].n);
		for L:=1 to 5-temp do
			begin
				write(' ');
			end;
		
		j:=1;
			while (arrBahanOlahan[k].bahan[j]<>null) do
				begin
					space := 63 - length(arrBahanOlahan[k].bahan[j]);
					write('|');
					for i:=1 to space do
						begin
							write(' ');
						end;
					
					write(arrBahanOlahan[k].bahan[j],'|');
					j:=j+1;
					writeln;
				end;
		k:= k+1;
		end;
	end
else
	writeln('----------------Bahan Olahan Kosong----------------');
	end;		
END.

