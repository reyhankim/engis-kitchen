unit handler;


interface

    uses tipe,aksiChef,energi,uang,inventori,aksiStatistik,aksiSave,aksiSimulasi,aksiLoad,aksiResep,aksiBahan; 

    procedure runUserInterface();

implementation

    procedure promptInput(); //NEW PROCEDURE ADDED 22/04/18 12.21PM BY KIM
    {Memberi tanda untuk memberikan masukan kepada user dengan "> " atau ">> " sesuai dengan berjalannya simulasi atau tidak}
    
    {ALGORITMA LOKAL}
    begin
        if (simulasiRunning) then begin
            write('>> ');
        end else
            write('> ');            
    end;
    
    procedure showCommand();
    {Menampilkan list command yang dapat digunakan pada program engis-kitchen}
    {I.S. : Masukan berupa keyword yang memanggil showCommand()
    * F.S. : Menampilkan list command yang dapat digunakan pada program engis-kitchen}
    {KAMUS LOKAL}
    var
        arrOfCommand : array [1..20] of string;
        commandIdx : integer;

    {ALGORITMA LOKAL}
    begin
        writeln('COMMAND LIST:');
        //list command yang dapat dilakukan saat simulasi tidak berjalan
        arrOfCommand[1] := 'exit : keluar dari program, dan menyimpan semua perubahan data ke file eksternal.';
        arrOfCommand[2] := 'start <nomor_simulasi> :  memulai suatu simulasi nomor tertentu dari daftar simulasi yang ada.';
        //list command yang dapat dilakukan kapanpun
        arrOfCommand[3] := 'lihatInventori : menampilkan data daftar bahan mentah dan bahan olahan yang tersedia di inventori saat ini.';
        arrOfCommand[4] := 'lihatResep : melihat daftar resep yang tersedia, termasuk semua daftar bahan penyusunnya.';
        arrOfCommand[5] := 'cariResep : melakukan pencarian resep berdasarkan nama resep yang tersedia.';
        arrOfCommand[6] := 'tambahResep : melakukan penambahan resep.';
        arrOfCommand[7] := 'upgradeInventori: melakukan perluasan kapasitas inventori.';
        //list command yang dapat dilakukan hanya saat simulasi berjalan
        arrOfCommand[8] := 'stop : menghentikan simulasi tertentu yang sedang berjalan dan menampilkan statistik simulasi';
        arrOfCommand[9] := 'beliBahan : melakukan pembelian bahan mentah dari supermarket.';
        arrOfCommand[10] := 'olahBahan : : melakukan aktivitas pengolahan bahan mentah menjadi bahan olahan.';
        arrOfCommand[11] := 'jualOlahan : menjual bahan olahan.';
        arrOfCommand[12] := 'jualResep : mengolah dan menjual hidangan berdasarkan resep.';
        arrOfCommand[13] := 'makan : Chef makan.';
        arrOfCommand[14] := 'istirahat : Chef istirahat';
        arrOfCommand[15] := 'tidur : Chef tidur.';
        arrOfCommand[16] := 'lihatStatistik : menampilkan statistik simulasi';
        
        if (simulasiRunning) then begin
            writeln('>COMMAND YANG DAPAT DILAKUKAN KAPANPUN<');
            for commandIdx := 3 to 7 do begin
                writeln(arrOfCommand[commandIdx]);
            end;
            writeln();
            writeln('>COMMAND YANG DAPAT DILAKUKAN HANYA SAAT SIMULASI BERJALAN<');
            for commandIdx := 8 to 16 do begin
                writeln(arrOfCommand[commandIdx]);
            end;
        end else begin
            writeln('>COMMAND YANG DAPAT DILAKUKAN KAPANPUN<');
            for commandIdx := 3 to 7 do begin
                writeln(arrOfCommand[commandIdx]);
            end;
            writeln();
            writeln('>COMMAND YANG DAPAT DILAKUKAN HANYA SAAT SIMULASI TIDAK BERJALAN<');
            for commandIdx := 1 to 2 do begin
                writeln(arrOfCommand[commandIdx]);
            end;
        end;
        writeln();
    end;


    procedure runUserInterface();
    {Fungsional masukan dan keluaran, mengecek perintah yang dimasukkan oleh user dengan if conditional,
    dan menjalankan prosedur pada unit-unit lainnya sesuai dengan masukan dari user. }
    {I.S. : masukan dari user berdasarkan spesifikasi fungsi
    * F.S. : terpanggil prosedur yang sesuai denga masukan yang diinginkan pengguna}

    {KAMUS LOKAL}
    var
    c : char;
    strCommand : string;

    {ALGORITMA LOKAL}
    begin
        strCommand := ''; {Definisikan sebuah string kosong sebagai tempat menyimpan masukan yang telah dibaca}
        promptInput();
        repeat
            read(c);
            if((c > ' ') and (ord(c) <> 13) and (ord(c) <> 10)) then
            begin
                strCommand := strCommand + c;
            end;
        until ((c = ' ') or (ord(c) = 10)); {Berhenti membaca masukan ketika menemukan spasi atau baris baru}
    if (simulasiRunning) then {simulasiRunning merupakan tipe boolean yang berubah kondisi ketika pengguna memasukkan masukan "start", berada di unit aksiSimulasi, dan bernilai true ketika simulasi berjalan}
    begin	
    {jika masukan yang terbaca sesuai dengan fungsi yang ada, maka akan menjalankan fungsi tersebut. Masukan ini berjalan saat simulasiRunning=true atau saat simulasi berjalan}
        if (strCommand = 'stopSimulasi') then
        begin
        stopSimulasi();
        end else if (strCommand = 'beliBahan') then
        begin
        beliBahan();
        end else if (strCommand = 'olahBahan') then
        begin
        olahBahan();
        end else if (strCommand = 'jualOlahan') then
        begin
        jualOlahan();
        end else if (strCommand = 'jualResep') then
        begin
        jualResep();
        end else if (strCommand = 'makan') then
        begin
        makan();
        end else if (strCommand = 'istirahat') then
        begin
        istirahat();
        end else if (strCommand = 'tidur') then
        begin
        tidur();
        end else if (strCommand = 'lihatStatistik') then
        begin
        lihatStatistik();
        end else if (strCommand = 'lihatInventori') then
        begin
        lihatInventori();
        end else if (strCommand = 'lihatResep') then
        begin
        lihatResep();
        end else if (strCommand = 'cariResep') then
        begin
        cariResep();
        end else if (strCommand = 'tambahResep') then
        begin
        tambahResep();
        end else if (strCommand = 'upgradeInventori') then
        begin
        upgradeInventori();
        end else if (strCommand = 'commandList') then
        begin
        showCommand();
        end else 
        begin
            writeln('Masukan salah, silakan ulangi');
        end; 
        end else begin	{ masukan yang dapat diterima pada saat simulasi tidak berjalan}
        if (strCommand = 'lihatInventori') then
        begin
        lihatInventori();
        end else if (strCommand = 'lihatResep') then
        begin
        lihatResep();
        end else if (strCommand = 'cariResep') then
        begin
        cariResep();
        end else if (strCommand = 'tambahResep') then
        begin
        tambahResep();
        end else if (strCommand = 'upgradeInventori') then
        begin
        upgradeInventori();
        end else if(strCommand = 'start') then
        begin
        startSimulasi();
        end else if (strCommand = 'commandList') then
        begin
        showCommand();
        end else if (strCommand = 'exit') then
        begin
        terminateProgram := True;
        end else 
        begin
            writeln('Masukan salah, silakan ulangi');
        end;
    end;
    end;
end.
