unit tipe;

interface
    
    type
        bahan_mentah = record
                            nama : string;
                            harga : longint;
                            dur_exp : integer;
                        end;
                        
        hasil_olah = record
                            nama : string;
                            harga : longint;
                            n : integer;
                            bahan : array of string;
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

implementation

end.