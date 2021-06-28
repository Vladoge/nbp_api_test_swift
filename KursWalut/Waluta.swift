//
//  Waluta.swift
//  KursWalut
//
//  Created by Vlad Koval on 24.06.2021.
//
import Foundation


class Waluta : NSObject, NSCoding{

    var code : String!
    var currency : String!
    var rates : [Rate]!
    var table : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        code = dictionary["code"] as? String
        currency = dictionary["currency"] as? String
        table = dictionary["table"] as? String
        rates = [Rate]()
        if let ratesArray = dictionary["rates"] as? [[String:Any]]{
            for dic in ratesArray{
                let value = Rate(fromDictionary: dic)
                rates.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if code != nil{
            dictionary["code"] = code
        }
        if currency != nil{
            dictionary["currency"] = currency
        }
        if table != nil{
            dictionary["table"] = table
        }
        if rates != nil{
            var dictionaryElements = [[String:Any]]()
            for ratesElement in rates {
                dictionaryElements.append(ratesElement.toDictionary())
            }
            dictionary["rates"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? String
        currency = aDecoder.decodeObject(forKey: "currency") as? String
        rates = aDecoder.decodeObject(forKey: "rates") as? [Rate]
        table = aDecoder.decodeObject(forKey: "table") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if currency != nil{
            aCoder.encode(currency, forKey: "currency")
        }
        if rates != nil{
            aCoder.encode(rates, forKey: "rates")
        }
        if table != nil{
            aCoder.encode(table, forKey: "table")
        }
    }
}
