unit aksiresep;

interface

procedure lihatResep(arrResep : array of tipe.hasil_olah)
procedure cariResep(arrResep : array of tipe.hasil_olah)
procedure tambahResep(arrResep : array of tipe.hasil_olah)
temp : array of tipe.hasil_olah;


implementation

procedure lihatResep()
var
i,j: integer;
begin
	
	for i:=(arrResep.n)-1 downto 1 do
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

procedure cariResep()
var
resep : string;
begin
	write('Tuliskan Resep yang ingin dicari: ');
	readln(resep);
	for i:=1 to arrResep.n do
	begin
		if(arrResep[1].nama=resep) then
		begin
			writeln(arrResep[i]);
		end;
	end;
end;

procedure tambahResep()
var
i,j : integer;
begin
	i:=1;
	while(arrResep.nama <>'')
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
