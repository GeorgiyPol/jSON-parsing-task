import Foundation

public class NetworkClass {
    
    public init() {}
    
    public func makeURL(scheme: String,
                        host: String,
                        path: String,
                        queryItems: [URLQueryItem]?) -> String {

        var components = URLComponents()
        
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let componentsString = components.string else { return "an error occurred in the line, double-check" }
        
        return componentsString
    }
    
    public func getData(urlRequest: String) {
        let urlRequest = URL(string: urlRequest)
        
        guard let url = urlRequest else { return }
        let configuration: URLSessionConfiguration = .default
        let session = URLSession(configuration: configuration)
        
        
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("There was an error: \(String(describing: error?.localizedDescription))")

            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                guard let data = data else { return }
                
                self.parse(json: data)

            } else if let response = response as? HTTPURLResponse, (400...499).contains(response.statusCode) {
                print("Unexpected Client Error! Error code: \(response.statusCode)")

            } else if let response = response as? HTTPURLResponse, (500...511).contains(response.statusCode) {
                print("Unexpected Server Error! Error code: \(response.statusCode)")

            }
        }.resume()
    }
    
    public func parse(json: Data) {
        
        if let jsonModel = try? JSONDecoder().decode(Welcome.self, from: json) {
            
            for uniqCard in jsonModel.cards {
                print("""
                    Имя карты: \(uniqCard.name)
                    Тип: \(uniqCard.type)
                    Мановая стоимость: \(uniqCard.manaCost ?? "0")
                    Название сета: \(uniqCard.setName)
                    
                    ----------------------//----------------------
                    
                    """)
            }
        }
    }
}
