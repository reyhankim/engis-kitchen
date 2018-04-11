// HamdaniF
// 4-9-2018
// Lihat Statistik - rev2

unit lihatStatistik;

interface

uses
	tipe;

var
	currentSimulasi : data;
	arrInvMentah : bahan_mentah;
	arrInvOlahan : hasil_olah;

procedure lihatStatistik();
{Menampilkan statistik informasi yang sedang dijalankan atau di-stopSimulasi. Buat selengkap dan serapi mungkin~ (bentuk tabel, blablabla) }

Implementation
procedure lihatStatistik();

//kamus lokal
var
	j,i: integer;

BEGIN
	writeln('==Statistik==');
	writeln;
	writeln('Today ',currentSimulasi.dd,'/',currentSimulasi.mm,'/',currentSimulasi.yy);
	writeln('Energi     :',currentSimulasi.energi);
	writeln('income     :',currentSimulasi.sum_income);
	writeln('Outcome    :',currentSimulasi.sum_outcome);
	writeln('Jumlah Uang:','Rp ',currentSimulasi.sum_uang);
	writeln();
	writeln();
	
	writeln('==Bahan Mentah==');
	writeln;
	i:=1;
	writeln('|  Nama  ',#9,'|','|  Harga  ',#9,'|','|  Durasi expire  ',#9,'|');
	while (arrInvMentah.nama[i]<>null) do
		begin
		write('|',arrInvMentah.nama[i],#9,'|',arrInvMentah.harga[i],#9,'|',arrInvMentah.dur_exp[i],#9,'|');
		i:=i+1;
		writeln;
		end;
		{nanti aku rapihin lagi}
	
	writeln('==Hasil Olahan==');
	writeln;
	i:=1;
	writeln('|  Nama  ',#9,'|','|  Harga  ',#9,'|','|  Jumlah  ',#9,'|','|  Bahan  ',#9,'|');
	while (arrInvOlahan.nama[i]<>null) do
		begin
		write('|',arrInvOlahan.nama[i],#9,'|',arrInvOlahan.harga[i],#9,'|',arrInvOlahan.n[i],#9,'|');
			j:=1;
			while (arrInvOlahan.bahan[[j]]<>null) do
				begin
					j
					write(arrInvOlahan.bahan[[j]],',');
				end;
		writeln('|');
		i:=i+1;
		end;			
END.

