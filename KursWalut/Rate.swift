//
//  Rate.swift
//  KursWalut
//
//  Created by Vlad Koval on 24.06.2021.
//

import Foundation


class Rate : NSObject, NSCoding{

    var effectiveDate : String!
    var mid : Float!
    var no : String!


    /**
     * In stantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        effectiveDate = dictionary["effectiveDate"] as? String
        mid = dictionary["mid"] as? Float
        no = dictionary["no"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if effectiveDate != nil{
            dictionary["effectiveDate"] = effectiveDate
        }
        if mid != nil{
            dictionary["mid"] = mid
        }
        if no != nil{
            dictionary["no"] = no
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        effectiveDate = aDecoder.decodeObject(forKey: "effectiveDate") as? String
        mid = aDecoder.decodeObject(forKey: "mid") as? Float
        no = aDecoder.decodeObject(forKey: "no") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if effectiveDate != nil{
            aCoder.encode(effectiveDate, forKey: "effectiveDate")
        }
        if mid != nil{
            aCoder.encode(mid, forKey: "mid")
        }
        if no != nil{
            aCoder.encode(no, forKey: "no")
        }
    }
}
