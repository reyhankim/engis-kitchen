
// file main
program main;
uses tipe, handler, aksiLoad;
    
begin
    //load seluruh data dari file eksternal
    loadSimulasi();
    writeln('loadSimulasi OK');
    loadBahanMentah();
    writeln('loadBahanMentah OK');
    loadBahanOlahan();
    writeln('loadBahanOlahan OK');
    loadResep();
    writeln('loadresep OK');
    terminateProgram := False; 
    writeln('terminateProgram Initialized');
    while (not(terminateProgram)) do begin //jalankan program hingga exit()
        runUserInterface();
        writeln('runUserInterface running');
    end;
end.
