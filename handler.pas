unit handler;


interface
uses tipe,aksiChef,energi,uang,inventori,aksiStatistik,aksiSave,aksiSimulasi,aksiLoad,aksiResep,aksiBahan; 

procedure runUserInterface(var terminateProgram : boolean); 


{Fungsional masukan dan keluaran, mengecek perintah yang dimasukkan oleh user dengan if conditional,
dan menjalankan prosedur pada unit-unit lainnya sesuai dengan masukan dari user. 
Jika user memasukkan "exit", terminateProgram akan bernilai true sehingga runUserInterface tidak di-loop lagi pada main.pas.

if conditional checking dilakukan untuk setiap input yang sesuai dengan fitur (cek spesifikasi tubes. Contoh terdapat pada halaman 6). 
Setiap baris harus terdapat "> ". Jika input user tidak sesuai dengan string yang ada pada bagian fitur (misal 'startSimulasi' diinput menjadi 'mulaiSimulasi'),
 minta user mengulangi input.

Agar dapat berjalan, cantumkan seluruh unit yang digunakan pada bagian implementation (hmmm... sederhananya handler.pas bakal pakai semua unit selain main.pas)}

implementation
uses tipe,aksiChef,energi,uang,inventori,aksiStatistik,aksiSave,aksiSimulasi,aksiLoad,aksiResep,aksiBahan; 

procedure runUserInterface(); 


{Fungsional masukan dan keluaran, mengecek perintah yang dimasukkan oleh user dengan if conditional,
dan menjalankan prosedur pada unit-unit lainnya sesuai dengan masukan dari user. 
Jika user memasukkan "exit", terminateProgram akan bernilai true sehingga runUserInterface tidak di-loop lagi pada main.pas.

if conditional checking dilakukan untuk setiap input yang sesuai dengan fitur (cek spesifikasi tubes. Contoh terdapat pada halaman 6). 
Setiap baris harus terdapat "> ". Jika input user tidak sesuai dengan string yang ada pada bagian fitur (misal 'startSimulasi' diinput menjadi 'mulaiSimulasi'),
 minta user mengulangi input.

Agar dapat berjalan, cantumkan seluruh unit yang digunakan pada bagian implementation (hmmm... sederhananya handler.pas bakal pakai semua unit selain main.pas)}

{KAMUS LOKAL}
var
c : char;
strCommand : string;

{ALGORITMA LOKAL}
begin

	strCommand := '';
	repeat
		read(c);
		strCommand := strCommand + c;
	until (c = ' ' or '\n'); 
	
if (simulasiRunning) then
begin
	if (strCommand = 'stopSimulasi') then
	stopSimulasi(); 
	else if (strCommand = 'beliBahan') then
	beliBahan(arrInvMentah,arrBahanMentah);
	else if (strCommand = 'olahBahan') then
	olahBahan();
	else if (strCommand = 'jualOlahan') then
	jualOlahan();
	else if (strCommand = 'jualResep') then
	jualResep();
	else if (strCommand = 'makan') then
	makan();
	else if (strCommand = 'istirahat') then
	istirahat();
	else if (strCommand = 'tidur') then
	istirahat();
	else if (strCommand = 'lihatStatistik') then
	lihatStatistik();
	else if (strCommand = 'lihatInventori') then
	lihatInventori();
	else if (strCommand = 'lihatResep') then
	lihatResep();
	else if (strCommand = 'cariResep') then
	cariResep();
	else if (strCommand = 'tambahResep') then
	tambahResep();
	else if (strCommand = 'upgradeInventori') then
	upgradeInventori();
end else begin
	if (strCommand = 'lihatStatistik') then
	lihatStatistik();
	else if (strCommand = 'lihatInventori') then
	lihatInventori();
	else if (strCommand = 'lihatResep') then
	lihatResep();
	else if (strCommand = 'cariResep') then
	cariResep();
	else if (strCommand = 'tambahResep') then
	tambahResep();
	else if (strCommand = 'upgradeInventori') then
	upgradeInventori();
end;
end;
end.
