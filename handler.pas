unit handler;


interface
uses tipe,aksiChef,energi,uang,inventori,aksiStatistik,aksiSave,aksiSimulasi,aksiLoad,aksiResep,aksiBahan; 

procedure runUserInterface(); 

implementation
 

procedure runUserInterface(); 


{Fungsional masukan dan keluaran, mengecek perintah yang dimasukkan oleh user dengan if conditional,
dan menjalankan prosedur pada unit-unit lainnya sesuai dengan masukan dari user. }
{I.S. : masukan dari user berdasarkan spesifikasi fungsi
* F.S. : terpanggil prosedur yang sesuai denga masukan yang diinginkan pengguna}

{KAMUS LOKAL}
var
c : char;
strCommand : string;

{ALGORITMA LOKAL}
begin
	strCommand := ''; {Definisikan sebuah string kosong sebagai tempat menyimpan masukan yang telah dibaca}
	repeat
		read(c);
		if((c > ' ') and (ord(c) <> 13) and (ord(c) <> 10)) then
		begin
			strCommand := strCommand + c;
		end;
	until ((c = ' ') or (ord(c) = 10)); {Berhenti membaca masukan ketika menemukan spasi atau baris baru}
if (simulasiRunning) then {simulasiRunning merupakan tipe boolean yang berubah kondisi ketika pengguna memasukkan masukan "start", berada di unit aksiSimulasi, dan bernilai true ketika simulasi berjalan}
begin	{jika masukan yang terbaca sesuai dengan fungsi yang ada, maka akan menjalankan fungsi tersebut. Masukan ini berjalan saat simulasiRunning=true atau saat simulasi berjalan}
	if (strCommand = 'stopSimulasi') then
	begin
	stopSimulasi();
	end else if (strCommand = 'beliBahan') then
	begin
	beliBahan();
	end else if (strCommand = 'olahBahan') then
	begin
	olahBahan();
	end else if (strCommand = 'jualOlahan') then
	begin
	jualOlahan();
	end else if (strCommand = 'jualResep') then
	begin
	jualResep();
	end else if (strCommand = 'makan') then
	begin
	makan();
	end else if (strCommand = 'istirahat') then
	begin
	istirahat();
	end else if (strCommand = 'tidur') then
	begin
	istirahat();
	end else if (strCommand = 'lihatStatistik') then
	begin
	lihatStatistik();
	end else if (strCommand = 'lihatInventori') then
	begin
	lihatInventori();
	end else if (strCommand = 'lihatResep') then
	begin
	lihatResep();
	end else if (strCommand = 'cariResep') then
	begin
	cariResep();
	end else if (strCommand = 'tambahResep') then
	begin
	tambahResep();
	end else if (strCommand = 'upgradeInventori') then
	begin
	upgradeInventori();
	end else
	begin
		writeln('Masukan salah, silakan ulangi');
	end;
end else begin	{ masukan yang dapat diterima pada saat simulasi tidak berjalan}
	if (strCommand = 'lihatStatistik') then
	begin
	lihatStatistik();
	end else if (strCommand = 'lihatInventori') then
	begin
	lihatInventori();
	end else if (strCommand = 'lihatResep') then
	begin
	lihatResep();
	end else if (strCommand = 'cariResep') then
	begin
	cariResep();
	end else if (strCommand = 'tambahResep') then
	begin
	tambahResep();
	end else if (strCommand = 'upgradeInventori') then
	begin
	upgradeInventori();
	end else if(strCommand = 'start') then
	begin
		startSimulasi();
	end else
	begin
		writeln('Masukan salah, silakan ulangi');
	end;
end;
end;
end.
