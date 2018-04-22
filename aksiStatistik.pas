// HamdaniF
// 4-9-2018
// Lihat Statistik - final

unit aksiStatistik;

interface

uses
	tipe;

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
	writeln('nomor simulasi:',currentSimulasi.nomor);
	writeln('Today ',currentSimulasi.dd,'/',currentSimulasi.mm,'/',currentSimulasi.yy);
	writeln('Hari ke -',currentSimulasi.hh_hidup);
	writeln('Energi     :',currentSimulasi.energi);
	writeln('Kapasitas maksimum inventori:',currentSimulasi.inven_cap);
	writeln('Total bahan mentah dibeli:',currentSimulasi.mentah_dibeli);
	writeln('Total bahan olahan dibuat:',currentSimulasi.bhn_olah_dibuat);
	writeln('Total bahan olahan dijual:',currentSimulasi.bhn_olah_dijual);
	writeln('Total bahan resep dijual:',currentSimulasi.resep_dijual);
	writeln('Total pemasukan:',currentSimulasi.sum_income);
	writeln('Total pengeluaran:',currentSimulasi.sum_outcome);
	writeln('Jumlah uang:','Rp ',currentSimulasi.sum_uang);
	writeln();
	writeln();
	

writeln('=====Inventory Mentah=====');
writeln('______________________________________');
writeln('|        Nama        |DD/MM/YY |Jumlah|');

i:=1;
	while(arrInvMentah[i].nama<>'')do
		begin
			space :=20-length(arrInvMentah[i].nama);
			write('|',arrInvMentah[i].nama);
			for j:=1 to space do
				begin
					write(' ');
				end;
			
			write('|',arrInvMentah[i].dd,'/',arrInvMentah[i].mm,'/',arrInvMentah[i].yy,'|');
			
			temp:=0;
			temp2 := arrInvMentah[i].jumlah;
			while (temp2>9) do
				begin
					temp:=temp+1;
					temp2:=temp2 div 10;
				end;
			
			write(arrInvMentah[i].jumlah);
			for k:=1 to 5-temp do
				begin
					write(' ');
				end;
			writeln('|');
			i:=i+1;	
		end;
writeln;		
writeln();
	

writeln('=====Inventory Olahan=====');
writeln('______________________________________');
writeln('|        Nama        |DD/MM/YY |Jumlah|');

L:=1;
	while(arrInvOlahan[L].nama<>'')do
		begin
			space :=20-length(arrInvOlahan[L].nama);
			write('|',arrInvOlahan[L].nama);
			for j:=1 to space do
				begin
					write(' ');
				end;
			
			write('|',arrInvOlahan[L].dd,'/',arrInvOlahan[L].mm,'/',arrInvOlahan[L].yy,'|');
			
			temp:=0;
			temp2 := arrInvOlahan[L].jumlah;
			while (temp2>9) do
				begin
					temp:=temp+1;
					temp2:=temp2 div 10;
				end;
			
			write(arrInvOlahan[L].jumlah);
			for k:=1 to 5-temp do
				begin
					write(' ');
				end;
			writeln('|');
			L:=L+1;	
		end;
writeln;


END;
END.

