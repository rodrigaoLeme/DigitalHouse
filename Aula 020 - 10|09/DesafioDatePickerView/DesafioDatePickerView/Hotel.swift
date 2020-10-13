//
//  Hotel.swift
//  DesafioDatePickerView
//
//  Created by Rodrigo Leme on 09/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import Foundation

class Hotel {
    private var name: String
    private var classification: Int
    private var checkInDate: Date?
    private var checkOutDate: Date?
    private var priceDaysRegular: Double
    private var priceDaysVIP: Double
    private var priceWeekendRegular: Double
    private var priceWeekendVIP: Double
    private var priceInRange: Double = 0
    private var hotelPhotos: [String]
    
    init(name: String, classification: Int, priceDaysRegular: Double, priceDaysVIP: Double, priceWeekendRegular: Double, priceWeekendVIP: Double, hotelPhotos: [String]) {
        self.name = name
        self.classification = classification
        self.priceDaysRegular = priceDaysRegular
        self.priceDaysVIP = priceDaysVIP
        self.priceWeekendRegular = priceWeekendRegular
        self.priceWeekendVIP = priceWeekendVIP
        self.hotelPhotos = hotelPhotos
    }
    
    // Método que calcula o preço das diárias
    func sumPrices(rewardClient: Bool, totWeekDay: Int, totWeekendDay: Int) {
        // se o switch estiver ligado (true) é cliente VIP. o calculo é feito multiplicando o total de dias de semana * preco do dia de semana + o total de dias de fim de semana * o preço do fim de semana
        if (rewardClient) {
            priceInRange = ((Double(totWeekDay)) * priceDaysVIP) + ((Double(totWeekendDay)) * priceWeekendVIP)
        } else {
            priceInRange = ((Double(totWeekDay)) * priceDaysRegular) + ((Double(totWeekendDay)) * priceWeekendRegular)
        }
    }
    
    // Método para setar as datas de checkIn e checkOut
    func setDates(checkIn: Date, checkOut: Date) {
        checkInDate = checkIn
        checkOutDate = checkOut
    }
    
    // Método pra retornar o preço das diárias do hotel no range selecionado pelo usuário, já que é uma propriedade privada.
    func getPriceInRange() -> Double {
        return priceInRange
    }
    
    // Método pra retornar o nome do hotel, já que é uma propriedade privada.
    func getHotelName() -> String {
        return name
    }
    
    // Método pra retornar o array de fotos
    func getHotelPhotos() -> [String] {
        return hotelPhotos
    }
    
    // Método pra retornar a classificação
    func getClassification() -> Int {
        return classification
    }
    
    // Método para retornar a data de checkIn ou checkOut
    func getCheckInOut(option: Int) -> Date {
        if (option == 1) {
            // checkIn
            return checkInDate!
        }
        return checkOutDate!
    }
    
    // Método estático pra retornar o melhor hotel. Ele recebe um array de hoteis e retorna o melhor Hotel
    static func getBestHotel (hotels: [Hotel]) -> Hotel {
        var bestHotel: Hotel!
        
        // varrendo o array de hoteis
        for hotel in hotels {
            // se o bestHotel for nil, quer dizer que está varrendo o primeiro registro então o bestHotel passa a ser esse primeiro registro
            if (bestHotel == nil) {
                bestHotel = hotel
            } else if (hotel.getPriceInRange() < bestHotel.getPriceInRange()) {
                // compara se o atual bestHotel, é pelo menos, mais barato que o atual hotel do array, se não for, o bestHotel passa a ser esse hotel atual do array
                bestHotel = hotel
            } else if (hotel.getPriceInRange() == bestHotel.getPriceInRange()) {
                // ainda testando o hotel do array, se ele não for mais barato, verifica-se se ele é igual ao bestHotel atual. Se for é chamado o método que compara a classificação entre os dois, retornando o que for melhor classificado
                bestHotel = compareClassification(hotel1: hotel, hotel2: bestHotel)
            }
        }
        
        // Depois de tudo, retorna definitivamente o melhor hotel
        return bestHotel
        
    }
    
    // Método estático que compara as classificações dos Hoteis, caso as diárias sejam do mesmo valor
    private static func compareClassification(hotel1: Hotel, hotel2: Hotel) -> Hotel {
        if (hotel1.classification >= hotel2.classification) {
            return hotel1
        }
        return hotel2
    }
}
