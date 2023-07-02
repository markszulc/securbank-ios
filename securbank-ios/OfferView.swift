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
                            
                            NavigationLink(value: offer) {
                                VStack (alignment: .leading, spacing: 5) {
                                    Text(offer.headline)
                                        .padding(10)
                                        .font(.custom("AdobeClean-Regular", size: 18))
                                        .foregroundColor(Color("sb_white"))
                                    
                                }
                                .frame(width: 150, height: 150)
                                .background(Color("sb_highlight"))
                            }
                            .navigationDestination(for: Offer.Data.OfferList.Items.self) {offer in
                                ZStack {
                                    VStack {
                                        
                                        let url = URL(string: (offer.heroImage?._publishUrl ?? "") + "/_jcr_content/renditions/cq5dam.web.1280.1280.jpeg")!

                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                            .frame(height: 300)
                                            
                            
                                        Text(offer.headline)
                                            .font(.custom("AdobeClean-Regular", size: 30))

                                        
                                        Text(offer.pretitle)
                                            .font(.custom("AdobeClean-Black", size: 30))
                                        
                                        let detail = offer.detail.plaintext ?? ""
                                        
                                        Text(detail)
                                            .font(.custom("AdobeClean-Regular", size: 18))
                                        
                                        Button(action: {print("Offer")}) {
                                              Text("Find out more")
                                                  .frame(minWidth: 0, maxWidth: 156)
                                                  .font(.custom("AdobeClean-ExtraBold", size: 16))
                                                  .padding(10)
                                                  .foregroundColor(.white)
                                                  .overlay(
                                                      RoundedRectangle(cornerRadius: 25)
                                                          .stroke(Color("sb_highlight"), lineWidth: 2)
                                              )
                                          }
                                          .background(Color("sb_highlight"))
                                          .cornerRadius(25)
                                          .padding(.top, 10.0)
                                          .padding(.leading, 20.0)
                                          
                                        Spacer()

                                    }
                                }
                            }
                        }
                    }
                    .padding(.leading, 20)
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
        load()
    }
    
    public func load() {
        let semaphore = DispatchSemaphore (value: 0)
        let cachebustfordemos = Double.random(in: 1...100)
        print("calling AEM" + cachebustfordemos.description)
        @State var aemurl: String = UserDefaults.standard.string(forKey: "AEM_URL_KEY") ?? "https://publish-p55117-e571178.adobeaemcloud.com"
        let url = URL(string: aemurl + "/graphql/execute.json/securbank/OfferList;locale=en?chk=" + cachebustfordemos.description)!
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
                struct Items : Hashable, Codable {
                    let headline:String
                    let pretitle:String
                    struct HeroImage : Hashable,Codable {
                        let _publishUrl: String
                    }
                    struct Detail : Hashable,Codable {
                        let plaintext: String?
                    }
                    let heroImage:HeroImage?
                    let detail:Detail
                }
            let items:[Items]
        }
        let offerList:OfferList
    }
     let data:Data
}
