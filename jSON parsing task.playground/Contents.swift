import UIKit
import Foundation

let firstNetworkClass = NetworkClass()

let firstExampleURL = ExampleURL(queryItemValue: .blackLotus)
let secondExampleURL = ExampleURL(queryItemValue: .opt)

let tryCreateFirstURL =  firstNetworkClass.makeURL(scheme: firstExampleURL.welcomeScheme,
                                                   host: firstExampleURL.welcomeHost,
                                                   path: firstExampleURL.welcomePath,
                                                   queryItems: [URLQueryItem(name: firstExampleURL.queryItemName,
                                                                             value: firstExampleURL.queryItemValue.rawValue)])


let tryCreateSecondURL =  firstNetworkClass.makeURL(scheme: secondExampleURL.welcomeScheme,
                                                    host: secondExampleURL.welcomeHost,
                                                    path: secondExampleURL.welcomePath,
                                                    queryItems: [URLQueryItem(name: secondExampleURL.queryItemName,
                                                                              value: secondExampleURL.queryItemValue.rawValue)])

firstNetworkClass.getData(urlRequest: tryCreateFirstURL)
firstNetworkClass.getData(urlRequest: tryCreateSecondURL)
