unit aksiresep;

interface
uses tipe;

var
temp : tipe.hasil_olah;

procedure lihatResep();
procedure cariResep();
procedure tambahResep();
function carijumlah():integer;

implementation

function carijumlah():integer;
var
i: integer;
begin
	carijumlah:=0;
	i:=1;
	while(not(tipe.arrResep[i].nama='')) do
	begin
		carijumlah:=carijumlah+1;
		i:=i+1;
	end;
end;

procedure lihatResep();
var
i,j: integer;
begin
	for i:= (carijumlah-1) downto 1 do
	begin
	 for j:=1 to i do
	 begin
		if (tipe.arrResep[j].nama<tipe.arrResep[j+1].nama) then
		begin
			temp:=tipe.arrResep[j];
			tipe.arrResep[j]:=tipe.arrResep[j+1];
			tipe.arrResep[j+1]:=temp;
		end;
	 end;
	end;
end;

procedure cariResep();
var
resep : string;
i, j,ketemu : integer;
begin
	ketemu:=0;
	write('Tuliskan Resep yang ingin dicari: ');
	readln(resep);
	for i:=1 to cariJumlah do
	begin
		if(tipe.arrResep[i].nama=resep) then
		begin
			write(tipe.arrResep[i].nama);write(' | ');write(tipe.arrResep[i].harga);write(' | ');write(tipe.arrResep[i].n);
			for j:=1 to tipe.arrResep[i].n do
			begin
				write(' | ');
				write(tipe.arrResep[i].bahan[j]);
			end;
			ketemu:=1;
		end;
	end;
	if (ketemu=0) then
	begin
		writeln('Resep tidak ditemukan. Coba ulang.');
	end;
end;

procedure tambahResep();
var
i,j : integer;
begin
	i:=1;
	while(tipe.arrResep[i].nama <>'') do
	begin
		i:=i+1;
	end;	
	write('Nama Resep: ');
	readln(tipe.arrResep[i].nama);
	write('Harga Jual: ');
	readln(tipe.arrResep[i].harga);
	write('Berapa jumlah Bahan: ');
	readln(tipe.arrResep[i].n);
	for j:=1 to tipe.arrResep[i].n do
	begin
		readln(tipe.arrResep[i].bahan[j]);
	end;
end;

end.
