unit aksiBahan;

interface
    uses tipe;
    procedure beliBahan(); 
    procedure olahBahan();
    procedure jualResep ();
    procedure hapusBahanKadaluarsa (); 

implementation
    function cariNamaBahan(var arrListBahan: array of tipe.bahan_mentah; nama: string): integer;
    //Mencari nama pada array of bahan_mentah
    //I.S : cariNamaBahan bernilai -1
    //F.S : Jika cariNamaBahan menemukan nama pada arrListBahan, ia akan bernilai indeks pertama dari kemuncula nama
    var
        curIdx: integer;
    begin
        curIdx := 1;
        cariNamaBahan := -1;
        while((arrListBahan[curIdx].nama <> '') and (arrListBahan[curIdx].nama <> nama)) do 
        begin
            curIdx += 1;
        end;
        if(arrListBahan[curIdx].nama = nama)then //Nama ditemukan
        begin
            cariNamaBahan := curIdx;
        end;
    end;

    function cariNamaOlahan(var arrListOlahan: array of tipe.hasil_olah; nama: string): integer;
    //Mencari nama pada array of hasil_olah
    //I.S : cariNamaOlahan bernilai -1
    //F.S : Jika cariNamaOlahan menemukan nama pada arrListOlahan, ia akan bernilai indeks pertama dari kemunculan nama
    var
        curIdx: integer;
    begin
        cariNamaOlahan := -1;
        curIdx := 1;
        while((arrListOlahan[curIdx].nama <> '') and (arrListOlahan[curIdx].nama <> nama)) do 
        begin
            curIdx += 1;
        end;
        if(arrListOlahan[curIdx].nama = nama)then //Nama ditemukan
        begin
            cariNamaOlahan := curIdx;
        end;
    end;

    function cariNamaInventori(var arrInv: array of isi_inventori; nama: string): integer;
    var
        curIdx: Integer;

    begin
        cariNamaInventori := -1;
        curIdx := 1;
        while((arrInv[curIdx].nama <> '') and (arrInv[curIdx].nama <> nama)) do
        begin
            curIdx += 1;
        end;
        if(arrInv[curIdx].nama = nama) then //nama ditemukan
        begin
            cariNamaInventori := curIdx;
        end;
    end;

    function cariString(var arrString : array of string; val: string): integer;
    //Mencari nilai val pada array of string
    //I.S: cariString bernilai -1
    //F.S: Jika cariString menemukan val pada arrString, ia akan bernilai indeks pertama dari kemunculan val
    var
        curIdx: integer;

    begin
        cariString := -1;
        curIdx := 1;
        while((arrString[curIdx] <> '') and (arrString[curIdx] <> val)) do
        begin
            curIdx += 1;
        end;
        if(arrString[curIdx] = val) then
        begin
            cariString := curIdx;
        end;
    end;

    function convertToHari(dd: integer; mm: integer; yy: integer): longint;
    //Mengkonversi tanggal pada suatu bulan dan tahun menjadi berapa banyak hari dari tanggal 0/0/0
    //I.S: convertToHari kosong
    //F.S: convertToHari bernilai sesuai deskripsi sebelumnya
    begin
        convertToHari := dd + 30*mm + 360*yy;
    end;

    procedure beliBahan(var arrInvMentah : array of tipe.isi_inventori; arrBahanMentah : array of tipe.bahan_mentah); 
    //Membeli suatu bahan di supermarket
    //I.S : 
    //F.S :
    var
        Neff, totalInven, bahanLocation, invenSize: integer;
        totalHarga, kuantitas: longint;
        bisaBeli: boolean;
        namaBahan: string;
    begin
        if(currentSimulasi.energi = 0) then //Energi cukup
        begin
            writeln('Energi tidak mencukupi, silakan ulangi');
        end else
        begin
            write('Nama Bahan: ');
            readln(namaBahan);
            bahanLocation := cariNamaBahan(arrBahanMentah, namaBahan);
            if(bahanLocation = -1) then //Bahan tidak ada di supermarket
            begin
                writeln('Bahan tidak ada, silakan ulangi');
            end else
            begin
                write('Kuantitas: ');
                readln(kuantitas);
                totalHarga := kuantitas*arrBahanMentah[bahanLocation].harga;
                invenSize := kuantitas + tipe.currentSimulasi.inven_Used;
                if(totalHarga > tipe.currentSimulasi.sum_Uang) then //Uang tidak mencukupi
                begin
                    writeln('Uang tidak mencukupi, silakan ulangi');
                end else if(invenSize > currentSimulasi.inven_Cap) then //Inventori tidak mencukupi
                begin
                    writeln('Inventori tidak mencukupi, silakan ulangi');
                end else
                begin
                    writeln('Total harga: ', totalHarga);
                    useInventori(kuantitas);
                    kurangUang(totalHarga);
                    kurangEnergi(1);
                    Neff := 1;
                    while(arrInvMentah[Neff].nama <> '') do //Mencari Neff
                    begin
                        Neff += 1;
                    end;
                    
                    arrInvMentah[Neff].nama := nama;
                    arrInvMentah[Neff].dd := currentSimulasi.dd;
                    arrInvMentah[Neff].mm := currentSimulasi.mm;
                    arrInvMentah[Neff].yy := currentSimulasi.yy;

                    writeln('Bahan telah berhasil dibeli');
                end;
            end;   
        end;
    end;

    procedure olahBahan(var arrInvOlahan : array of tipe.isi_inventori; arrBahanOlahan : array of tipe.hasil_olah);
    //I.S:
    //F.S:
    var
        Neff, totalInven, bahanLocation, invenSize, i: integer;
        totalHarga: longint;
        bisaBeli, bahanCukup: boolean;
        namaBahan: string;
    begin
        if(currentSimulasi.energi = 0) then //Energi cukup
        begin
            writeln('Energi tidak mencukupi, silakan ulangi');
        end else
        begin
            write('Nama Bahan: ');
            readln(namaBahan);
            bahanLocation := cariNamaOlahan(arrBahanOlahan, namaBahan);
            if(bahanLocation = -1) then //Bahan tidak ada di list bahan olahan
            begin
                writeln('Bahan tidak terdefinisi, silakan ulangi');
            end else
            begin
                bahanCukup := true;
                for i := 1 to arrBahanOlahan[bahanLocation].n do
                begin
                    if(cariNamaBahan(arrInvMentah,arrBahanOlahan[bahanLocation].bahan[i]) = -1) then //bahan tidak terdapat di inventori
                    begin
                        bahanCukup := false;
                    end;
                end;
                if(bahanCukup) then
                begin
                    for i := 1 to arrBahanOlahan[bahanLocation].n do //mengurangi jumlah bahan pada inventori
                    begin
                        arrInvMentah[cariString(arrInvMentah,arrBahanOlahan[bahanLocation].bahan[i])].jumlah -= 1;
                        freeInventori(1);
                    end;     
                    if(tipe.currentSimulasi.invenUsed = currentSimulasi.invenCap) then //Inventori tidak mencukupi
                    begin
                        writeln('Inventori penuh, silakan ulangi');
                    end else
                    begin
                        useInventori(1);
                        kurangEnergi(1);
                        while(arrInvOlahan[Neff].nama <> '') do //Mencari Neff
                        begin
                            Neff += 1;
                        end;

                        arrInvOlahan[Neff].nama := namaBahan;
                        arrInvOlahan[Neff].dd := currentSimulasi.dd;
                        arrInvOlahan[Neff].mm := currentSimulasi.mm;
                        arrInvOlahan[Neff].yy := currentSimulasi.yy;

                        writeln('Bahan telah berhasil diolah');
                    end;                    
                end else
                begin
                    writeln('Bahan tidak cukup, silakan ulangi');
                end;
            end;   
        end;
    end;

    procedure jualTemplate(jenisJualan: string; var arrInvJenis: array of isi_inventori; var arrListJenis: array of hasil_olah);
    var
        hargaJual: longint;
        bahanLocation, olahanDesc: integer;
        namaJual: string;

    begin
        if(currentSimulasi.energi = 0) then
        begin
            writeln('Energi tidak cukup, silakan ulangi');
        end else
        begin
            write('Nama ', jenisJualan, ': ');
            readln(namaJual);
            bahanLocation := cariNamaInventori(arrInvJenis, namaJual);
            if(bahanLocation = -1) then //Bahan tidak ada di inventori
            begin
                writeln('Bahan tidak ada di inventori, silakan ulangi');
            end else
            begin
                olahanDesc := cariNamaOlahan(arrListJenis, namaJual);
                hargaJual := arrListJenis[olahanDesc].harga;
                tambahUang(hargaJual);
                kurangEnergi(1);
                freeInventori(1);
                writeln(namaJual, ' telah dijual');
                writeln('Anda mendapat ', hargaJual);
            end;
        end;
    end;

    procedure jualOlahan();
    var
        hargaJual: longint;
        bahanLocation, olahanDesc: integer;
        namaBahan: string;
    
    begin
        jualTemplate('Olahan', arrInvOlahan, arrListOlahan);
    end;

    procedure jualResep ();
    begin
        jualTemplate('Resep', arrInvOlahan, arrResep);
    end;

    procedure deleteInventori(targetIdx: integer; var arrInv: array of isi_inventori);
    var
        temp: isi_inventori;
    begin
        while(arrInv[targetIdx+1] <> '') do
        begin
            temp := arrInv[targetIdx+1];
            arrInv[targetIdx+1] := arrInv[targetIdx];
            arrInv[targetIdx] := temp;
            targetIdx += 1;
        end;
        arrInv[targetIdx].nama := '';
    end;

    procedure hapusBahanKadaluarsa (var arrInvOlahan : array of tipe.isi_inventori; arrBahanMentah: array of tipe.bahan_mentah; var arrInvMentah : array of tipe.isi_inventori; currentSimulasi: data); 
    var
        convertCurrentHari: Integer;
        Neff: integer;

    begin
        convertCurrentHari := convertToHari(currentSimulasi.dd, currentSimulasi.mm, currentSimulasi.yy);
        while(arrInvMentah[Neff].nama <> '') do
        begin
            if(convertCurrentHari - convertToHari(arrInvMentah[Neff].dd, arrInvMentah[Neff].mm, arrInvMentah[Neff].yy) <= 0) then
            begin
                deleteInventori(Neff, arrInvMentah);
            end;
            Neff += 1;
        end;
        while(arrInvOlahan[Neff].nama <> '') do
        begin
            if(convertCurrentHari - convertToHari(arrInvOlahan[Neff].dd+3, arrInvOlahan[Neff].mm, arrInvOlahan[Neff].yy) <= 0) then
            begin
                deleteInventori(Neff, arrInvOlahan);
            end;
            Neff += 1 ;
        end;
    end.
end.
