unit inventori;

interface
	procedure useInventori(plusInventori: integer); 
	procedure freeInventori(minusInventori: integer); 
	procedure lihatInventori();
	procedure upgradeInventori();
implementation
	uses tipe,uang;
	procedure useInventori(plusInventori: integer); 
	//Menambah inventori yang terpakai pada simulasi sebesar plusInventori
	//I.S: plusInventori bernilai bilangan bulat non-negatif
	//F.S: Nilai currentSimulasi.inven_used bertambah sebesar plusInventori
	begin
		if(plusInventori >= 0) then
		begin
			tipe.currentSimulasi.inven_used += plusInventori;
		end;
	end;
	procedure freeInventori(minusInventori: integer);
	//Mengurangi inventori yang terpakai pada simulasi sebesar minusInventori
	//I.S: minusInventori bernilai bilangan bulat non-negatif
	//F.S: Nilai currentSimulasi.inven_used berkurang sebesar minusInventori
	begin
		if(minusInventori >= 0) then
		begin
			tipe.currentSimulasi.inven_used -= minusInventori;
		end;
	end;

	procedure lihatInventoriTemplate(var arrInvTemplate: array of isi_inventori);
	//Melihat isi inventori pada array arrInvTemplate
	//I.S: arrInvTemplate terdefinisi
	//F.S: Isi inventori pada arrInvTemplate telah teroutput
	var
		curIdx: Integer;

	begin
		//sort(arrInvTemplate);
		curIdx := 0;
		while(arrInvTemplate[curIdx].nama <> '') do
		begin
			writeln('Nama: ', arrInvTemplate[curIdx].nama);
			writeln('Tanggal Pembelian: ', arrInvTemplate[curIdx].dd,'/',arrInvTemplate[curIdx].mm,'/',arrInvTemplate[curIdx].yy);
			writeln('Jumlah: ', arrInvTemplate[curIdx].jumlah);
			curIdx += 1;
		end;
	end;

	procedure lihatInventori();
	//Melihat isi inventori bahan mentah dan olahan
	//I.S: arrInvMentah dan arrInvOlahan terdefinisi
	//F.S: Isi inventori bahan mentah dan olahan telah teroutput
	begin
		writeln('Inventori Bahan Mentah:');
		lihatInventoriTemplate(tipe.arrInvMentah);
		writeln();
		writeln('Inventori Bahan Olahan:');
		lihatInventoriTemplate(tipe.arrInvOlahan);
		writeln();
	end;
	procedure upgradeInventori();
	//Mengupgrade ruang inventori
	//I.S: Uang yang dimiliki tidak kurang dari harga upgrade inventori
	//F.S: Batas maksimal inventori bertambah sebesar 25, uang yang dimiliki berkurang sebesar harga_upgrade

	begin
		if(tipe.currentSimulasi.sum_uang >= harga_upgrade) then
		begin
			tipe.currentSimulasi.inven_cap += 25;
			kurangUang(harga_upgrade);
		end else
		begin
			writeln('Uang tidak cukup');
		end;
	end;
end.