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
	while(not(arrResep[i].nama='')) do
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
		if (arrResep[j].nama<arrResep[j+1].nama) then
		begin
			temp:=arrResep[j];
			arrResep[j]:=arrResep[j+1];
			arrResep[j+1]:=temp;
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
		if(arrResep[i].nama=resep) then
		begin
			write(arrResep[i].nama);write(' | ');write(arrResep[i].harga);write(' | ');write(arrResep[i].n);
			for j:=1 to arrResep[i].n do
			begin
				write(' | ');
				write(arrResep[i].bahan[j]);
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
	while(arrResep[i].nama <>'') do
	begin
		i:=i+1;
	end;	
	write('Nama Resep: ');
	readln(arrResep[i].nama);
	write('Harga Jual: ');
	readln(arrResep[i].harga);
	write('Berapa jumlah Bahan: ');
	readln(arrResep[i].n);
	for j:=1 to arrResep[i].n do
	begin
		readln(arrResep[i].bahan[j]);
	end;
end;

end.
