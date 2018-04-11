// HamdaniF
// 4-9-2018
// AksiChef - final

unit aksiChef;

interface

uses
	tipe;

var
	todayMakanCount : integer;
	currentSimulasi : data;
	todayIstirahatCount : integer;

procedure makan ();
{menambah energi sebanyak 3 buah, namun maksimum dalam 1 hari hanya boleh 3x makan}

procedure istirahat();
{menambah energi sebanyak 1 buah, maksimum dalam 1 hari hanya boleh istirahat sebanyak 6x}

procedure tidur(); 
{memulihkan energi menjadi 10 buah. Jika energi habis, aksi yang yang dapat dilakukan oleh Chef hanya 
tidur. Jika Chef tidur, terjadi pergantian hari. Jika terjadi pergantian hari, secara otomatis bahan-bahan
mentah dan olahan yang kadaluarsa pada hari yang baru, dihapus dari inventori.}

Implementation

procedure makan();
//todayMakanCount= 0
//inisialisasi di program utama

Begin
	//pengecekan kondisi makan, jika sudah 3 kali fitur tidak akan dapat digunakan
	case todayMakanCount of
	3 		:writeln('Makan hari ini sudah 3 kali, aksi diurungkan!'); 
	1,2  	:case currentSimulasi.energi of
				0		:writeln('Energimu habis, hanya dapat tidur!');
				1..10	:begin
							todayMakanCount := todayMakanCount + 1 ;
							currentSimulasi.energi := currentSimulasi.energi + 3;
							if (currentSimulasi.energi >10) then
								currentSimulasi.energi := 10;
						 end;
			end;
	end;	
end;

procedure istirahat();
//todayIstirahatCount= 0
//inisialisasi di program utama
Begin
	//pengecekan kondisi istirahat, jika sudah 6 kali fitur tidak akan dapat digunakan
	case todayIstirahatCount of
	6 		:writeln('Istirahat hari ini sudah 6 kali, aksi diurungkan!'); 
	1..5  	:case currentSimulasi.energi of
				0		:writeln('Energimu habis, hanya dapat tidur!');
				1..10	:begin
							todayIstirahatCount := todayIstirahatCount + 1 ;
							currentSimulasi.energi := currentSimulasi.energi + 1;
							if (currentSimulasi.energi >10) then
								currentSimulasi.energi := 10;
						 end;
			 end;
	end;
end;

procedure tidur(); 

//start day 1
//hh_hidup := 1 (inisiasi)
//inisialisasi di program utama
Begin
	if (currentSimulasi.hh_hidup <11) then
	begin
		//refill energi
		currentSimulasi.energi := currentSimulasi.energi + 10;
	
		//perubahan hari
		case currentSimulasi.mm of
		1,3,5,7,8,10,12 :begin
							case currentSimulasi.dd of
							31:begin
									currentSimulasi.dd := 1;
									case currentSimulasi.mm of
									12 			:currentSimulasi.mm := 1;
									1..11	 	:currentSimulasi.mm := currentSimulasi.mm + 1;
									end;
								end;
							1..30:currentSimulasi.dd:= currentSimulasi.dd + 1;
							end;
						end;
		4,6,9,11		:begin
							case currentSimulasi.dd of
							30:begin
									currentSimulasi.dd := 1;
									currentSimulasi.mm := currentSimulasi.mm + 1;
								end;
							1..29:currentSimulasi.dd:= currentSimulasi.dd + 1;
							end;
						end;
		2				:begin
							case currentSimulasi.dd of
							28:begin
									currentSimulasi.dd := 1;
									currentSimulasi.mm := currentSimulasi.mm + 1;
								end;
							1..27:currentSimulasi.dd:= currentSimulasi.dd + 1;
							end;
						end;
		end;
	
	//reset inisiasi
	todayIstirahatCount := 0;
	todayMakanCount		:= 0;

	//Penambahan hari
	currentSimulasi.hh_hidup := currentSimulasi.hh_hidup + 1;
	
	//Hapus Bahan kadaluarsa saat tidur
	hapusBahanKadaluarsa;
	end
else {currentSimulasi.hh_hidup : 10}
	//end game?
	begin
	stopSimulasi;
	clrscr;
	end;
end;


end.
