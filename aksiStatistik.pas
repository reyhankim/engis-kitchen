// HamdaniF
// 4-9-2018
// Lihat Statistik - rev3

unit lihatStatistik;

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
	temp2,temp,space,k,j,i: integer;

BEGIN
	writeln('==Statistik==');
	writeln;
	writeln('Today ',currentSimulasi.dd,'/',currentSimulasi.mm,'/',currentSimulasi.yy);
	writeln('Hari ke -',currentSimulasi.hh_hidup);
	writeln('Energi     :',currentSimulasi.energi);
	writeln('Jumlah Uang:','Rp ',currentSimulasi.sum_uang);
	writeln();
	writeln();
	
	writeln('==Bahan Mentah==');
	writeln;
	i:=1;
	writeln('|  Nama  ',' ','|','|  Harga  ',' ','|','|  Durasi expire  ',' ','|');
	while(arrBahanMentah[i].nama<> '') do
		begin
		write('|',arrBahanMentah[i].nama,' ','|',arrBahanMentah[i].harga,' ','|',arrBahanMentah[i].dur_exp,' ','|');
		i:=i+1;
		writeln;
		end;

	

	writeln('==========Hasil Olahan==========');{20}
	writeln;
	writeln('__________________________________________________');
	k:=1;
	writeln('|','        Nama        '{20},'|',' Harga '{7},'|','Jumlah'{5},'|','      Bahan       '{18},'|');
	while(arrBahanOlahan[k].nama<>'') do
		begin
		write('|');
		space := 20 - length(arrBahanOlahan[k].nama);
		write(arrBahanOlahan[k].nama);
		for i:=1 to space do
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
		for i:=1 to 7-temp do
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
		for i:=1 to 5-temp do
			begin
				write(' ');
			end;
		
		write('|');
		write(arrBahanOlahan[k].bahan[1]);
		space := 18 - length(arrBahanOlahan[k].bahan[1]);
		for i:=1 to space do
			begin
				write(' ');
			end;
		write('|');
		writeln;

		j:=2;
			while (arrBahanOlahan[k].bahan[j]<>null) do
				begin
					space := 63 - length(arrBahanOlahan[k].bahan[j]);
					write('|');
					for i:=1 to space do
						begin
							write(' ');
						end;
					
					write(arrBahanOlahan[k].bahan[j],'|');
					j:=j+1
				end;
	end;		
END;

end.

