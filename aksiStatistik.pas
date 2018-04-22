// HamdaniF
// 4-9-2018
// Lihat Statistik - rev2

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
	
	writeln('=======Bahan Mentah=======');
	writeln;
	i:=1;
	writeln('_____________________________________________');
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
			
					write('|');
					temp := 1;
					temp2 := arrBahanMentah[i].harga;
					if (arrBahanMentah[i].harga <> 0) then
						begin
							while ( temp2 >10) do
								begin
									temp:=temp+1;
									temp2 := temp2 div 10;
								end;
						write(arrBahanMentah[i].harga);
						if(i>1) then write(' ');
						for L:=1 to 8-temp do
							begin
								write(' ');
							end;
						end
					else if (arrBahanMentah[i].harga = 0) then
						begin
							write(arrBahanMentah[i].harga,'      ');
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
					for L:=1 to 11-temp do
						begin
							write(' ');
						end;
		
					write('|');
					i:=i+1;
					writeln;
			end;

writeln;

	writeln('==========Hasil Olahan==========');{20}
	writeln;
	writeln('_______________________________________________________');
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
		temp := 1;
		temp2 := arrBahanOlahan[k].harga;
		if (arrBahanOlahan[k].harga <> 0) then
			begin
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
			end
		else if (arrBahanOlahan[k].harga = 0) then
			begin
				write(arrBahanOlahan[k].harga,'      ');
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
		
		space := 18 - length(arrBahanOlahan[k].bahan[1]);
		write('|');
		write(arrBahanOlahan[k].bahan[1]);
		for i:=1 to space do
			begin
				write(' ');
			end;
		writeln('|');
		
		j:=2;
			while (arrBahanOlahan[k].bahan[j]<>'') do
				begin
					space := 18 - length(arrBahanOlahan[k].bahan[j]);
					write('|');
					write('                    |       |      ','|',arrBahanOlahan[k].bahan[j]);
					for i:=1 to space do
						begin
							write(' ');
						end;
					
					write('|');
					j:=j+1;
					writeln;
				end;
		k:= k+1;
		end;
	end
else
	writeln('----------------Bahan Olahan Kosong----------------');
	end;
writeln;
END;
END.

