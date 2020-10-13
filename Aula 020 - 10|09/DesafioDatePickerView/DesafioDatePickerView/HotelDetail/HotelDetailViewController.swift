//
//  HotelDetailViewController.swift
//  DesafioDatePickerView
//
//  Created by Rodrigo Leme on 13/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

// enum pra fazer charme
enum typeCheckIn {
     static let checkIn = 1
     static let checkOut = 2
}

class HotelDetailViewController: UIViewController {
    @IBOutlet weak var collectionViewPhotos: UICollectionView!
    @IBOutlet weak var labelHotel: UILabel!
    @IBOutlet weak var labelCheckIn: UILabel!
    @IBOutlet weak var labelCheckOut: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    // Aqui eu usei a conexão Outlet Collection. Que cria um array elementos no outlet
    @IBOutlet var labelStars: [UILabel]!
    
    
    var hotel: Hotel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewPhotos.delegate = self
        collectionViewPhotos.dataSource = self
        
        // zerando o canal alpha de todas as estrelas pra elas ficarem transparentes
        for star in labelStars {
            star.alpha = 0
        }
        
        // Criando o Formatador e setado pro padrão pt-Br
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        // Recebendo os dias de checkIn e checkOut do objeto
        let checkIn: Date = hotel.getCheckInOut(option: typeCheckIn.checkIn)
        let checkOut: Date = hotel.getCheckInOut(option: typeCheckIn.checkOut)
        
        labelHotel.text = hotel.getHotelName()
        labelCheckIn.text = formatter.string(from: checkIn)
        labelCheckOut.text = formatter.string(from: checkOut)
        labelPrice.text = "R$ \(hotel.getPriceInRange())"
        
        // chama o método que exibe as estrelas da classificação do hotel
        showStars()
    }
    
    // Método pra montar a tela e ser chamada por outra classe
    public static func getViewController() -> HotelDetailViewController? {
        if let viewController = UIStoryboard(name: "HotelDetail", bundle: nil).instantiateInitialViewController() as? HotelDetailViewController {
            return viewController
        }
        return nil
    }
    
    // Método pra mostrar as estrelas (classificação do Hotel)
    func showStars() {
        // pegando o total de estrelas do objeto
        let totStars = hotel.getClassification()
        
        // Loop de 0 até o total de estrelas do objeto
        for n in 0...totStars {
            // setanto o alpha da label (que são os emojis de estrelas) pra 1.0 pra ficarem visiveis de acordo com o índice do for
            labelStars[n].alpha = 1.0
        }
    }

}

extension HotelDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // chama a função da classe hotel que retorna o array de fotos do Hotel
        return hotel.getHotelPhotos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCollectionViewCell
        
        // passando o array de fotos do hotel para o método setup que cria as imagens na célula
        cell.setup(hotel: hotel.getHotelPhotos()[indexPath.row])
        
        return cell
    }
    
    
}
