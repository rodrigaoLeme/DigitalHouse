//
//  ViewController.swift
//  DesafioDatePickerView
//
//  Created by Rodrigo Leme on 09/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePickerCheckIn: UIDatePicker!
    @IBOutlet weak var datePickerCheckOut: UIDatePicker!
    @IBOutlet weak var switchReward: UISwitch!
    
    var arrayHotels = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerCheckIn.setValue(UIColor.white, forKey: "textColor")
        datePickerCheckIn.setValue(false, forKey: "highlightsToday")
        
        datePickerCheckOut.setValue(UIColor.white, forKey: "textColor")
        datePickerCheckOut.setValue(false, forKey: "highlightsToday")
        
        let photoPqFlores = ["parqueDasFlores0.jpg", "parqueDasFlores1.jpg", "parqueDasFlores2.jpg", "parqueDasFlores3.jpg"]
        let photoJdBotanico = ["jdBotanico0.jpg", "jdBotanico1.jpg", "jdBotanico2.jpg", "jdBotanico3.jpg"]
        let photoMarAtlantico = ["marAtlantico0.jpg", "marAtlantico1.jpg", "marAtlantico2.jpg", "marAtlantico3.jpg"]
        
        arrayHotels.append(Hotel(name: "Parque das Flores", classification: 3, priceDaysRegular: 110.00, priceDaysVIP: 80.00, priceWeekendRegular: 90.00, priceWeekendVIP: 80.00, hotelPhotos: photoPqFlores))
        arrayHotels.append(Hotel(name: "Jardim Botânico", classification: 4, priceDaysRegular: 160.00, priceDaysVIP: 110.00, priceWeekendRegular: 60.00, priceWeekendVIP: 50.00, hotelPhotos: photoJdBotanico))
        arrayHotels.append(Hotel(name: "Mar Atlântico", classification: 5, priceDaysRegular: 220.00, priceDaysVIP: 100.00, priceWeekendRegular: 150.00, priceWeekendVIP: 40.00, hotelPhotos: photoMarAtlantico))
        
        
    }

    @IBAction func bestHotelAction(_ sender: UIButton) {
        // O retorno do melhor Hotel
        let bestHotel: Hotel!
        
        // Objeto que manipulará os dias do calendário
        let calendar = Calendar.current
        
        // Data de entra e saída
        var dateIn = calendar.startOfDay(for: datePickerCheckIn.date)
        let dateOut = calendar.startOfDay(for: datePickerCheckOut.date)

        // a variavel components recebe o retorno de uma função com a diferença entre numérica entre as datas escolhidas
        let components = calendar.dateComponents([.day], from: dateIn, to: dateOut)
        print("Diferença de dias \(components.day!)")
        
        // essas variáveis guardarão o total de dias de semana e fins de semana no range escolhido pelo usuário
        var totalWeekDays: Int = 0
        var totalWeeekendDays: Int = 0
        
        // essa variavel irá guardar o dia referente ao dia da semana sendo 1 pra domingo até 7 pra sábado
        var weekDay: Int
        
       
        // Se a diferença entre as datas for igual a 0 (caso ele escolha entrar e sair no mesmo dia) ou maior entre no IF
        if (Int(components.day!) >= 0) {
            // De cara (caso seja 0 a diferença) já é executado o comando abaixo
            repeat {
                // pega o dia referente ao dia da semana
                weekDay = calendar.component(.weekday, from: dateIn)
                
                // se o dia for 1 - Domingo ou 7 - Sábado eu acrescento a variavel que controla o total de fins de semana, se não na que que controla os dias de semana
                if (weekDay == 1 || weekDay == 7) {
                    totalWeeekendDays+=1
                } else {
                    totalWeekDays+=1
                }
                
                // aqui a data de entrada é acrescentada sempre mais 1 até que o fique maior que o dia de saída pra sair do loop
                dateIn = Calendar.current.date(byAdding: .day, value: 1, to: dateIn)!
            } while (dateIn <= dateOut)
            
            print("Total de dias de semana: \(totalWeekDays) - Total de fim de semana: \(totalWeeekendDays)")
            
            // Chama a função que irá retornar qual o melhor hotel segundo a regra de negócio levando em conta se o switch está ligado ou não
            bestHotel = verifyBestHotel(reward: switchReward.isOn, weekdays: totalWeekDays, weekendDays: totalWeeekendDays)
            
            
            print("O Melhor hotel é: \(bestHotel.getHotelName())")
            
            if let viewController = HotelDetailViewController.getViewController() {
                viewController.hotel = bestHotel
                navigationController?.pushViewController(viewController, animated: true)
            }
            
        }
    }
    
    func verifyBestHotel(reward: Bool, weekdays: Int, weekendDays: Int) -> Hotel {
        // variável que retornará o melhor hotel segundo a regra de negócio
        var bestHotel: Hotel!
        
        // varrendo o array de hoteis
        for hotel in arrayHotels {
            // Método que seta a propriedade priceInRange do objeto com o preço total das diárias
            hotel.sumPrices(rewardClient: reward, totWeekDay: weekdays, totWeekendDay: weekendDays)
            print("\(hotel.getHotelName()): R$\(hotel.getPriceInRange())")
            
            // Método para setar as datas de checkIn e checkOut
            hotel.setDates(checkIn: datePickerCheckIn.date, checkOut: datePickerCheckOut.date)
        }
        
        // Chamando um método estático da classe Hotel, passando o array de hoteis, para retornar o melhor hotel
        bestHotel = Hotel.getBestHotel(hotels: arrayHotels)
        
        // Retornando o melhor hotel
        return bestHotel
    }
    
}

