//
//  NewsListVC.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit


class NewsListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsData: [[String]]?
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureData()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

extension NewsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureView() {
        backgroundView.roundCorners(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 10)
        
        tableView.register(UINib(nibName: "TopNewsCell", bundle: nil), forCellReuseIdentifier: "TopNewsCell")
        tableView.register(UINib(nibName: "OtherNewsCell", bundle: nil), forCellReuseIdentifier: "OtherNewsCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : (newsData?[section].count ?? 0) - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = newsData?[indexPath.section] ?? []
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopNewsCell", for: indexPath) as? TopNewsCell
            cell?.setupData(data: data)
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherNewsCell", for: indexPath) as? OtherNewsCell
            cell?.setupData(data: data)
            cell?.newsImg.roundCorners(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 10)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as? NewsDetailVC
        vc?.newsData = newsData?[indexPath.section] ?? []
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
}

extension NewsListVC {
    
    func configureData() {
        newsData = [
            ["Informasi terkini – 1 April 2020", "1 April 2020, Jakarta. Setelah polemik penerapan ‘karantina wilayah’ yang diserukan banyak pihak untuk diberlakukan secara nasional dan diinisiasi secara terbatas di beberapa daerah di pelosok nusantara, akhirnya pemerintah mengambil opsi untuk memberlakukan pembatasan sosial berskala besar sebagaimana diatur oleh Undang-Undang No.6 Tahun 2018 tentang Kekarantinaan Kesehatan dengan mengeluarkan Peraturan Pemerintah No.21 Tahun 2020 tentang Pembatasan Sosial Skala Besar."],
            ["Belajar dari Vietnam", "Dunia memuji Vietnam dalam menangani pandemi COVID-19 karena dinilai efektif dan sangat transparan. Sampai tanggal 31 Maret, ditemukan 207 kasus terkonfirmasi, dengan 57 pasien dinyatakan sembuh dan tanpa satupun meninggal. Kapasitas rumah sakit tetap dijaga di angka yang sanggup untuk dikelola sehingga menghasilkan pelayanan kesehatan yang berkualitas dan memberi ketenangan pada warga Vietnam."],
            ["Dunia dalam Berita COVID-19", "Sri Sultan Hamengkubuwono X memerintahkan pendatang ke wilayah DIY untuk mengisolasi diri mengingat mereka datang dari daerah episentrum wabah CoViD-19. Beliau memerintahkan Bupati dan Walikota agar waspada dan memfasilitasi upaya isolasi diri pendatang selama 14 hari. Kabupaten Gunung Kidul, misalnya sudah melarang perantau dari daerahnya untuk mudik dan melakukan penyisiran untuk memastikan orang-orang yang sudah terlanjur mudik tidak memiliki gejala CoViD-19 dan melakukan isolasi mandiri selama 14 hari setibanya di Gunung Kidul. Sementara itu beberapa dusun di Sleman, DIY sudah melakukan karantina wilayah swakarsa untuk membatasi laju penularan koronavirus yang diduga akan masuk bersamaan dengan arus mudik perantau dari daerah-daerah episentrum wabah CoVid-19."],
            ["Informasi terkini – 30 Maret 2020", "29 Maret 2020, Tiga perusahaan Korea pembuat tes kit Covid19 telah mendapatkan izin awal dari Food and Drug Administration (FDA) Amerika Serikat, lembaga setara denga BPOM, kata Menteri Luar Negeri kemarin . Izin awal dari FDA memberikan lampu hijau bagi perusahaan Korea untuk menjual produknya di Amerika Serikat, di mana kasus Coronavirus yang telah dikonfirmasi telah melampaui 100.000, seperti yang dinyatakan oleh seorang pejabat di Kemenlu. Ada lima tes kit yang diproduksi perusahaan lokal di Korea Selatan yang memproduksi tes kit CoViD-19 yang telah mendapatkan izin darurat dari pemegang kebijakan medis Seoul, Tes kit tersebut adalah Seegene’s Allplex, Kogene Biotech’s Power Check, Solgent’s DiaPlex Q, SD Biosensor’s Standard M dan BioSewoom’s Real-Q. Seegene dan Kogene diketahui mengajukan permohonan pada FDA pada 24 Maret 2020.  Semua tes ini berbasis real-time polymerase chain reaction atau RT-PCR, yang memberikan hasil dalam waktu paling cepat enam jam. (Korea Selatan, Test Kit, FDA USA, approval)"],
            ["Lockdown? Bukan berarti ekonomi berhenti. Begini caranya!", "Indonesia harus siap dengan ini. Meskipun nanti banyak orang yang kehilangan pekerjaan, ingatlah bahwa di saat yang bersamaan ada sektor industri yang justru naik daun dan akan membutuhkan banyak tenaga kerja. Kita harus siap dengan pergeseran ini dan terus berusaha. Sebab, hal yang terpenting saat ini adalah keselamatan setiap warga. Tidak akan ada ekonomi jika tidak ada warganya."],
            ["Karantina Wilayah", "Penanganan wabah seperti ini juga selalu ada faktor ketertundaan, dimana jumlah kasus yang terkonfirmasi akan selalu lebih kecil dari kasus yang sesungguhnya, karena masih ada kasus-kasus yang sudah terinfeksi namun masih dalam masa inkubasi. Jadi, ketika berpikir apa yang harus dilakukan sekarang, bayangkan kondisinya dan apa yang dibutuhkan dalam 2-3 minggu ke depan. Selama kita hanya meresponi kondisi saat ini, kita akan selamanya ketinggalan. Dan ketika membayangkan kondisinya dalam 2-3 minggu ke depan, jangan bayangkan skenario terbaik tapi selalu asumsikan skenario terburuk."],
            ["Bagaimana Virus Corona Menyerang Tubuh?", "Virus menyebar melalui tetesan air liur yang muncrat dari mulut orang akibat batuk atau bersin, yang kemudian masuk ke tubuh orang yang berada di dekatnya melalui mulut, hidung dan mata.  Virus kemudian masuk ke jalur pernafasan dan membran mukus di bagian belakang tenggorokan, menempel pada sebuah reseptor di dalam sel, dan mulai berkembang di sana. "]]
    }
    
}


