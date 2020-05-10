//
//	Page.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Page : NSObject, NSCoding{

  var contentitems : Contentitem!
	var pagenum : String!
	var pagesize : String!
	var title : String!
	var totalcontentitems : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let contentitemsData = dictionary["content-items"] as? [String:Any]{
			contentitems = Contentitem(fromDictionary: contentitemsData)
		}
		pagenum = dictionary["page-num"] as? String
		pagesize = dictionary["page-size"] as? String
		title = dictionary["title"] as? String
		totalcontentitems = dictionary["total-content-items"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if contentitems != nil{
			dictionary["content-items"] = contentitems.toDictionary()
		}
		if pagenum != nil{
			dictionary["page-num"] = pagenum
		}
		if pagesize != nil{
			dictionary["page-size"] = pagesize
		}
		if title != nil{
			dictionary["title"] = title
		}
		if totalcontentitems != nil{
			dictionary["total-content-items"] = totalcontentitems
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contentitems = aDecoder.decodeObject(forKey: "content-items") as? Contentitem
         pagenum = aDecoder.decodeObject(forKey: "page-num") as? String
         pagesize = aDecoder.decodeObject(forKey: "page-size") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         totalcontentitems = aDecoder.decodeObject(forKey: "total-content-items") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contentitems != nil{
			aCoder.encode(contentitems, forKey: "content-items")
		}
		if pagenum != nil{
			aCoder.encode(pagenum, forKey: "page-num")
		}
		if pagesize != nil{
			aCoder.encode(pagesize, forKey: "page-size")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if totalcontentitems != nil{
			aCoder.encode(totalcontentitems, forKey: "total-content-items")
		}

	}

}
