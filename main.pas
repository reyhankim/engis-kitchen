
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
    loadInventori();
    writeln('loadInventori OK');
    terminateProgram := False; 
    writeln('terminateProgram Initialized');
    writeln('Pilihan Command:');
    writeln('start (angka)');
    writeln('beliBahan');
    writeln('olahBahan');
    writeln('jualOlahan');
    writeln('jualResep');
    writeln('makan');
    writeln('istirahat');
    writeln('tidur');
    writeln('lihatStatistik');
    writeln('lihatInventori');
    writeln('lihatResep');
    writeln('cariResep');
    writeln('tambahResep');
    writeln('upgradeInventori');
    while (not(terminateProgram)) do begin //jalankan program hingga exit()
        runUserInterface();
        writeln('runUserInterface running');
    end;
end.