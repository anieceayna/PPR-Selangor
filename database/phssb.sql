-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 30, 2021 at 06:40 AM
-- Server version: 5.7.18-log
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phssb`
--
CREATE DATABASE IF NOT EXISTS `phssb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phssb`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateKontrak` (`_idkontrak` VARCHAR(5), `_icpengguna` VARCHAR(13), `_idpemohon` VARCHAR(5), `_idpasangan` VARCHAR(5), `_idpendapatan` VARCHAR(5), `_idsalinanic` VARCHAR(5), `_idsalinanicp` VARCHAR(5), `_idsalinanlahir` VARCHAR(5), `_idsalinanlahirp` VARCHAR(5), `_idsalinanmajikan` VARCHAR(5), `_idsalinanpendapatan` VARCHAR(5), `_idstatus` VARCHAR(6), `_idtaraf` VARCHAR(6), `_jeniskontrak` VARCHAR(7), `_statuskontrak` VARCHAR(13))  BEGIN
	INSERT INTO kontrakppr(ID_Kontrak, IC_Pengguna, ID_Pasangan, ID_Pemohon, ID_Pendapatan, ID_SalinanIC, ID_SalinanICPasangan, ID_SalinanLahir, ID_SalinanLahirPasangan, ID_SalinanMajikan, ID_SalinanPendapatan, ID_StatusPemohon, ID_TarafPemohon, Jenis_Kontrak, Status_Kontrak, Sewa_Unit)
	VALUES (_idkontrak, _icpengguna, _idpasangan, _idpemohon, _idpendapatan, _idsalinanic, _idsalinanicp, _idsalinanlahir, _idsalinanlahirp, _idsalinanmajikan, _idsalinanpendapatan, _idstatus, _idtaraf, _jeniskontrak, _statuskontrak, 0.00);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `defaultKemaskini` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Nama_Pengguna,IC_Pengguna, Tel_Pengguna, Emel_Pengguna, Alamat_Pengguna,Poskod_Pengguna, Bandar_Pengguna, Negeri_Pengguna,Kata_Laluan
	FROM pengguna
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DefaultKemaskiniStaff` (`_icstaff` VARCHAR(13))  BEGIN
	SELECT Nama_Staff ,IC_Staff, Tel_Staff, Emel_Staff, Alamat_Staff, Poskod_Staff, Bandar_Staff, Negeri_Staff, Kata_Laluan
	FROM staff
	WHERE IC_Staff = _icstaff;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `defaultPPR` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Nama_Pengguna,IC_Pengguna, Tel_Pengguna
	FROM pengguna
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStaffByIC` (`_icstaff` VARCHAR(13))  BEGIN
	DELETE from staff
	WHERE IC_Staff = _icstaff;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteTanggungan` (`_ickeluarga` VARCHAR(13))  BEGIN
	DELETE FROM maklumat_tanggungan
	WHERE IC_Ahli = _ickeluarga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayBill` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT FORMAT(Sewa_Unit,2) As 'Sewa_Unit'
	FROM kontrakppr
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DownloadGaji` (`_gajifilename` VARCHAR(255))  BEGIN
	SELECT Pendapatan_Filename, Pendapatan_Type, Pendapatan_Data
	FROM salinan_pendapatan
	WHERE Pendapatan_Filename = _gajifilename;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DownloadIC` (`_icfilename` VARCHAR(255))  BEGIN
	SELECT PemohonIC_Filename, PemohonIC_Type, PemohonIC_Data
	FROM salinan_ic_pemohon
	WHERE PemohonIC_Filename = _icfilename;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DownloadICP` (`_icpfilename` VARCHAR(255))  BEGIN
	SELECT PasanganIC_Filename, PasanganIC_Type, PasanganIC_Data
	FROM salinan_ic_pasangan
	WHERE PasanganIC_Filename = _icpfilename;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DownloadLahir` (`_lahirfilename` VARCHAR(255))  BEGIN
	SELECT LahirPemohon_Filename, LahirPemohon_Type, LahirPemohon_Data
	FROM salinan_lahir_pemohon
	WHERE LahirPemohon_Filename = _lahirfilename;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DownloadLahirP` (`_lahirpfilename` VARCHAR(255))  BEGIN
	SELECT LahirPasangan_Filename, LahirPasangan_Type, LahirPasangan_Data
	FROM salinan_lahir_pasangan
	WHERE LahirPasangan_Filename = _lahirpfilename;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DownloadMajikan` (`_majikanfilename` VARCHAR(255))  BEGIN	
	SELECT Majikan_Filename, Majikan_Type, Majikan_Data
	FROM salinan_majikan
	WHERE Majikan_Filename = _majikanfilename;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDGaji` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Pendapatan) FROM PENDAPATAN),4,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDKeluarga` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Keluarga) FROM MAKLUMAT_TANGGUNGAN),4,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDKontrak` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Kontrak) FROM KONTRAKPPR),4,1);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDLahir` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_LahirPemohon) FROM SALINAN_LAHIR_PEMOHON),5,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDLahirP` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_LahirPasangan) FROM SALINAN_LAHIR_PASANGAN),5,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDMajikan` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Majikan) FROM SALINAN_MAJIKAN),5,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDPasangan` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(Pasangan_ID) FROM MAKLUMAT_PASANGAN),4,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDPemohon` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(Maklumat_ID) FROM MAKLUMAT_PEMOHON),4,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDSGaji` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Pendapatan) FROM SALINAN_PENDAPATAN),5,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDSICPasangan` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_ICPasangan) FROM SALINAN_IC_PASANGAN),5,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDSICPemohon` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_ICPemohon) FROM SALINAN_IC_PEMOHON),5,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDStatus` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Status) FROM STATUS_PEMOHON),4,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenIDTaraf` ()  BEGIN
	SELECT SUBSTRING((SELECT MAX(ID_Tempat) FROM TARAF_PEMOHON),4,1);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetICPemohon` (`_idkontrak` VARCHAR(5))  BEGIN
	SELECT IC_Pengguna
	FROM kontrakppr	
	WHERE ID_Kontrak = _idkontrak;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GVTanggungan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Nama_Ahli,Hubungan_Ahli,DATE_FORMAT(DOB_Ahli, "%d %M %Y") AS 'DOB_Ahli', IC_Ahli, Jantina_Ahli, Pendapatan_Ahli
	FROM maklumat_tanggungan 
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GVUser` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT K.ID_Kontrak, K.Jenis_Kontrak, DATE_FORMAT(K.Tarikh_Mula, "%d %M %Y") AS 'Tarikh_Mula', DATE_FORMAT(K.Tarikh_Akhir, "%d %M %Y") AS 'Tarikh_Akhir', K.Sewa_Unit, K.Status_Kontrak, P.Kawasan
	FROM ppr_catalog P JOIN kontrakppr K
	ON IC_Pengguna = _icpengguna;

	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HomeKontrak` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT COUNT(ID_Kontrak) AS "Properti"
	FROM kontrakppr
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HomeProfile` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT P.IC_Pengguna,P.Nama_Pengguna, P.Tel_Pengguna, P.Emel_Pengguna  
	FROM pengguna P
	WHERE P.IC_Pengguna = _icpengguna;
	

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KiraKontrak` ()  BEGIN
	Select COUNT(ID_Kontrak) AS 'countKontrak'
