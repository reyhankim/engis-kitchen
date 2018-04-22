unit aksiBahan;

interface
    uses tipe, inventori, uang, energi;
    procedure beliBahan(); 
    //Membeli suatu bahan di supermarket
    //I.S : arrInvMentah, arrBahanMentah, bahan yang diinginkan terdefinisi. Uang, energi, dan inventori yang tersedia cukup
    //F.S : Bahan yang dibeli masuk ke dalam arrInvMentah
    procedure olahBahan();
    //Membeli suatu bahan di supermarket
    //I.S : arrInvMentah, arrBahanMentah, bahan yang diinginkan terdefinisi. Uang, energi, dan inventori yang tersedia cukup
    //F.S : Bahan yang dibeli masuk ke dalam arrInvMentah
    procedure jualOlahan();
    //Menjual bahan olahan
    //I.S: arrInvOlahan dan arrBahanOlahan terdefinisi
    //F.S: Bahan olahan yang akan dijual telah terjual, uang bertambah, energi berkurang.
    procedure jualResep ();
    //Menjual resep
    //I.S: arrInvOlahan dan arrResep terdefinisi
    //F.S: Resep yang akan dijual telah terjual, uang bertambah, energi berkurang
    procedure hapusBahanKadaluarsa (); 
    //Menghapus bahan yang sudah kadaluarsa
    //I.S: arrInvMentah dan arrInvOlahan terdefinisi
    //F.S: Semua bahan yang tanggal kadaluarsanya <= tanggal hari pada simulasi akan dihapus
    procedure restockBahan();
    //Random bahan mentah yang tersedia di supermarket dengan kemungkinan sebesar 30%
    //I.S: arrBahanMentah terdefinisi
    //F.S: Masing-masing stock di arrBahanMentah menjadi 30

