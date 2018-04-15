<<<<<<< HEAD
unit aksiSimulasi;

interface
    procedure startSimulasi(); 
    procedure stopSimulasi(); 
    procedure exit(); 
implementation
    uses aksiSave,tipe;
    procedure startSimulasi(); 
    var
        val: Integer;
    begin
        readln(val);
        if((val <= 0) or (val > 10)) then
        begin
            writeln('Masukan salah');
        end else
        begin
            currentSimulasi := dataSimulasi[val];
            simulasiRunning := true;
        end;
    end.
    procedure stopSimulasi(); 
    begin
        simulasiRunning := false;
        lihatStatistik(currentSimulasi, tipe.arrInvMentah, tipe.arrInvOlahan);
    end.
    procedure exit(); 
    begin
        saveInventori();
        saveResep();
        saveSimulasi();
        terminateProgram = true;
    end.
end.
=======
unit aksiSimulasi;

interface
    procedure startSimulasi(); 
    procedure stopSimulasi(); 
    procedure exit(); 
implementation
    uses aksiSave,tipe;
    procedure startSimulasi(); 
    var
        val: Integer;
    begin
        readln(val);
        if((val <= 0) or (val > 10)) then
        begin
            writeln('Masukan salah');
        end else
        begin
            currentSimulasi := dataSimulasi[val];
            simulasiRunning := true;
        end;
    end.
    procedure stopSimulasi(); 
    begin
        simulasiRunning := false;
        lihatStatistik(currentSimulasi, tipe.arrInvMentah, tipe.arrInvOlahan);
    end.
    procedure exit(); 
    begin
        saveInventori();
        saveResep();
        saveSimulasi();
        terminateProgram = true;
    end.
end.
>>>>>>> 0f57db78fab207dd9bf02d3b04c1270f6e050487
