<<<<<<< HEAD
unit inventori;
//useInventori sama freeInventori pake var?
interface
	procedure useInventori(plusInventori: integer); 
	procedure freeInventori(minusInventori: integer); 
	procedure lihatInventori();
	procedure upgradeInventori();
implementation
	uses tipe;
	procedure useInventori(plusInventori: integer); 
	begin
		currentSimulasi.inven_used += plusInventori;
	end;
	procedure freeInventori(minusInventori: integer);
	begin
		currentSimulasi.inven_used -= minusInventori;
	end;

	procedure lihatInventoriTemplate(var arrInvTemplate: array of isi_inventori);
	var
		curIdx: Integer;

	begin
		//sort(arrInvTemplate);
		curIdx := 1;
		while(arrInvTemplate[curIdx].nama <> '') do
		begin
			writeln('Nama: ', arrInvTemplate[curIdx].nama);
			writeln('Kadaluarsa: ', arrInvTemplate[curIdx].dd,'/',arrInvTemplate[curIdx].mm,'/',arrInvTemplate[curIdx].yy);
			writeln('Jumlah: ', arrInvTemplate[curIdx].jumlah);
		end;
	end;

	procedure lihatInventori();
	begin
		lihatInventoriTemplate(arrInvMentah);
		lihatInventoriTemplate(arrInvOlahan);
	end;
	procedure upgradeInventori();
	begin
		//Harga: 100000
		currentSimulasi.inven_cap += 25;
	end;
end.
=======
unit inventori;
//useInventori sama freeInventori pake var?
interface
	procedure useInventori(plusInventori: integer); 
	procedure freeInventori(minusInventori: integer); 
	procedure lihatInventori();
	procedure upgradeInventori();
implementation
	uses tipe;
	procedure useInventori(plusInventori: integer); 
	begin
		currentSimulasi.inven_used += plusInventori;
	end;
	procedure freeInventori(minusInventori: integer);
	begin
		currentSimulasi.inven_used -= minusInventori;
	end;

	procedure lihatInventoriTemplate(var arrInvTemplate: array of isi_inventori);
	var
		curIdx: Integer;

	begin
		//sort(arrInvTemplate);
		curIdx := 1;
		while(arrInvTemplate[curIdx].nama <> '') do
		begin
			writeln('Nama: ', arrInvTemplate[curIdx].nama);
			writeln('Kadaluarsa: ', arrInvTemplate[curIdx].dd,'/',arrInvTemplate[curIdx].mm,'/',arrInvTemplate[curIdx].yy);
			writeln('Jumlah: ', arrInvTemplate[curIdx].jumlah);
		end;
	end;

	procedure lihatInventori();
	begin
		lihatInventoriTemplate(arrInvMentah);
		lihatInventoriTemplate(arrInvOlahan);
	end;
	procedure upgradeInventori();
	begin
		//Harga: 100000
		currentSimulasi.inven_cap += 25;
	end;
end.
>>>>>>> 0f57db78fab207dd9bf02d3b04c1270f6e050487
