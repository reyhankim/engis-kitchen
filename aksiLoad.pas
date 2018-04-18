unit aksiLoad;

interface
    uses tipe;
    procedure loadBahanMentah(); 
    procedure loadBahanOlahan();
    procedure loadResep(); 
    procedure loadInventori(); 
    procedure loadSimulasi();
implementation
    type //tipe data untuk mengambil hasil parsing dari suatu string menjadi array of string
        parseResult = record
            arr : array[1..105] of string;
        end;

    function input(var fileName: text): parseResult;
    //fungsi input(fileName) membaca input dari file fileName dan mengubahnya sehingga
    //masing-masing bagian terdapat dalam bentuk string
    //I.S: input kosong
    //F.S: input berisi array dengan isi masing-masing elemen dalam bentuk string
    var
        s: string;
        i,cur: integer;

    begin
        for i := 1 to 100 do //init
        begin
            input.arr[i] := '';
        end;
        readln(filename,s);
        cur := 1;
        for i := 1 to length(s) do 
        begin
            if((s[i] = '|') or (i = length(s)) or (s[i] = '/'))then
            begin
                while (input.arr[cur][1] = ' ') do //Menghapus semua spasi di awal string
                begin
                    delete(input.arr[cur],1,1); 
                end;

                while (input.arr[cur][length(input.arr[cur])] = ' ') do //Menghapus semua spasi di akhir string
                begin
                    delete(input.arr[cur],length(input.arr[cur]),1); 
                end;
                cur += 1;
                continue;
            end else
            begin
                input.arr[cur] += s[i];
            end;
        end;
    end;
    
    function convStringToInt(s: string): longint;
    //Mengubah suatu string menjadi longint dengan nilai positif
    //I.S: convStringToInt nilainya 0
    //F.S: convStringToInt bernilai s namun dalam bentuk longint
    begin
        val(s, convStringToInt)
    end;

    procedure loadBahanMentah(); 
    //Membaca file dari 'listBahanMentah.dat' dan memasukannya ke dalam array
    //I.S: arrBahanMentah kosong
    //F.S: arrBahanMentah terisi
    const 
        FILENAME = 'listBahanMentah.dat';
    
    var
        fileInput : text;
        parseRes: parseResult;
        idx: integer;
    
    begin
        idx := 1;
        Assign(fileInput, FILENAME);
        reset(fileInput);
        while not eof(fileInput) do //membaca sampai end of file
        begin
            parseRes := input(fileInput);
            tipe.arrBahanMentah[idx].nama := parseRes.arr[1];
            tipe.arrBahanMentah[idx].harga := convStringToInt(parseRes.arr[2]);
            tipe.arrBahanMentah[idx].dur_exp := convStringToInt(parseRes.arr[3]);
            tipe.arrBahanMentah[idx].stock := convStringToInt(parseRes.arr[4]);
            idx += 1;
        end;
        close(fileInput);
    end;
    
    procedure loadResepTemplate(var arrResepTemplate: array of tipe.hasil_olah; FILENAME: string);
    //Template untuk mengambil input resep dari file FILENAME
    //I.S: arrResepTemplate kosong
    //F.S: arrResepTemplate terisi
    var
        fileInput : text;
        parseRes: parseResult;
        idx,i: integer;
    
    begin
        idx := 0;
        Assign(fileInput, FILENAME);
        reset(fileInput);
        //arrResepTemplate[0].nama := '';
        while not eof(fileInput) do //membaca sampai end of file
        begin
            parseRes := input(fileInput);
            arrResepTemplate[idx].nama := parseRes.arr[1];
            arrResepTemplate[idx].harga := convStringToInt(parseRes.arr[2]);
            arrResepTemplate[idx].n := convStringToInt(parseRes.arr[3]);
            for i := 1 to arrResepTemplate[idx].n do
            begin
                arrResepTemplate[idx].bahan[i] := parseRes.arr[3+i];
            end;
            idx += 1;
        end;
        close(fileInput);
    end;

    procedure loadBahanOlahan();
    //Mengambil list bahan olahan dari file 'listBahanOlahan.dat'
    //I.S: arrBahanOlahan kosong
    //F.S: arrBahanOlahan terisi
    begin
        loadResepTemplate(tipe.arrBahanOlahan, 'listBahanOlahan.dat')
    end;

    procedure loadResep(); 
    //Mengambil list list resep dari 'resep.dat'
    //I.S: arrResep kosong
    //F.S: arrResep terisi  
    begin
        loadResepTemplate(tipe.arrResep, 'resep.dat')
    end;

    procedure loadInventoriTemplate(var arrInvTemplate: array of tipe.isi_inventori; FILENAME: string);
    //Template untuk mengambil isi inventori dari file FILENAME
    //I.S: arrInvTemplate kosong
    //F.S: arrInvTemplate terisi
    var
        fileInput : text;
        parseRes: parseResult;
        idx,i: integer;
    
    begin
        idx := 0;
        Assign(fileInput, FILENAME);
        reset(fileInput);
        while not eof(fileInput) do //Membaca sampai end of file
        begin
            parseRes := input(fileInput);
            arrInvTemplate[idx].nama := parseRes.arr[1];
            arrInvTemplate[idx].dd := convStringToInt(parseRes.arr[2]);
            arrInvTemplate[idx].mm := convStringToInt(parseRes.arr[3]);
            arrInvTemplate[idx].yy := convStringToInt(parseRes.arr[4]);
            arrInvTemplate[idx].jumlah := convStringToInt(parseRes.arr[5]);
            for i := 1 to 10 do //update inven_used
            begin
                tipe.dataSimulasi[i].inven_used += arrInvTemplate[idx].jumlah;
            end;
            idx += 1;
        end;
        close(fileInput);
    end;

    procedure loadInventori(); 
    //Mengambil isi inventori bahan mentah dari 'listInvenMentah.dat' dan isi inventori
    //bahan olahan dari 'listInvenOlahan.dat'
    //I.S: arrInvMentah dan arrInvOlahan kosong
    //F.S: arrInvMentah dan arrInvOlahan terisi
    begin
        loadInventoriTemplate(tipe.arrInvMentah, 'listInvenMentah.dat');
        loadInventoriTemplate(tipe.arrInvOlahan, 'listInvenOlahan.dat');
    end;

    procedure loadSimulasi();
    //Mengambil data-data simulasi dari 'dataSimulasi.dat'
    //I.S: array dataSimulasi kosong
    //F.S: array dataSimulasi terisi
    var
        fileInput : text;
        parseRes: parseResult;
        idx: integer;
    
    begin
        Assign(fileInput, 'dataSimulasi.dat');
        reset(fileInput);
        idx := 1;
        while not eof(fileInput) do //Membaca sampai end of file
        begin
            parseRes := input(fileInput);
            tipe.dataSimulasi[idx].nomor := convStringToInt(parseRes.arr[1]);
            tipe.dataSimulasi[idx].dd := convStringToInt(parseRes.arr[2]);
            tipe.dataSimulasi[idx].mm := convStringToInt(parseRes.arr[3]);
            tipe.dataSimulasi[idx].yy := convStringToInt(parseRes.arr[4]);
            tipe.dataSimulasi[idx].hh_hidup := convStringToInt(parseRes.arr[5]);
            tipe.dataSimulasi[idx].energi := convStringToInt(parseRes.arr[6]);
            tipe.dataSimulasi[idx].inven_cap := convStringToInt(parseRes.arr[7]);
            tipe.dataSimulasi[idx].mentah_dibeli := convStringToInt(parseRes.arr[8]);
            tipe.dataSimulasi[idx].bhn_olah_dibuat := convStringToInt(parseRes.arr[9]);
            tipe.dataSimulasi[idx].bhn_olah_dijual := convStringToInt(parseRes.arr[10]);
            tipe.dataSimulasi[idx].resep_dijual := convStringToInt(parseRes.arr[11]);
            tipe.dataSimulasi[idx].sum_income := convStringToInt(parseRes.arr[12]);
            tipe.dataSimulasi[idx].sum_outcome := convStringToInt(parseRes.arr[13]);
            tipe.dataSimulasi[idx].sum_uang := convStringToInt(parseRes.arr[14]);
            idx += 1;
        end;
        close(fileInput);
    end;
end.