//
//  CountryModel.swift
//  ApiDataInTableView
//
//  Created by Srikanth Kyatham on 11/27/24.
//
import Foundation


struct Country: Codable {
    let name: String
    let code: String
    let capital: String
    let region: String
    let currency: Currency

    
}
struct Currency: Codable {
    let name: String
    let code: String

}

class CountryModel: ObservableObject {
    
    static let shared = CountryModel()
    
    func getData(from url: String, completion: @escaping([Country]) -> Void) {
        guard let serverURl = URL(string: url) else {
            print("Invalid Url")
            return  }
        URLSession.shared.dataTask(with: serverURl) { data, response, error in
            guard let data,error == nil else {
                print("No data or error \(error?.localizedDescription ?? " No error")")
                      return }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(countries) 
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
