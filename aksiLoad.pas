unit aksiLoad;

interface
    uses tipe;
    procedure loadBahanMentah(var arrBahanMentah : array of tipe.bahan_mentah); 
    procedure loadBahanOlahan(var arrBahanOlahan : array of tipe.hasil_olah);
    procedure loadResep(var arrResep : array of tipe.hasil_olah); 
    procedure loadInventori(var arrInvMentah : array of tipe.isi_inventori; var arrInvOlahan : array of tipe.isi_inventori); 
implementation
    //uses tipe;

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
        readln(filename,s);
        cur := 1;
        for i := 1 to length(s) do 
        begin
            if((s[i] = '|') or (i = length(s)))then
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
    var
        i: integer;
    
    begin
        convStringToInt := 0;
        for i := 1 to length(s) do
        begin
            convStringToInt *= 10;
            convStringToInt += ord(s[i]);
        end;
    end;

    procedure loadBahanMentah(var arrBahanMentah : array of tipe.bahan_mentah); 
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
        Assign(fileInput, FILENAME);
        reset(fileInput);
        while not eof(fileInput) do //membaca sampai end of file
        begin
            parseRes := input(fileInput);
            arrBahanMentah[idx].nama := parseRes.arr[1];
            arrBahanMentah[idx].harga := convStringToInt(parseRes.arr[2]);
            arrBahanMentah[idx].dur_exp := convStringToInt(parseRes.arr[3]);
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
        Assign(fileInput, FILENAME);
        reset(fileInput);
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

    procedure loadBahanOlahan(var arrBahanOlahan : array of tipe.hasil_olah);
    //Mengambil list bahan olahan dari file 'listBahanOlahan.dat'
    //I.S: arrBahanOlahan kosong
    //F.S: arrBahanOlahan terisi
    begin
        loadResepTemplate(arrBahanOlahan, 'listBahanOlahan.dat')
    end;

    procedure loadResep(var arrResep : array of tipe.hasil_olah); 
    //Mengambil list list resep dari 'resep.dat'
    //I.S: arrResep kosong
    //F.S: arrResep terisi  
    begin
        loadResepTemplate(arrResep, 'resep.dat.')
    end;

    procedure loadInventoriTemplate(var arrInvTemplate: array of tipe.isi_inventori; FILENAME: string);
    //Template untuk mengambil isi inventori dari file FILENAME
    //I.S: arrInvTemplate kosong
    //F.S: arrInvTemplate terisi
    var
        fileInput : text;
        parseRes: parseResult;
        idx: integer;
    
    begin
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
            idx += 1;
        end;
        close(fileInput);
    end;
    procedure loadInventori(var arrInvMentah : array of tipe.isi_inventori; var arrInvOlahan : array of tipe.isi_inventori); 
    //Mengambil isi inventori bahan mentah dari 'listInvenMentah.dat' dan isi inventori
    //bahan olahan dari 'listInvenOlahan.dat'
    //I.S: arrInvMentah dan arrInvOlahan kosong
    //F.S: arrInvMentah dan arrInvOlahan terisi
    var
        fileInput : text;
        parseRes: parseResult;
        idx: integer;
    
    begin
        loadInventoriTemplate(arrInvMentah, 'listInvenMentah.dat');
        loadInventoriTemplate(arrInvOlahan, 'listInvenOlahan.dat');
    end;
end.