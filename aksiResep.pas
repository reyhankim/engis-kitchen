unit aksiresep;

interface
uses tipe,aksiSave,aksiLoad,aksiBahan;

var
temp : tipe.hasil_olah; {variable untuk menampung data sementara yang sesuap dengan tipe hasil olahan}

procedure lihatResep();
procedure cariResep();
procedure tambahResep();
function jumlahresep():integer;
function jumlahbahanolahan():integer;
function jumlahbahanmentah():integer;

implementation

function jumlahresep():integer;
{Mencari jumlah buah Resep yang terdapat di dalam data Resep}

{KAMUS LOKAL}
var
i: integer;

{ALGORITMA LOKAL}
begin
	jumlahresep:=0;
	i:=1;
	while(not(tipe.arrResep[i].nama='')) do {looping berhenti ketika tidak menemukan nama resep di data}
	begin
		jumlahresep:=jumlahresep+1;
		i:=i+1;
	end;
end;

function jumlahbahanolahan():integer;
{Mencari jumlah buah bahan olahan yang terdapat di dalam data bahan olahan}
{KAMUS LOKAL}
var
i: integer;

{ALGORITMA LOKAL}
begin
	jumlahbahanolahan:=0;
	i:=1;
	while(not(tipe.arrBahanOlahan[i].nama='')) do {looping berhenti ketika tidak menemukan nama Bahan Olahan di data}
	begin
		jumlahbahanolahan:=jumlahbahanolahan+1;
		i:=i+1;
	end;
end;

function jumlahbahanmentah():integer;
{Mencari jumlah bahan mentah yang terdapat di dalam data bahan mentah}

{KAMUS LOKAL}
var
i: integer;

{ALGORITMA LOKAL}
begin
	jumlahbahanmentah:=0;
	i:=1;
	while(not(tipe.arrBahanMentah[i].nama='')) do {looping berhenti ketika tidak menemukan nama bahan mentah di data}
	begin
		jumlahbahanmentah:=jumlahbahanmentah+1;
		i:=i+1;
	end;
end;


procedure lihatResep();
{Melihat daftar resep yang tersedia, termasuk semua daftar bahan penyusunnya.}
{I.S. :  Resep tersimpan dalam arrResep dalam kondisi pemasukkan awal
* F.S. : Resep yang ditampilkan sesuai dengan data resep yang paling update dengan penulisan yang terurut sesuai abjad}

{KAMUS LOKAL}
var
i,j: integer;

{ALGORITMA LOKAL}
begin
	for i:= (jumlahresep-1) downto 1 do {looping akan dilakukan dari jumlah resep sampai 1}
	begin
	 for j:=1 to i do
	 begin
		if (tipe.arrResep[j].nama>tipe.arrResep[j+1].nama) then		{Merapikan resep dengan menggunakan bubble sorting}
		begin
			temp:=tipe.arrResep[j];
			tipe.arrResep[j]:=tipe.arrResep[j+1];
			tipe.arrResep[j+1]:=temp;
		end;
	 end;
	end;
	
	for i:=1 to jumlahresep do		{menampilkan resep sesuai dengan spesifikasi resep yang diharapkan}
	begin
		write(arrResep[i].nama);
		write(' | ');
		write(arrResep[i].harga);
		write(' | ');
		write(arrResep[i].n);
		for j:=1 to arrResep[i].n do
		begin
			write(' | ');
			write(arrResep[i].bahan[j]);
		end;
		writeln();
	end;
end;

procedure cariResep();
{melakukan pencarian resep berdasarkan nama resep yang tersedia. Jika masukan
nama resep ditemukan, maka program akan menampilkan nama resep dan nama bahan-bahan yang
diperlukan dan harga jual resep tersebut. Jika tidak sesuai, maka program akan menampilkan pesan
kesalahan.}
{I.S. : Mencari resep yang ingin dicari dari data resep
* F.S. : Menampilkan data resep yang ingin dicari bila ditemukan dan bila tidak ditemukan maka akan mengulang pemasukan}

