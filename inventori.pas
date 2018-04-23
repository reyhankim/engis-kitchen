unit inventori;

interface
	procedure useInventori(plusInventori: integer);
	//Menambah inventori yang terpakai pada simulasi sebesar plusInventori
	//I.S: plusInventori bernilai bilangan bulat non-negatif
	//F.S: Nilai currentSimulasi.inven_used bertambah sebesar plusInventori 
	procedure freeInventori(minusInventori: integer); 
	//Mengurangi inventori yang terpakai pada simulasi sebesar minusInventori
	//I.S: minusInventori bernilai bilangan bulat non-negatif
	//F.S: Nilai currentSimulasi.inven_used berkurang sebesar minusInventori
	procedure lihatInventori();
	//Melihat isi inventori bahan mentah dan olahan
	//I.S: arrInvMentah dan arrInvOlahan terdefinisi
	//F.S: Isi inventori bahan mentah dan olahan telah teroutput. arrInvMentah dan arrInvOlahan telah terurut
	procedure upgradeInventori();
	//Mengupgrade ruang inventori
	//I.S: Uang yang dimiliki tidak kurang dari harga upgrade inventori
	//F.S: Batas maksimal inventori bertambah sebesar 25, uang yang dimiliki berkurang sebesar harga_upgrade
implementation
	uses tipe,uang,sort;
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
	//F.S: Isi inventori bahan mentah dan olahan telah teroutput. arrInvMentah dan arrInvOlahan telah terurut
    
	//KAMUS LOKAL
    var
        temp2,temp,space,L,k,j,i: integer;
    
    begin
        writeln('=====Inventory Mentah=====');
        writeln('______________________________________');
        writeln('|        Nama        |DD/MM/YY |Jumlah|');
        sortIsiInventori(arrInvMentah);
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
        sortIsiInventori(arrInvOlahan);
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
            writeln('Inventori telah di-upgrade. Kapasitas inventori Anda sekarang adalah ', tipe.currentSimulasi.inven_cap, ' slot inventori.');
		end else
		begin
			writeln('Uang tidak cukup');
		end;
	end;
end.