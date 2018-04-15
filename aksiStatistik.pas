// HamdaniF
// 4-9-2018
// Lihat Statistik - rev2

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
	k,j,i: integer;

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

	
	writeln('==Hasil Olahan==');
	writeln;
	k:=1;
	writeln('|  Nama  ',' ','|','|  Harga  ',' ','|','|  Jumlah  ',' ','|','|  Bahan  ',' ','|');
	while (arrBahanOlahan[k].nama<>'') do
		begin
		write('|',arrBahanOlahan[k].nama,' ','|',arrBahanOlahan[k].harga,' ','|',arrBahanOlahan[k].n,' ','|');
			j:=1;
			while (arrBahanOlahan[i].bahan<>null) do
				begin
					write(arrBahanOlahan[i].bahan[j],',');
				end;
		writeln('|');
		i:=i+1;
		end;			
END;

end.

