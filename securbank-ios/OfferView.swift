//
//  OfferView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 23/6/2023.
//

import SwiftUI

struct OfferView: View {
    
    @ObservedObject var fetcher = AEM_offerFetcher()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .top, spacing: 20) {
                    ForEach(fetcher.offerlistheadless, id: \.headline) { offer in
                        
                        VStack (alignment: .leading, spacing: 5) {
                            Text(offer.headline)
                                .padding(10)
                                .font(.custom("AdobeClean-Regular", size: 18))
                                .foregroundColor(Color("sb_white"))
                                
                        }
                        .frame(width: 150, height: 150)
                        .background(Color("sb_highlight"))
                        
                    }
                }
                .padding(.leading, 10)
            }
        }

    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}

public class AEM_offerFetcher: ObservableObject {
    @Published var offerlistheadless = [Offer.Data.OfferList.Items]()
    
    init(){
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("--" + fontName)
            }
        }
        load()
    }
    
    public func load() {
        let semaphore = DispatchSemaphore (value: 0)
        let cachebustfordemos = Double.random(in: 1...100)
        print("calling AEM" + cachebustfordemos.description)
        let url = URL(string: "https://publish-p55117-e571178.adobeaemcloud.com/graphql/execute.json/securbank/OfferList;locale=en?chk=" + cachebustfordemos.description)!
        let request = URLRequest(url: url)
                

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                //print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            
        do {
           let offerJSON = try JSONDecoder().decode(Offer.self, from: data)
           let offerCount = offerJSON.data.offerList.items.count
                       print(offerCount)
                      
                       DispatchQueue.main.async {
                           self.offerlistheadless = offerJSON.data.offerList.items
                           dump(self.offerlistheadless)
                       }
                       
                       
                       } catch let jsonErr {
                                       print(".................................")
                                       print("Error serializing json:", jsonErr)
                       }
   
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
            
    }
}

struct Offer: Codable {
    struct Data : Codable {
        struct OfferList : Codable {
                struct Items : Codable {
                    let headline:String
                }
            let items:[Items]
        }
        let offerList:OfferList
    }
     let data:Data
}