FROM kontrakppr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KontrakPPR` (`_idkontrak` VARCHAR(5), `_icpengguna` VARCHAR(13), `_status` VARCHAR(20), `_idpemohon` VARCHAR(5), `_idpasangan` VARCHAR(5), `_idtanggungan` VARCHAR(5), `_idpendapatan` VARCHAR(5), `_idsalinanic` VARCHAR(5), `_idsalinanicp` VARCHAR(5), `_idsalinanlahir` VARCHAR(5), `_idsalinanlahirp` VARCHAR(5), `_idsalinanmajikan` VARCHAR(5), `_idsalinangaji` VARCHAR(5), `_idstatus` VARCHAR(6), `_idtaraf` VARCHAR(6))  BEGIN
	INSERT INTO kontrakppr(ID_Kontrak, IC_Pengguna, Status_Kontrak, ID_Pemohon, ID_Pasangan, ID_Tanggungan, ID_Pendapatan, ID_SalinanIC, ID_SalinanICPasangan, ID_SalinanLahir, ID_SalinanLahirPasangan, ID_SalinanMajikan, ID_SalinanPendapatan, ID_StatusPemohon, ID_TarafPemohon)
	VALUES (_idkontrak, _icpengguna, _status, _idpemohon, _idpasangan, _idtanggungan, _idpendapatan, _idsalinanic, _idsalinanicp, _idsalinanlahir, _idsalinanlahirp, _idsalinanmajikan, _idsalinangaji, _idstatus, _idtaraf);
	INSERT INTO log_ppr (ID_Kontrak, Status_Kontrak)
	VALUES (_idkontrak, _status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MaklumatPasangan` (`_idpasangan` VARCHAR(5), `_icpengguna` VARCHAR(13), `_namapasangan` VARCHAR(50), `_icpasangan` VARCHAR(13), `_alamatpasangan` VARCHAR(100), `_poskodpasangan` INT, `_bandarpasangan` VARCHAR(50), `_negeripasangan` VARCHAR(20), `_telpasangan` VARCHAR(15), `_kecacatan` VARCHAR(100))  BEGIN
	INSERT INTO maklumat_pasangan(Pasangan_ID, IC_Pengguna, Nama_Pasangan,IC_Pasangan, AlamatK_Pasangan, Poskod_Pasangan, Bandar_Pasangan, Negeri_Pasangan, Tel_Pasangan, Kecacatan)
	VALUES (_idpasangan, _icpengguna, _namapasangan, _icpasangan, _alamatpasangan, _poskodpasangan, _bandarpasangan, _negeripasangan, _telpasangan, _kecacatan);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MaklumatPemohon` (`_idmaklumat` VARCHAR(5), `_icpengguna` VARCHAR(13), `_alamatsurat` VARCHAR(150), `_poskodsurat` INT, `_bandarsurat` VARCHAR(50), `_negerisurat` VARCHAR(20), `_tempatkerja` VARCHAR(50), `_alamatkerja` VARCHAR(100), `_poskodkerja` INT(6), `_bandarkerja` VARCHAR(50), `_negerikerja` VARCHAR(20), `_telpejabat` VARCHAR(13), `_tarikhlahir` DATE, `_negerilahir` VARCHAR(20), `_jantina` VARCHAR(10), `_agama` VARCHAR(15), `_kaum` VARCHAR(30), `_pekerjaan` VARCHAR(25))  BEGIN
	INSERT INTO maklumat_pemohon(Maklumat_ID, IC_Pengguna, Alamat_Surat, Poskod_Surat, Bandar_Surat, Negeri_Surat, Tempat_Kerja, Alamat_Kerja, Poskod_Kerja, Bandar_Kerja, Negeri_Kerja, Tel_Pejabat, Tarikh_Lahir, Negeri_Lahir, Jantina, Kaum, Agama, Pekerjaan)
	VALUES (_idmaklumat, _icpengguna, _alamatsurat, _poskodsurat, _bandarsurat, _negerisurat, _tempatkerja, _alamatkerja, _poskodkerja, _bandarkerja, _negerikerja, _telpejabat, _tarikhlahir, _negerilahir, _jantina, _kaum, _agama, _pekerjaan);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MaklumatTanggungan` (`_idkeluarga` VARCHAR(5), `_icpengguna` VARCHAR(13), `_namaahli` VARCHAR(50), `_hubunganahli` VARCHAR(15), `_dobahli` DATE, `_icahli` VARCHAR(13), `_jantinaahli` VARCHAR(10), `_pendapatanahli` DOUBLE)  BEGIN
	INSERT INTO maklumat_tanggungan(ID_Keluarga, IC_Pengguna, Nama_Ahli, Hubungan_Ahli, DOB_Ahli, IC_Ahli, Jantina_Ahli, Pendapatan_Ahli)
	VALUES (_idkeluarga, _icpengguna, _namaahli, _hubunganahli, _dobahli, _icahli, _jantinaahli, _pendapatanahli);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pendapatan` (`_idpendapatan` VARCHAR(5), `_icpengguna` VARCHAR(13), `_gajipemohon` DOUBLE, `_gajipasangan` DOUBLE, `_gajirumah` DOUBLE)  BEGIN
	INSERT INTO pendapatan(ID_Pendapatan, IC_Pengguna, Pendapatan_Pengguna, Pendapatan_Pasangan,Pendapatan_Rumah)
	VALUES (_idpendapatan, _icpengguna, _gajipemohon, _gajipasangan, _gajirumah);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterPengguna` (`_ic` VARCHAR(13), `_nama` VARCHAR(50), `_alamat` VARCHAR(100), `_poskod` INT(5), `_bandar` VARCHAR(50), `_negeri` VARCHAR(15), `_tel` VARCHAR(12), `_emel` VARCHAR(50), `_desc` VARCHAR(13), `_katalaluan` VARCHAR(10))  BEGIN
		INSERT into pengguna(IC_Pengguna, Nama_Pengguna, Alamat_Pengguna, Poskod_Pengguna, Bandar_Pengguna, Negeri_Pengguna, Tel_Pengguna, Emel_Pengguna, Kata_Laluan)
		values (_ic, _nama, _alamat, _poskod, _bandar, _negeri, _tel, _emel, _katalaluan);
		INSERT into log_pengguna(IC_Pengguna,Description)
		values (_ic, _desc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveICPasangan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_ICPasangan
	FROM salinan_ic_pasangan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveICPemohon` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_ICPemohon
	FROM salinan_ic_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveIDPasangan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Pasangan_ID
	FROM maklumat_pasangan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveIDPemohon` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Maklumat_ID
	FROM maklumat_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveIDPendapatan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_Pendapatan
	FROM pendapatan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveIDStatus` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT	ID_Status
	FROM status_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveIDTanggungan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_Keluarga
	FROM	maklumat_tanggungan
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveIDTaraf` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_Tempat
	FROM taraf_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveLahir` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_LahirPemohon
	FROM salinan_lahir_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveLahirPasangan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_LahirPasangan
	FROM salinan_lahir_pasangan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveMajikan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_Majikan
	FROM salinan_majikan
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrievePendapatan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT ID_Pendapatan
	FROM salinan_pendapatan
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalinanGaji` (`_idpendapatan` VARCHAR(5), `_icpengguna` VARCHAR(13), `_pendapatanfilename` VARCHAR(255), `_pendapatanfiletype` VARCHAR(200), `_pendapatandata` LONGBLOB)  BEGIN
	INSERT INTO salinan_pendapatan(ID_Pendapatan, IC_Pengguna, Pendapatan_Filename, Pendapatan_Type, Pendapatan_Data)
	VALUES (_idpendapatan, _icpengguna, _pendapatanfilename, _pendapatanfiletype, _pendapatandata);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalinanICPasangan` (`_idspasangan` VARCHAR(5), `_icpengguna` VARCHAR(13), `_icpasangan` VARCHAR(13), `_icfilename` VARCHAR(255), `_icfiletype` VARCHAR(200), `_icdata` LONGBLOB)  BEGIN
	INSERT INTO salinan_ic_pasangan(ID_ICPasangan, IC_Pengguna, IC_Pasangan, PasanganIC_Filename, PasanganIC_Type, PasanganIC_Data)
	VALUES (_idspasangan, _icpengguna, _icpasangan, _icfilename, _icfiletype, _icdata);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalinanICPemohon` (`_idspemohon` VARCHAR(5), `_icpengguna` VARCHAR(13), `_icfilename` VARCHAR(255), `_icfiletype` VARCHAR(200), `_icdata` LONGBLOB)  BEGIN	
	INSERT INTO salinan_ic_pemohon(ID_ICPemohon, IC_Pengguna, PemohonIC_Filename, PemohonIC_Type, PemohonIC_Data)
	VALUES (_idspemohon, _icpengguna, _icfilename, _icfiletype, _icdata);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalinanLahirPasangan` (`_idlahirp` VARCHAR(5), `_icpengguna` VARCHAR(13), `_lahirfilename` VARCHAR(255), `_lahirfiletype` VARCHAR(200), `_lahirdata` LONGBLOB)  BEGIN
	INSERT INTO salinan_lahir_pasangan(ID_LahirPasangan, IC_Pengguna, LahirPasangan_Filename, LahirPasangan_Type, LahirPasangan_Data)
	VALUES (_idlahirp, _icpengguna, _lahirfilename, _lahirfiletype, _lahirdata);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalinanLahirPemohon` (`_idlahir` VARCHAR(5), `_icpengguna` VARCHAR(13), `_lahirfilename` VARCHAR(255), `_lahirfiletype` VARCHAR(200), `_lahirdata` LONGBLOB)  BEGIN
	INSERT INTO salinan_lahir_pemohon(ID_LahirPemohon, IC_Pengguna, LahirPemohon_Filename, LahirPemohon_Type, LahirPemohon_Data)
	VALUES (_idlahir, _icpengguna, _lahirfilename, _lahirfiletype, _lahirdata);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalinanMajikan` (`_idmajikan` VARCHAR(5), `_icpengguna` VARCHAR(13), `_majikanfilename` VARCHAR(255), `_majikanfiletype` VARCHAR(200), `_majikandata` LONGBLOB)  BEGIN
	INSERT INTO salinan_majikan(ID_Majikan, IC_Pengguna, Majikan_Filename, Majikan_Type, Majikan_Data)
	VALUES (_idmajikan, _icpengguna, _majikanfilename, _majikanfiletype, _majikandata);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectCatalog` ()  BEGIN
	SELECT ID_PPR, Harga_Unit
	FROM ppr_catalog;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `StaffDashboard` (`_icstaff` VARCHAR(13))  BEGIN
	SELECT IC_Staff, ID_Staff, Nama_Staff, Tel_Staff, Emel_Staff
FROM staff 
WHERE IC_Staff = _icstaff;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `StatistikKerja` ()  BEGIN
	SELECT K.ID_Kontrak, K.Jenis_Kontrak, DATE_FORMAT(K.Tarikh_Mula, "%d %M %Y") AS 'Tarikh_Mula', DATE_FORMAT(K.Tarikh_Akhir, "%d %M %Y") AS 'Tarikh_Akhir', K.Sewa_Unit, K.Status_Kontrak, P.Kawasan
	FROM kontrakppr K JOIN ppr_catalog P;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `StatusPemohon` (`_idstatus` VARCHAR(5), `_icpengguna` VARCHAR(13), `_tarafperkahwinan` VARCHAR(25), `_kecacatan` VARCHAR(50), `_masalahkesihatan` VARCHAR(50))  BEGIN
	INSERT INTO status_pemohon(ID_Status, IC_Pengguna, Taraf_Perkahwinan, Kecacatan, Masalah_Kesihatan)
	VALUES (_idstatus, _icpengguna, _tarafperkahwinan, _kecacatan, _masalahkesihatan);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TarafPemohon` (`_idtempat` VARCHAR(5), `_icpengguna` VARCHAR(13), `_taraftempat` VARCHAR(20), `_alamattempat` VARCHAR(100), `_poskodtempat` INT(6), `_bandartempat` VARCHAR(50), `_negeritempat` VARCHAR(20))  BEGIN
	INSERT INTO taraf_pemohon (ID_Tempat, IC_Pengguna, Taraf_Tempat, Alamat_Tempat, Poskod_Tempat, Bandar_Tempat, Negeri_Tempat)
	VALUES (_idtempat, _icpengguna, _taraftempat, _alamattempat, _poskodtempat, _bandartempat, _negeritempat);
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Testing` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT IC_Pengguna FROM kontrakppr WHERE IC_Pengguna = _icpengguna AND Status_Kontrak = 'GAGAL';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePengguna` (`_icpengguna` VARCHAR(12), `_alamat` VARCHAR(100), `_poskod` INT(5), `_bandar` VARCHAR(50), `_negeri` VARCHAR(20), `_tel` VARCHAR(12), `_emel` VARCHAR(50), `_katalaluan` VARCHAR(10))  BEGIN
	UPDATE pengguna
		SET
			Alamat_Pengguna = _alamat,
			Poskod_Pengguna = _poskod,
			Bandar_Pengguna = _bandar,
			Negeri_Pengguna = _negeri,
			Tel_Pengguna = _tel,
			Emel_Pengguna = _emel,
			Kata_Laluan = _katalaluan
	
		WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStaff` (`_alamat` VARCHAR(100), `_poskod` INT(6), `_bandar` VARCHAR(50), `_negeri` VARCHAR(15), `_tel` VARCHAR(11), `_emel` VARCHAR(50), `_katalaluan` VARCHAR(10), `_icstaff` VARCHAR(13))  BEGIN
	UPDATE staff
		SET
			Alamat_Staff = _alamat,
			Poskod_Staff = _poskod,
			Bandar_Staff = _bandar,
			Negeri_Staff = _negeri,
			Tel_Staff = _tel,
			Emel_Staff = _emel,
			Kata_Laluan = _katalaluan
	
		WHERE IC_Staff = _icstaff;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStatusGagal` (`_status` VARCHAR(13), `_idkontrak` VARCHAR(5), `_icstaff` VARCHAR(13))  BEGIN
	INSERT INTO log_ppr(ID_Kontrak, Status_Kontrak, IC_Staff)
VALUES(_idkontrak, _status, _icstaff);

UPDATE kontrakppr
SET
		IC_Staff = _icstaff,
		Status_Kontrak = _status
		
WHERE ID_Kontrak = _idkontrak;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStatusKontrak` (`_status` VARCHAR(13), `_idkontrak` VARCHAR(5), `_icstaff` VARCHAR(13), `_sewa` DOUBLE, `_idppr` VARCHAR(5))  BEGIN
INSERT INTO log_ppr(ID_Kontrak, Status_Kontrak, IC_Staff)
VALUES(_idkontrak, _status, _icstaff);

UPDATE kontrakppr
SET
		IC_Staff = _icstaff,
		Status_Kontrak = _status,
		Tarikh_Mula = CURDATE(),
		Tarikh_Akhir = DATE_ADD(Tarikh_Mula,INTERVAL 1 YEAR),
		Sewa_Unit = _sewa,
		ID_PPR = _idppr
WHERE ID_Kontrak = _idkontrak;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStatusPPR` (`_idkontrak` VARCHAR(5), `_icstaff` VARCHAR(13), `_status` VARCHAR(20))  BEGIN
	UPDATE kontrakppr
	SET
		IC_Staff = _icstaff,
		Status_Kontrak = _status

	WHERE ID_Kontrak = _idkontrak;
	
	INSERT INTO log_ppr (ID_Kontrak, Status_Kontrak)
	VALUES (_idkontrak, _status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMaklumatFamily` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT IC_Ahli, Nama_Ahli, Hubungan_Ahli, DOB_Ahli, Jantina_Ahli, Pendapatan_Ahli
	FROM maklumat_tanggungan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMaklumatGaji` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Pendapatan_Pengguna, Pendapatan_Pasangan, Pendapatan_Rumah
	FROM pendapatan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMaklumatPasangan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Nama_Pasangan, IC_Pasangan, AlamatK_Pasangan, Poskod_Pasangan, Bandar_Pasangan, Negeri_Pasangan, Tel_Pasangan, Kecacatan
	FROM maklumat_pasangan
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMaklumatPemohon` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT P.Nama_Pengguna, P.IC_Pengguna, MP.Alamat_Surat, MP.Poskod_Surat, MP.Bandar_Surat, MP.Negeri_Surat, MP.Tempat_Kerja, MP.Alamat_Kerja, MP.Poskod_Kerja, MP.Bandar_Kerja, MP.Negeri_Kerja, P.Tel_Pengguna, MP.Tel_Pejabat, MP.Tarikh_Lahir, MP.Negeri_Lahir, MP.Jantina, MP.Kaum, MP.Agama, MP.Pekerjaan
	FROM pengguna P JOIN maklumat_pemohon MP
	ON P.IC_Pengguna = MP.IC_Pengguna
	AND MP.IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMaklumatStatus` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Taraf_Perkahwinan, Kecacatan, Masalah_Kesihatan
	FROM status_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMaklumatTempat` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Taraf_Tempat, Alamat_Tempat, Poskod_Tempat, Bandar_Tempat, Negeri_Tempat
	FROM taraf_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSalinanGaji` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Pendapatan_Filename
	FROM salinan_pendapatan
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSalinanIC` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT PemohonIC_Filename
	FROM salinan_ic_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSalinanICP` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT PasanganIC_Filename
	FROM salinan_ic_pasangan
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSalinanLahir` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT LahirPemohon_Filename
	FROM salinan_lahir_pemohon
	WHERE IC_Pengguna = _icpengguna;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSalinanLahirP` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT LahirPasangan_Filename
	FROM salinan_lahir_pasangan
	WHERE IC_Pengguna = _icpengguna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSalinanMajikan` (`_icpengguna` VARCHAR(13))  BEGIN
	SELECT Majikan_Filename
	FROM salinan_majikan
	WHERE IC_Pengguna = _icpengguna;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Check2ndEligibility` (`_icpengguna` VARCHAR(13)) RETURNS INT(11) BEGIN
	 DECLARE	result INT;
	
	IF (SELECT IC_Pengguna FROM kontrakppr WHERE IC_Pengguna = _icpengguna AND Status_Kontrak = 'GAGAL')
	THEN
		SET result=1;
	ELSE
		SET result=0;
	
	END IF;
	RETURN result;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CheckEligibility` (`_icpengguna` VARCHAR(13)) RETURNS INT(11) BEGIN
	DECLARE	result INT;
	
	IF (SELECT IC_Pengguna FROM kontrakppr WHERE IC_Pengguna = _icpengguna)
	THEN
		SET result=1;
	ELSE
		SET result=0;
	
	END IF;
	RETURN result;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CheckIC` (`_icpengguna` VARCHAR(13)) RETURNS INT(11) BEGIN
	DECLARE	result INT;
	
	IF (SELECT IC_Pengguna FROM pengguna WHERE IC_Pengguna = _icpengguna)
	THEN
		SET result=1;
	ELSE
		SET result=0;
	
	END IF;
	RETURN result;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CheckICStaff` (`_icstaff` VARCHAR(13)) RETURNS INT(11) BEGIN
	DECLARE	result INT;
	
	IF (SELECT IC_Staff FROM staff WHERE IC_Staff = _icstaff)
	THEN
		SET result=1;
	ELSE
		SET result=0;
	
	END IF;
	RETURN result;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CheckPw` (`_icpengguna` VARCHAR(13), `_katalaluan` VARCHAR(10)) RETURNS INT(11) BEGIN
	DECLARE	matched INT;
	
	IF (SELECT Kata_Laluan FROM pengguna WHERE Kata_Laluan = _katalaluan OR IC_Pengguna = _icpengguna)
	THEN
		SET matched= -1;
	ELSE
		SET matched= -2;
	
	END IF;
	RETURN matched;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `Validate_Staff` (`_icstaff` VARCHAR(13), `_katalaluan` VARCHAR(10)) RETURNS INT(11) BEGIN
	DECLARE userVal INT;
		
	IF(SELECT IC_Staff FROM staff WHERE IC_Staff = _icstaff AND Kata_Laluan = _katalaluan)
	THEN
		SET userVal= -1; -- credential match
		INSERT INTO log_pengguna(IC_Staff,Description)
		VALUE(_icstaff, "Log Masuk");
	ELSE
		SET userVal= -2; -- credential not match
	END IF;
	 

	RETURN userVal;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `Validate_User` (`_icpengguna` VARCHAR(13), `_katalaluan` VARCHAR(10)) RETURNS INT(11) BEGIN
	DECLARE userVal INT;
		
	IF(SELECT IC_Pengguna FROM pengguna WHERE IC_Pengguna = _icpengguna AND Kata_Laluan = _katalaluan)
	THEN
		SET userVal= -1; -- credential match
		INSERT INTO log_pengguna(IC_Pengguna,Description)
		VALUE(_icpengguna, "Log Masuk");
	ELSE
		SET userVal= -2; -- credential not match
	END IF;
	 

	RETURN userVal;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kontrakppr`
--

CREATE TABLE `kontrakppr` (
  `ID_Kontrak` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `IC_Staff` varchar(13) DEFAULT NULL,
  `ID_Pasangan` varchar(5) DEFAULT NULL,
  `ID_Pemohon` varchar(5) NOT NULL,
  `ID_Pendapatan` varchar(5) NOT NULL,
  `ID_SalinanIC` varchar(5) NOT NULL,
  `ID_SalinanICPasangan` varchar(5) DEFAULT NULL,
  `ID_SalinanLahir` varchar(5) NOT NULL,
  `ID_SalinanLahirPasangan` varchar(5) DEFAULT NULL,
  `ID_SalinanMajikan` varchar(5) NOT NULL,
  `ID_SalinanPendapatan` varchar(5) NOT NULL,
  `ID_StatusPemohon` varchar(6) NOT NULL,
  `ID_TarafPemohon` varchar(6) NOT NULL,
  `ID_PPR` varchar(5) DEFAULT NULL,
  `Sewa_Unit` double DEFAULT '0',
  `Tarikh_Mula` date DEFAULT NULL,
  `Tarikh_Akhir` date DEFAULT NULL,
  `Jenis_Kontrak` varchar(7) DEFAULT NULL,
  `Status_Kontrak` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_pengguna`
--

CREATE TABLE `log_pengguna` (
  `Log_ID` int(11) NOT NULL,
  `IC_Pengguna` varchar(13) DEFAULT NULL,
  `IC_Staff` varchar(13) DEFAULT NULL,
  `Description` varchar(12) NOT NULL,
  `Log_Akhir` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_ppr`
--

CREATE TABLE `log_ppr` (
  `ID_Log` int(11) NOT NULL,
  `Log_Kontrak` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_Kontrak` varchar(5) NOT NULL,
  `IC_Staff` varchar(13) NOT NULL,
  `Status_Kontrak` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maklumat_pasangan`
--

CREATE TABLE `maklumat_pasangan` (
  `Pasangan_ID` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Nama_Pasangan` varchar(50) DEFAULT NULL,
  `IC_Pasangan` varchar(13) NOT NULL,
  `AlamatK_Pasangan` varchar(100) DEFAULT NULL,
  `Poskod_Pasangan` int(6) DEFAULT NULL,
  `Bandar_Pasangan` varchar(50) DEFAULT NULL,
  `Negeri_Pasangan` varchar(20) DEFAULT NULL,
  `Tel_Pasangan` varchar(15) DEFAULT NULL,
  `Kecacatan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maklumat_pemohon`
--

CREATE TABLE `maklumat_pemohon` (
  `Maklumat_ID` varchar(4) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Alamat_Surat` varchar(150) DEFAULT NULL,
  `Poskod_Surat` int(6) DEFAULT NULL,
  `Bandar_Surat` varchar(50) DEFAULT NULL,
  `Negeri_Surat` varchar(20) DEFAULT NULL,
  `Tempat_Kerja` varchar(50) DEFAULT NULL,
  `Alamat_Kerja` varchar(100) DEFAULT NULL,
  `Poskod_Kerja` int(6) DEFAULT NULL,
  `Bandar_Kerja` varchar(50) DEFAULT NULL,
  `Negeri_Kerja` varchar(20) DEFAULT NULL,
  `Tel_Pejabat` varchar(13) DEFAULT NULL,
  `Tarikh_Lahir` date DEFAULT NULL,
  `Negeri_Lahir` varchar(20) DEFAULT NULL,
  `Jantina` varchar(10) DEFAULT NULL,
  `Kaum` varchar(30) DEFAULT NULL,
  `Pekerjaan` varchar(25) DEFAULT NULL,
  `Agama` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maklumat_tanggungan`
--

CREATE TABLE `maklumat_tanggungan` (
  `ID_Keluarga` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Nama_Ahli` varchar(50) DEFAULT NULL,
  `Hubungan_Ahli` varchar(15) DEFAULT NULL,
  `DOB_Ahli` date DEFAULT NULL,
  `IC_Ahli` varchar(13) NOT NULL,
  `Jantina_Ahli` varchar(10) DEFAULT NULL,
  `Pendapatan_Ahli` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan`
--

CREATE TABLE `pendapatan` (
  `ID_Pendapatan` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Pendapatan_Pengguna` double(10,2) DEFAULT NULL,
  `Pendapatan_Pasangan` double(10,2) DEFAULT NULL,
  `Pendapatan_Rumah` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_Pengguna` int(11) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Nama_Pengguna` varchar(100) NOT NULL,
  `Alamat_Pengguna` varchar(250) NOT NULL,
  `Poskod_Pengguna` int(5) NOT NULL,
  `Bandar_Pengguna` varchar(50) NOT NULL,
  `Negeri_Pengguna` varchar(20) NOT NULL,
  `Tel_Pengguna` varchar(12) NOT NULL,
  `Emel_Pengguna` varchar(50) NOT NULL,
  `Kata_Laluan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppr_catalog`
--

CREATE TABLE `ppr_catalog` (
  `ID_PPR` varchar(5) NOT NULL,
  `Kawasan` varchar(20) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Alamat2` varchar(50) DEFAULT NULL,
  `Poskod` int(5) DEFAULT NULL,
  `Bandar` varchar(50) DEFAULT NULL,
  `Negeri` varchar(20) DEFAULT NULL,
  `Tel_Pejabat` varchar(13) DEFAULT NULL,
  `Harga_Unit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ppr_catalog`
--

INSERT INTO `ppr_catalog` (`ID_PPR`, `Kawasan`, `Alamat`, `Alamat2`, `Poskod`, `Bandar`, `Negeri`, `Tel_Pejabat`, `Harga_Unit`) VALUES
('PPRKD', 'PPR KOTA DAMANSARA', 'Tingkat Bawah, Blok C', 'Jalan Pekaka 8/1, Pusat Bandar Sungai Buloh', 48710, 'Petaling Jaya', 'Selangor Darul Ehsan', '0361504334', 200);

-- --------------------------------------------------------

--
-- Table structure for table `salinan_ic_pasangan`
--

CREATE TABLE `salinan_ic_pasangan` (
  `ID_ICPasangan` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `PasanganIC_Filename` varchar(50) NOT NULL,
  `PasanganIC_Type` varchar(200) NOT NULL,
  `PasanganIC_Data` longblob NOT NULL,
  `IC_Pasangan` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salinan_ic_pemohon`
--

CREATE TABLE `salinan_ic_pemohon` (
  `ID_ICPemohon` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `PemohonIC_Filename` varchar(255) NOT NULL,
  `PemohonIC_Type` varchar(200) NOT NULL,
  `PemohonIC_Data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salinan_lahir_pasangan`
--

CREATE TABLE `salinan_lahir_pasangan` (
  `ID_LahirPasangan` varchar(5) NOT NULL,
  `IC_Pasangan` varchar(13) DEFAULT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `LahirPasangan_Filename` varchar(50) NOT NULL,
  `LahirPasangan_Type` varchar(200) NOT NULL,
  `LahirPasangan_Data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salinan_lahir_pemohon`
--

CREATE TABLE `salinan_lahir_pemohon` (
  `ID_LahirPemohon` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `LahirPemohon_Filename` varchar(50) NOT NULL,
  `LahirPemohon_Type` varchar(200) NOT NULL,
  `LahirPemohon_Data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salinan_majikan`
--

CREATE TABLE `salinan_majikan` (
  `ID_Majikan` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Majikan_Filename` varchar(50) NOT NULL,
  `Majikan_Type` varchar(200) NOT NULL,
  `Majikan_Data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salinan_pendapatan`
--

CREATE TABLE `salinan_pendapatan` (
  `ID_Pendapatan` varchar(5) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Pendapatan_Filename` varchar(50) NOT NULL,
  `Pendapatan_Type` varchar(200) NOT NULL,
  `Pendapatan_Data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID_Staff` int(3) UNSIGNED ZEROFILL NOT NULL,
  `IC_Staff` varchar(13) NOT NULL,
  `Nama_Staff` varchar(100) NOT NULL,
  `Alamat_Staff` varchar(100) NOT NULL,
  `Poskod_Staff` int(5) NOT NULL,
  `Bandar_Staff` varchar(50) NOT NULL,
  `Negeri_Staff` varchar(15) NOT NULL,
  `Tel_Staff` varchar(11) NOT NULL,
  `Emel_Staff` varchar(50) NOT NULL,
  `Kata_Laluan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID_Staff`, `IC_Staff`, `Nama_Staff`, `Alamat_Staff`, `Poskod_Staff`, `Bandar_Staff`, `Negeri_Staff`, `Tel_Staff`, `Emel_Staff`, `Kata_Laluan`) VALUES
(001, '001218050188', 'NUR SARAH SOFIYA BINTI OMAR BASHAH', 'NO 50, JALAN ARA 1, TAMAN BANDAR BARU TAMPIN', 73000, 'TAMPIN', 'NEGERI SEMBILAN', '01123456789', 'sarahsofiya1@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `status_pemohon`
--

CREATE TABLE `status_pemohon` (
  `ID_Status` varchar(6) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Taraf_Perkahwinan` varchar(25) DEFAULT NULL,
  `Kecacatan` varchar(50) DEFAULT NULL,
  `Masalah_Kesihatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taraf_pemohon`
--

CREATE TABLE `taraf_pemohon` (
  `ID_Tempat` varchar(6) NOT NULL,
  `IC_Pengguna` varchar(13) NOT NULL,
  `Taraf_Tempat` varchar(20) DEFAULT NULL,
  `Alamat_Tempat` varchar(100) DEFAULT NULL,
  `Poskod_Tempat` int(6) DEFAULT NULL,
  `Bandar_Tempat` varchar(50) DEFAULT NULL,
  `Negeri_Tempat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kontrakppr`
--
ALTER TABLE `kontrakppr`
  ADD PRIMARY KEY (`ID_Kontrak`),
  ADD KEY `STAFF` (`IC_Staff`),
  ADD KEY `PERMOHONAN` (`IC_Pengguna`) USING BTREE,
  ADD KEY `MPASANGAN` (`ID_Pasangan`),
  ADD KEY `PENDAPATAN` (`ID_Pendapatan`),
  ADD KEY `STATUS` (`ID_StatusPemohon`),
  ADD KEY `TARAF` (`ID_TarafPemohon`),
  ADD KEY `SALINIC` (`ID_SalinanIC`),
  ADD KEY `SALINICP` (`ID_SalinanICPasangan`),
  ADD KEY `SALINLAHIR` (`ID_SalinanLahir`),
  ADD KEY `SALINLAHIRP` (`ID_SalinanLahirPasangan`),
  ADD KEY `SALINMAJIKAN` (`ID_SalinanMajikan`),
  ADD KEY `SALINGAJI` (`ID_SalinanPendapatan`),
  ADD KEY `PPRKATALOG` (`ID_PPR`),
  ADD KEY `MPEMOHON` (`ID_Pemohon`),
  ADD KEY `STATUSKONTRAK` (`Status_Kontrak`);

--
-- Indexes for table `log_pengguna`
--
ALTER TABLE `log_pengguna`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `IC_PENGGUNA` (`IC_Pengguna`),
  ADD KEY `IC_STAFF` (`IC_Staff`);

--
-- Indexes for table `log_ppr`
--
ALTER TABLE `log_ppr`
  ADD PRIMARY KEY (`ID_Log`),
  ADD KEY `PPR` (`ID_Kontrak`),
  ADD KEY `STAFF_KONTRAK` (`IC_Staff`),
  ADD KEY `Status_Kontrak` (`Status_Kontrak`);

--
-- Indexes for table `maklumat_pasangan`
--
ALTER TABLE `maklumat_pasangan`
  ADD PRIMARY KEY (`Pasangan_ID`,`IC_Pasangan`),
  ADD KEY `IC_USER` (`IC_Pengguna`),
  ADD KEY `Pasangan_ID` (`Pasangan_ID`),
  ADD KEY `IC_Pasangan` (`IC_Pasangan`);

--
-- Indexes for table `maklumat_pemohon`
--
ALTER TABLE `maklumat_pemohon`
  ADD PRIMARY KEY (`Maklumat_ID`),
  ADD KEY `IC` (`IC_Pengguna`);

--
-- Indexes for table `maklumat_tanggungan`
--
ALTER TABLE `maklumat_tanggungan`
  ADD PRIMARY KEY (`ID_Keluarga`,`IC_Ahli`),
  ADD KEY `PEMOHON_IC` (`IC_Pengguna`),
  ADD KEY `ID_Keluarga` (`ID_Keluarga`);

--
-- Indexes for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD PRIMARY KEY (`ID_Pendapatan`),
  ADD KEY `IC_PEMOHON` (`IC_Pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_Pengguna`,`IC_Pengguna`),
  ADD KEY `IC_Pengguna` (`IC_Pengguna`);

--
-- Indexes for table `ppr_catalog`
--
ALTER TABLE `ppr_catalog`
  ADD PRIMARY KEY (`ID_PPR`);

--
-- Indexes for table `salinan_ic_pasangan`
--
ALTER TABLE `salinan_ic_pasangan`
  ADD PRIMARY KEY (`ID_ICPasangan`),
  ADD KEY `VALIDATION` (`IC_Pengguna`),
  ADD KEY `MASTER` (`IC_Pasangan`);

--
-- Indexes for table `salinan_ic_pemohon`
--
ALTER TABLE `salinan_ic_pemohon`
  ADD PRIMARY KEY (`ID_ICPemohon`),
  ADD KEY `VALID_IC` (`IC_Pengguna`);

--
-- Indexes for table `salinan_lahir_pasangan`
--
ALTER TABLE `salinan_lahir_pasangan`
  ADD PRIMARY KEY (`ID_LahirPasangan`),
  ADD KEY `MOHON` (`IC_Pengguna`),
  ADD KEY `PASANGAN` (`IC_Pasangan`);

--
-- Indexes for table `salinan_lahir_pemohon`
--
ALTER TABLE `salinan_lahir_pemohon`
  ADD PRIMARY KEY (`ID_LahirPemohon`),
  ADD KEY `VALIDATION_IC` (`IC_Pengguna`);

--
-- Indexes for table `salinan_majikan`
--
ALTER TABLE `salinan_majikan`
  ADD PRIMARY KEY (`ID_Majikan`),
  ADD KEY `MOHON_ID` (`IC_Pengguna`);

--
-- Indexes for table `salinan_pendapatan`
--
ALTER TABLE `salinan_pendapatan`
  ADD PRIMARY KEY (`ID_Pendapatan`),
  ADD KEY `MOHON_IC` (`IC_Pengguna`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID_Staff`,`IC_Staff`),
  ADD KEY `IC_Staff` (`IC_Staff`);

--
-- Indexes for table `status_pemohon`
--
ALTER TABLE `status_pemohon`
  ADD PRIMARY KEY (`ID_Status`),
  ADD KEY `PEMOHON` (`IC_Pengguna`);

--
-- Indexes for table `taraf_pemohon`
--
ALTER TABLE `taraf_pemohon`
  ADD PRIMARY KEY (`ID_Tempat`),
  ADD KEY `PENGGUNA_IC` (`IC_Pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_pengguna`
--
ALTER TABLE `log_pengguna`
  MODIFY `Log_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_ppr`
--
ALTER TABLE `log_ppr`
  MODIFY `ID_Log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `ID_Pengguna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `ID_Staff` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kontrakppr`
--
ALTER TABLE `kontrakppr`
  ADD CONSTRAINT `MPASANGAN` FOREIGN KEY (`ID_Pasangan`) REFERENCES `maklumat_pasangan` (`Pasangan_ID`),
  ADD CONSTRAINT `MPEMOHON` FOREIGN KEY (`ID_Pemohon`) REFERENCES `maklumat_pemohon` (`Maklumat_ID`),
  ADD CONSTRAINT `PENDAPATAN` FOREIGN KEY (`ID_Pendapatan`) REFERENCES `pendapatan` (`ID_Pendapatan`),
  ADD CONSTRAINT `PERMOHONAN` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`),
  ADD CONSTRAINT `PPRKATALOG` FOREIGN KEY (`ID_PPR`) REFERENCES `ppr_catalog` (`ID_PPR`),
  ADD CONSTRAINT `SALINGAJI` FOREIGN KEY (`ID_SalinanPendapatan`) REFERENCES `salinan_pendapatan` (`ID_Pendapatan`),
  ADD CONSTRAINT `SALINIC` FOREIGN KEY (`ID_SalinanIC`) REFERENCES `salinan_ic_pemohon` (`ID_ICPemohon`),
  ADD CONSTRAINT `SALINICP` FOREIGN KEY (`ID_SalinanICPasangan`) REFERENCES `salinan_ic_pasangan` (`ID_ICPasangan`),
  ADD CONSTRAINT `SALINLAHIR` FOREIGN KEY (`ID_SalinanLahir`) REFERENCES `salinan_lahir_pemohon` (`ID_LahirPemohon`),
  ADD CONSTRAINT `SALINLAHIRP` FOREIGN KEY (`ID_SalinanLahirPasangan`) REFERENCES `salinan_lahir_pasangan` (`ID_LahirPasangan`),
  ADD CONSTRAINT `SALINMAJIKAN` FOREIGN KEY (`ID_SalinanMajikan`) REFERENCES `salinan_majikan` (`ID_Majikan`),
  ADD CONSTRAINT `STAFF` FOREIGN KEY (`IC_Staff`) REFERENCES `staff` (`IC_Staff`),
  ADD CONSTRAINT `STATUS` FOREIGN KEY (`ID_StatusPemohon`) REFERENCES `status_pemohon` (`ID_Status`),
  ADD CONSTRAINT `TARAF` FOREIGN KEY (`ID_TarafPemohon`) REFERENCES `taraf_pemohon` (`ID_Tempat`);

--
-- Constraints for table `log_pengguna`
--
ALTER TABLE `log_pengguna`
  ADD CONSTRAINT `IC_PENGGUNA` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`),
  ADD CONSTRAINT `IC_STAFF` FOREIGN KEY (`IC_Staff`) REFERENCES `staff` (`IC_Staff`);

--
-- Constraints for table `log_ppr`
--
ALTER TABLE `log_ppr`
  ADD CONSTRAINT `PPR` FOREIGN KEY (`ID_Kontrak`) REFERENCES `kontrakppr` (`ID_Kontrak`),
  ADD CONSTRAINT `STAFF_KONTRAK` FOREIGN KEY (`IC_Staff`) REFERENCES `staff` (`IC_Staff`);

--
-- Constraints for table `maklumat_pasangan`
--
ALTER TABLE `maklumat_pasangan`
  ADD CONSTRAINT `IC_USER` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `maklumat_pemohon`
--
ALTER TABLE `maklumat_pemohon`
  ADD CONSTRAINT `IC` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `maklumat_tanggungan`
--
ALTER TABLE `maklumat_tanggungan`
  ADD CONSTRAINT `PEMOHON_IC` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD CONSTRAINT `IC_PEMOHON` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `salinan_ic_pasangan`
--
ALTER TABLE `salinan_ic_pasangan`
  ADD CONSTRAINT `MASTER` FOREIGN KEY (`IC_Pasangan`) REFERENCES `maklumat_pasangan` (`IC_Pasangan`),
  ADD CONSTRAINT `VALIDATION` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `salinan_ic_pemohon`
--
ALTER TABLE `salinan_ic_pemohon`
  ADD CONSTRAINT `VALID_IC` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `salinan_lahir_pasangan`
--
ALTER TABLE `salinan_lahir_pasangan`
  ADD CONSTRAINT `MOHON` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`),
  ADD CONSTRAINT `PASANGAN` FOREIGN KEY (`IC_Pasangan`) REFERENCES `maklumat_pasangan` (`IC_Pasangan`);

--
-- Constraints for table `salinan_lahir_pemohon`
--
ALTER TABLE `salinan_lahir_pemohon`
  ADD CONSTRAINT `VALIDATION_IC` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `salinan_majikan`
--
ALTER TABLE `salinan_majikan`
  ADD CONSTRAINT `MOHON_ID` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `salinan_pendapatan`
--
ALTER TABLE `salinan_pendapatan`
  ADD CONSTRAINT `MOHON_IC` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `status_pemohon`
--
ALTER TABLE `status_pemohon`
  ADD CONSTRAINT `PEMOHON` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);

--
-- Constraints for table `taraf_pemohon`
--
ALTER TABLE `taraf_pemohon`
  ADD CONSTRAINT `PENGGUNA_IC` FOREIGN KEY (`IC_Pengguna`) REFERENCES `pengguna` (`IC_Pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
