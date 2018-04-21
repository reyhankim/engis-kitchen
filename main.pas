
// file main
program main;
uses tipe, handler, aksiLoad;
    
begin
    //load seluruh data dari file eksternal
    loadSimulasi();
    loadBahanMentah();
    loadBahanOlahan();
    loadResep();
    terminateProgram := False; 
    while (not(terminateProgram)) do begin //jalankan program hingga exit()
        runUserInterface();
    end;
end.
