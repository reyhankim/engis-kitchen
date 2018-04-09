// file main
program main;
uses tipe, handler, aksiLoad;

var
    arrBahanMentah : array [1..1024] of bahan_mentah;
    arrBahanOlahan : array [1..1024] of hasil_olah;
    dataSimulasi : array [1..128] of data;
    arrInvMentah : array [1..512] of isi_inventori;
    arrInvOlahan : array [1..512] of isi_inventori;
    arrResep : array [1..256] of hasil_olah;
    currentSimulasi : data;
    uang : longint;
    terminateProgram, simulasiRunning : boolean;
    todayIstirahatCount, todayMakanCount : integer;
    
begin
    load();
    terminateProgram := False;
    while(not(terminateProgram)) do begin
        runUserInterface();
    end;
end.