implementation
    function cariNamaBahan(var arrListBahan: array of tipe.bahan_mentah; nama: string): integer;
    //Mencari nama pada array of bahan_mentah
    //I.S : cariNamaBahan bernilai -1
    //F.S : Jika cariNamaBahan menemukan nama pada arrListBahan, ia akan bernilai indeks pertama dari kemuncula nama
    var
        curIdx: integer;
    begin
        curIdx := 0;
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
        curIdx := 0;
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
    //Mencari apakah terdapat nama pada arrInv. Jika ada keluarkan indeksnya. Jika tidak keluarkan -1
    //I.S: arrInv dan nama terdefinisi, cariNamaInventori bernilai -1
    //F.S: cariNamaInventori bernilai -1 jika tidak ada atau bernilai indeks nama yang dicari jika ada
    var
        curIdx: Integer;

    begin
        cariNamaInventori := -1;
        curIdx := 0;
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
        curIdx := 0;
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

    procedure deleteInventori(targetIdx: integer; var arrInv: array of isi_inventori);
    //Menghilangkan targetIdx dari arrInv
    //I.S: arrInv dan arrInv[targetIdx] terdefinisi
    //F.S: Isi dari arrInv[targetIdx] hilang
    var
        temp: isi_inventori;
    begin
        while(arrInv[targetIdx+1].nama <> '') do
        begin
            temp := arrInv[targetIdx+1];
            arrInv[targetIdx+1] := arrInv[targetIdx];
            arrInv[targetIdx] := temp;
            targetIdx += 1;
        end;
        arrInv[targetIdx].nama := '';
    end;

    procedure beliBahan(); 
    //Membeli suatu bahan di supermarket
    //I.S : arrInvMentah, arrBahanMentah, bahan yang diinginkan terdefinisi. Uang, energi, dan inventori yang tersedia cukup
    //F.S : Bahan yang dibeli masuk ke dalam arrInvMentah
    var
        Neff, bahanLocation, invenSize: integer;
        totalHarga, kuantitas: longint;
        namaBahan: string;
    begin
        if(tipe.currentSimulasi.energi = 0) then //Energi cukup
        begin
            writeln('Energi tidak mencukupi, silakan ulangi');
        end else
        begin
            write('Nama Bahan: ');
            readln(namaBahan);  
            bahanLocation := cariNamaBahan(tipe.arrBahanMentah, namaBahan);
            if(bahanLocation = -1) then //Bahan tidak ada di supermarket
            begin
                writeln('Bahan tidak ada, silakan ulangi');
            end else
            begin
                bahanLocation += 1;
                write('Kuantitas: ');
                readln(kuantitas);
                writeln(kuantitas);
                totalHarga := kuantitas*tipe.arrBahanMentah[bahanLocation].harga;
                invenSize := kuantitas + tipe.currentSimulasi.inven_Used;
                if(totalHarga > tipe.currentSimulasi.sum_Uang) then //Uang tidak mencukupi
                begin
                    writeln('Uang tidak mencukupi, silakan ulangi');
                end else if(invenSize > tipe.currentSimulasi.inven_Cap) then //Inventori tidak mencukupi
                begin
                    writeln('Inventori tidak mencukupi, silakan ulangi');
                end else if(arrBahanMentah[bahanLocation].stock < kuantitas) then //Bahan di supermarket kurang dari yang diinginkans
                begin
                    writeln('Bahan di supermarket kurang, silakan ulangi');
                end else //Validasi berhasil
                begin
                    writeln('Total harga: ', totalHarga);
                    useInventori(kuantitas);
                    kurangUang(totalHarga);
                    kurangEnergi(1);
                    tipe.arrBahanMentah[bahanLocation].stock -= kuantitas;
                    Neff := 1;
                    while(tipe.arrInvMentah[Neff].nama <> '') do //Mencari Neff
                    begin
                        Neff += 1;
                    end;
                    
                    tipe.arrInvMentah[Neff].nama := namaBahan;
                    tipe.arrInvMentah[Neff].dd := tipe.currentSimulasi.dd;
                    tipe.arrInvMentah[Neff].mm := tipe.currentSimulasi.mm;
                    tipe.arrInvMentah[Neff].yy := tipe.currentSimulasi.yy;
                    tipe.arrInvMentah[Neff].jumlah := kuantitas;
                    tipe.currentSimulasi.mentah_dibeli += kuantitas;
                    writeln('Bahan telah berhasil dibeli');
                end;
            end;   
        end;
    end;

    procedure olahBahan();
    //Mengolah bahan mentah menjadi bahan olahan
    //I.S: Bahan olahan, arrInvOlahan, arrBahanOlahan terdefinisi. Bahan mentah yang dibutuhkan dan energi cukup.
    //F.S: Bahan mentah yang dibutuhkan dan energi berkurang, bahan olahan yang dibuat bertambah
    var
        Neff, bahanLocation, i: integer;
        bahanCukup: boolean;
        namaBahan: string;
    begin
        if(tipe.currentSimulasi.energi = 0) then //Energi cukup
        begin
            writeln('Energi tidak mencukupi, silakan ulangi');
        end else
        begin
            write('Nama Bahan: ');
            readln(namaBahan);
            bahanLocation := cariNamaOlahan(tipe.arrBahanOlahan, namaBahan);
            if(bahanLocation = -1) then //Bahan tidak ada di list bahan olahan
            begin
                writeln('Bahan tidak terdefinisi, silakan ulangi');
            end else
            begin
                bahanLocation += 1;
                bahanCukup := true;
                for i := 1 to tipe.arrBahanOlahan[bahanLocation].n do
                begin
                    if(cariNamaInventori(tipe.arrInvMentah,tipe.arrBahanOlahan[bahanLocation].bahan[i]) = -1) then //bahan tidak terdapat di inventori
                    begin
                        bahanCukup := false;
                    end;
                end;
                if(bahanCukup) then
                begin
                    for i := 1 to tipe.arrBahanOlahan[bahanLocation].n do //mengurangi jumlah bahan pada inventori
                    begin
                        tipe.arrInvMentah[1+cariNamaInventori(tipe.arrInvMentah,tipe.arrBahanOlahan[bahanLocation].bahan[i])].jumlah -= 1;
                        freeInventori(1);
                    end;     
                    if(tipe.currentSimulasi.inven_used = tipe.currentSimulasi.inven_cap) then //Inventori tidak mencukupi
                    begin
                        writeln('Inventori penuh, silakan ulangi');
                    end else
                    begin
                        useInventori(1);
                        kurangEnergi(1);
                        Neff := 1;
                        while(tipe.arrInvOlahan[Neff].nama <> '') do //Mencari Neff
                        begin
                            Neff += 1;
                        end;

                        tipe.arrInvOlahan[Neff].nama := namaBahan;
                        tipe.arrInvOlahan[Neff].dd := tipe.currentSimulasi.dd;
                        tipe.arrInvOlahan[Neff].mm := tipe.currentSimulasi.mm;
                        tipe.arrInvOlahan[Neff].yy := tipe.currentSimulasi.yy;
                        tipe.arrInvOlahan[Neff].jumlah := 1;
                        tipe.currentSimulasi.bhn_olah_dibuat += 1;
                        writeln('Bahan telah berhasil diolah');
                    end;                    
                end else //Terdapat bahan yang kurang
                begin
                    writeln('Bahan tidak cukup, silakan ulangi');
                end;
            end;   
        end;
    end;

    procedure jualOlahan();
    //Menjual bahan olahan
    //I.S: arrInvOlahan dan arrBahanOlahan terdefinisi
    //F.S: Bahan olahan yang akan dijual telah terjual, uang bertambah, energi berkurang.
    var
        hargaJual: longint;
        olahanLocation, olahanDesc: integer;
        namaJual: string;

    begin
        if(tipe.currentSimulasi.energi = 0) then //Energi tidak cukup
        begin
            writeln('Energi tidak cukup, silakan ulangi');
        end else
        begin
            write('Nama Olahan : ');
            readln(namaJual);
            olahanLocation := cariNamaInventori(tipe.arrInvOlahan, namaJual);
            if(olahanLocation = -1) then //Bahan tidak ada di inventori
            begin
                writeln('Bahan olahan tidak ada di inventori, silakan ulangi');
            end else
            begin
                olahanLocation += 1;
                if(tipe.arrInvOlahan[olahanLocation].jumlah = 0) then //Banyak bahan olahan yang diminta adalah 0
                begin
                    writeln('Bahan olahan tidak ada di inventori, silakan ulangi');
                    deleteInventori(olahanLocation, arrInvOlahan)
                end else
                begin
                    olahanDesc := cariNamaOlahan(tipe.arrBahanOlahan, namaJual);
                    olahanDesc += 1;
                    hargaJual := tipe.arrBahanOlahan[olahanDesc].harga;
                    tambahUang(hargaJual);
                    kurangEnergi(1);
                    freeInventori(1);
                    tipe.arrInvOlahan[olahanLocation].jumlah -= 1;
                    if(tipe.arrInvOlahan[olahanLocation].jumlah = 0) then //Bahan telah habis dipakai
                    begin
                        deleteInventori(olahanLocation,arrInvOlahan);
                    end;
                    writeln(namaJual, ' telah dijual');
                    writeln('Anda mendapat ', hargaJual);
                end;
            end;
        end;
    end;

    procedure jualResep ();
    //Menjual resep
    //I.S: arrInvOlahan dan arrResep terdefinisi
    //F.S: Resep yang akan dijual telah terjual, uang bertambah, energi berkurang

    var
        hargaJual: longint;
        resepLocation,i: integer;
        namaJual: string;
        bahanCukup: boolean;

    begin
        if(tipe.currentSimulasi.energi = 0) then //Energi tidak cukup
        begin
            writeln('Energi tidak cukup, silakan ulangi');
        end else
        begin
            write('Nama Resep : ');
            readln(namaJual);
            resepLocation := cariNamaOlahan(tipe.arrResep, namaJual);
            if(resepLocation = -1) then //Bahan tidak ada di inventori
            begin
                writeln('Tidak ada resep seperti itu, silakan ulangi');
            end else
            begin
                resepLocation += 1;
                bahanCukup := true;
                for i := 1 to tipe.arrResep[resepLocation].n do //Mencari ketersediaan bahan di inventori
                begin
                    if(cariNamaInventori(tipe.arrInvMentah,tipe.arrResep[resepLocation].bahan[i]) = -1) then
                    begin
                        if(cariNamaInventori(tipe.arrInvOlahan,tipe.arrResep[resepLocation].bahan[i]) = -1) then
                        begin
                            bahanCukup := false;
                        end;
                    end;
                end;
                if(bahanCukup) then //Semua validasi tercukupi
                begin
                    for i := 1 to tipe.arrResep[resepLocation].n do //Mengurarngi semua bahan yang dibutuhkan
                    begin
                        if(cariNamaInventori(tipe.arrInvMentah,tipe.arrResep[resepLocation].bahan[i]) <> -1) then //Mencari bahan di bahan mentah
                        begin
                            tipe.arrInvMentah[cariNamaInventori(tipe.arrInvMentah,tipe.arrResep[resepLocation].bahan[i])].jumlah -= 1;
                        end else //Mencari bahan di bahan olahan
                        begin
                            tipe.arrInvOlahan[cariNamaInventori(tipe.arrInvOlahan,tipe.arrResep[resepLocation].bahan[i])].jumlah -= 1;
                        end;
                    end;
                    freeInventori(tipe.arrResep[resepLocation].n);
                    hargaJual := tipe.arrResep[resepLocation].harga;
                    tambahUang(hargaJual);
                    kurangEnergi(1);
                    writeln(namaJual, ' telah dijual');
                    writeln('Anda mendapat ', hargaJual);
                end else //Terdapat bahan yang kurang
                begin
                    writeln('Bahan tidak cukup, silakan ulangi');
                end;
            end;
        end;
    end;

    procedure hapusBahanKadaluarsa (); 
    //Menghapus bahan yang sudah kadaluarsa
    //I.S: arrInvMentah dan arrInvOlahan terdefinisi
    //F.S: Semua bahan yang tanggal kadaluarsanya <= tanggal hari pada simulasi akan dihapus
    var
        convertCurrentHari: Integer;
        Neff: integer;

    begin
        Neff := 1;
        convertCurrentHari := convertToHari(tipe.currentSimulasi.dd, tipe.currentSimulasi.mm, tipe.currentSimulasi.yy);
        while(tipe.arrInvMentah[Neff].nama <> '') do //Mencari bahan mentah yang kadaluarsa
        begin
            if(convertCurrentHari - convertToHari(tipe.arrInvMentah[Neff].dd, tipe.arrInvMentah[Neff].mm, tipe.arrInvMentah[Neff].yy) <= 0) then
            begin
                deleteInventori(Neff, tipe.arrInvMentah);
            end;
            Neff += 1;
        end;
        while(tipe.arrInvOlahan[Neff].nama <> '') do //Mencari bahan olahan yang kadaluarsa
        begin
            if(convertCurrentHari - convertToHari(tipe.arrInvOlahan[Neff].dd+3, tipe.arrInvOlahan[Neff].mm, tipe.arrInvOlahan[Neff].yy) <= 0) then
            begin
                deleteInventori(Neff, tipe.arrInvOlahan);
            end;
            Neff += 1 ;
        end;
    end;

    procedure restockBahan();
    //Random bahan mentah yang tersedia di supermarket dengan kemungkinan sebesar 30%
    //I.S: arrBahanMentah terdefinisi
    //F.S: Masing-masing stock di arrBahanMentah menjadi 30
    var
        Neff: Integer;
    begin
        Neff := 1;
        randomize;
        if Random < 0.30 then 
        begin
            while(tipe.arrBahanMentah[Neff].nama <> '') do
            begin
                tipe.arrBahanMentah[Neff].stock := 20;
                Neff += 1;
            end;
            writeln('Bahan di supermarket telah direstock!');
        end;
    end;
end.