{KAMUS LOKAL}
var
resep : string;	{variable resep yang ingin dicari}
i, j,ketemu : integer;	{variable ketemu berguna untuk mengetahui apakah resep ditemukan atau tidak}

{ALGORITMA LOKAL}
begin
	ketemu:=0;
	write('Tuliskan Resep yang ingin dicari: ');
	readln(resep);
	for i:=1 to jumlahresep do		{melakukan looping untuk mencari apakah resep ditemukan}
	begin
		if(tipe.arrResep[i].nama=resep) then
		begin
			write(tipe.arrResep[i].nama);write(' | ');write(tipe.arrResep[i].harga);write(' | ');write(tipe.arrResep[i].n);
			for j:=1 to tipe.arrResep[i].n do
			begin
				write(' | ');
				write(tipe.arrResep[i].bahan[j]);
			end;
			writeln();
			ketemu:=1;
		end;
	end;
	if (ketemu=0) then
	begin
		writeln('Resep tidak ditemukan. Coba ulang.');
		cariResep();			{mengulang pemasukan bila resep yang dimasukkan  tidak ditemukan}
	end;
end;

procedure tambahResep();
{melakukan penambahan resep. Setiap resep dibuat dari minimum 2 buah bahan
mentah/olahan yang ada (tidak boleh dari bahan yang tidak tersedia). Harga jual minimum adalah
12.5% lebih tinggi dari total harga bahan mentah dan olahan yang menyusunnya. Apabila terdapat
desimal pada harga jual, dilakukan pembulatan ke atas (contoh: 1999.1 menjadi 2000).}
{I.S. : Resep yang dipunyai sudah disimpan dalam data resep
* F.S. : Memasukkan resep baru ke data resep dan tersimpan dalama data resep}

{KAMUS LOKAL}
var
i,j,k : integer;
ketemu,berhasil : boolean;
totalharga : longint;
minharga: real;
{ALGORITMA LOKAL}
begin
	berhasil:=false;
	i:=1;
	while(tipe.arrResep[i].nama <>'') do	{Looping agar dimasukkan pada baris terakhir dari data resep}
	begin
		i:=i+1;
	end;
	while(not(berhasil)) do
	begin	
	totalharga:=0;
	write('Nama Resep: ');			{Pemasukkan resep pada data resep}
	readln(tipe.arrResep[i].nama);
	write('Harga Jual: ');
	readln(tipe.arrResep[i].harga);
	write('Berapa jumlah Bahan: ');
	readln(tipe.arrResep[i].n);
	for j:=1 to tipe.arrResep[i].n do
	begin
		ketemu:=false;
		while(ketemu=false) do
		begin
		write('Bahan ');write(j);write(':');
		readln(tipe.arrResep[i].bahan[j]);
		for k:=1 to jumlahbahanmentah do
		begin
			if(tipe.arrBahanMentah[k].nama=tipe.arrResep[i].bahan[j]) then
			begin
				ketemu:=true;
				totalharga:=totalharga+tipe.arrBahanMentah[k].harga;
			end;
		end;
		for k:=1 to jumlahbahanolahan do
		begin
			if(tipe.arrBahanOlahan[k].nama=tipe.arrResep[i].bahan[j]) then
			begin
				ketemu:=true;
				totalharga:=totalharga+tipe.arrBahanOlahan[k].harga;
			end;
		end;
		if(ketemu=false) then
		begin
			writeln('Bahan Tidak ditemukan. Masukkan Ulang Bahan');
		end;
		end;
	end;
	minharga:=1.125*totalharga;
	if(tipe.arrResep[i].harga<minharga) then
	begin
		writeln('Harga jual Resep kurang mahal(Harus 1.125 harga total bahan). Isi Ulang!.');
	end
	else
	begin
		berhasil:=true;
		saveResep;
	end;
	end;
end;

end.
