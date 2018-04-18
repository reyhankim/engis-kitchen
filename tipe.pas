unit tipe;

interface
    
    type
        bahan_mentah = record
                            nama : string;
                            harga : longint;
                            dur_exp : integer;
                            stock: integer;
                        end;
                        
        hasil_olah = record
                            nama : string;
                            harga : longint;
                            n : integer;
                            bahan : array[1..1000] of string;
                        end;
                        
        isi_inventori = record
                            nama : string;
                            dd : integer;
                            mm : integer;
                            yy : integer;
                            jumlah : integer;
                        end;
                        
        data = record
                    nomor : integer;
                    hh_hidup : integer;
                    energi : integer;
                    inven_cap : integer;
                    inven_used : integer;
                    mentah_dibeli : integer;
                    bhn_olah_dibuat : integer;
                    bhn_olah_dijual : integer;
                    resep_dijual : integer;
                    sum_income : longint;
                    sum_outcome : longint;
                    sum_uang : longint;
                    dd : integer;
                    mm : integer;
                    yy : integer;
                end;
    
    const
        harga_upgrade = 10000;

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

implementation

end.