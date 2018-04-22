// HamdaniF
// 4-9-2018
// AksiChef - final

unit aksiChef;

interface

uses
	tipe,aksiSimulasi,aksiBahan;

procedure makan ();
{menambah energi sebanyak 3 buah, namun maksimum dalam 1 hari hanya boleh 3x makan}

procedure istirahat();
{menambah energi sebanyak 1 buah, maksimum dalam 1 hari hanya boleh istirahat sebanyak 6x}

procedure tidur(); 
{memulihkan energi menjadi 10 buah. Jika energi habis, aksi yang yang dapat dilakukan oleh Chef hanya 
tidur. Jika Chef tidur, terjadi pergantian hari. Jika terjadi pergantian hari, secara otomatis bahan-bahan
mentah dan olahan yang kadaluarsa pada hari yang baru, dihapus dari inventori.}

implementation

procedure makan();
//todayMakanCount= 0
//inisialisasi di program utama

Begin
	//pengecekan kondisi makan, jika sudah 3 kali fitur tidak akan dapat digunakan
	writeln('Kamu menyiapkan makananmu!');
	if (todayEnergyPlus <8) then
		begin
			case todayMakanCount of
			3 		:writeln('Makan hari ini sudah 3 kali. Karena takut dietmu gagal, kamu ga jadi makan, deh!'); 
			0,1,2  	:case currentSimulasi.energi of
						0		:writeln('Energimu habis, hanya dapat tidur!');
						1..10	:begin
									todayMakanCount := todayMakanCount + 1 ;
									currentSimulasi.energi := currentSimulasi.energi + 3;
									todayEnergyPlus:=todayEnergyPlus + 3;
									if (currentSimulasi.energi >10) then
										currentSimulasi.energi := 10;
									writeln('Kamu telah berasil makan');
								end;
					end;
			end;
		end
	else
		begin
			writeln('menambahkan energi maksimal 10 per hari, makan gagal');
		end;
end;

procedure istirahat();
//todayIstirahatCount= 0
//inisialisasi di program utama
Begin
	//pengecekan kondisi istirahat, jika sudah 6 kali fitur tidak akan dapat digunakan
	if (todayEnergyPlus <10) then
		begin	
			writeln('Kamu akan istirahat');
			case todayIstirahatCount of
			6 		:writeln('Istirahat hari ini sudah 6 kali. "Mageran banget sih aku," katamu. Kamu pun mengurungkan niatmu.'); 
			0..5  	:case currentSimulasi.energi of
						0		:writeln('Energimu habis, hanya dapat tidur!');
						1..10	:begin
									todayIstirahatCount := todayIstirahatCount + 1 ;
									currentSimulasi.energi := currentSimulasi.energi + 1;
									todayEnergyPlus := todayEnergyPlus+1;
									if (currentSimulasi.energi >10) then
										currentSimulasi.energi := 10;
									writeln('Kamu telah berasil istirahat');
								end;
					end;
			end;
		end
	else
		begin
			writeln('menambahkan energi maksimal 10 tiap hari, istirahat gagal');
		end;	
end;

procedure tidur(); 

//start day 1
//hh_hidup := 0 (inisiasi)
//inisialisasi di program utama
Begin
	if (currentSimulasi.hh_hidup <10) then
	begin
		//refill energi
		currentSimulasi.energi := 10;
		writeln('Kamu akan tidur');
		
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
	todayEnergyPlus		:= 0;

	//Penambahan hari
	currentSimulasi.hh_hidup := currentSimulasi.hh_hidup + 1;
	
	//Hapus Bahan kadaluarsa saat tidur
	hapusBahanKadaluarsa;
	end
else {currentSimulasi.hh_hidup : 10}
	//end game?
	begin
	stopSimulasi;
	writeln('Chef sudah pensiun karena terlalu stres mengerjakan program');
	end;
end;


end.
