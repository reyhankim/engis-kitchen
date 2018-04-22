unit aksiSimulasi;

interface
    procedure startSimulasi(); 
    //Memulai simulasi 
    //I.S: simulasiRunning bernilai false
    //F.S: simulasiRunning bernilai true
    procedure stopSimulasi(); 
    //Menghentikan simulasi dan memasukkan currentSimulasi ke data
    //I.S: simulasiRunning bernilai true
    //F.S: simulasiRunning bernilai false, statistik simulasi diperlihatkan
    procedure exit(); 
    //Keluar dari program
    //I.S: terminateProgram bernilai False
    //F.S: Data inventori, resep, dan simulasi disimpan di dalam file external. terminateProgram bernilai true
implementation
    uses tipe, aksiSave,aksiStatistik;

    procedure startSimulasi();
    //Memulai simulasi 
    //I.S: simulasiRunning bernilai false
    //F.S: simulasiRunning bernilai true
    var
        val: Integer;
    begin
        readln(val);
        if(tipe.simulasiRunning) then //Sudah ada simulasi yang berjalan
        begin
            writeln('Sudah ada simulasi yang berjalan');
        end else if((val <= 0) or (val > 10)) then //Simulasi yang diinginkan di luar simulasi yang tersedia
        begin
            writeln('Masukan salah');
        end else  //Validasi berhasil
        begin
            writeln('Simulasi ', val, ' berjalan');
            tipe.currentSimulasi := tipe.dataSimulasi[val];
            tipe.dataSimulasi[val].nomor := val;
            tipe.simulasiRunning := true;
        end;
    end;

    procedure stopSimulasi(); 
    //Menghentikan simulasi dan memasukkan currentSimulasi ke data
    //I.S: simulasiRunning bernilai true
    //F.S: simulasiRunning bernilai false, statistik simulasi diperlihatkan
    begin
        if(tipe.simulasiRunning = false) then //Tidak ada simulasi yang sedang dijalankan
        begin
            writeln('Tidak ada simulasi yang sedang berjalan');
        end else 
        begin
            writeln('Simulasi ', tipe.simulasiRunning,' berhenti');
            tipe.simulasiRunning := false;
            tipe.dataSimulasi[tipe.currentSimulasi.nomor] := tipe.currentSimulasi;
        end;
        lihatStatistik();
    end;

    procedure exit(); 
    //Keluar dari program
    //I.S: terminateProgram bernilai False
    //F.S: Data inventori, resep, dan simulasi disimpan di dalam file external. terminateProgram bernilai true
    begin
        writeln('Program berhenti');
        saveInventori();
        saveResep();
        saveSimulasi();
        tipe.terminateProgram := true;
    end;
end.