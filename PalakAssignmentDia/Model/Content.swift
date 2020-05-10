//
//	Content.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Content : NSObject, NSCoding{

	var name : String!
	var posterimage : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		name = dictionary["name"] as? String
		posterimage = dictionary["poster-image"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if name != nil{
			dictionary["name"] = name
		}
		if posterimage != nil{
			dictionary["poster-image"] = posterimage
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         name = aDecoder.decodeObject(forKey: "name") as? String
         posterimage = aDecoder.decodeObject(forKey: "poster-image") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if posterimage != nil{
			aCoder.encode(posterimage, forKey: "poster-image")
		}

	}

}