
// file main
program main;
uses tipe, handler, aksiLoad;
    
begin
    //load seluruh data dari file eksternal
    writeln('=====================================ENGIS KITCHEN=====================================');
    loadSimulasi();
    writeln('loadSimulasi OK');
    loadBahanMentah();
    writeln('loadBahanMentah OK');
    loadBahanOlahan();
    writeln('loadBahanOlahan OK');
    loadResep();
    writeln('loadresep OK');
    loadInventori();
    writeln('loadInventori OK');
    terminateProgram := False; 
    writeln('terminateProgram Initialized');
    writeln('HINT: Input command "commandList" untuk menampilkan daftar perintah yang dapat diberikan.');
    while (not(terminateProgram)) do begin //jalankan program hingga exit()
        runUserInterface();
    end;
end.