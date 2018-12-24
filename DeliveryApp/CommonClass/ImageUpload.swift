//
//  ImageUpload.swift
//  Teeshan
//
//  Created by Manab Kumar Mal on 06/05/17.

//

import Foundation
import SDWebImage

class ImageUpload: UIImageView
    
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func getDataFromUrl(url:String, completion: @escaping ((_ data: NSData?) -> Void))
    {
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL) { (data, response, error) in
            completion(NSData(data: data!))
            }.resume()
    }
    
    func downloadImage(url:String)
    {
        getDataFromUrl(url: url) { data in
            DispatchQueue.global().async {
                self.contentMode = UIViewContentMode.scaleAspectFill
                self.image = UIImage(data: data! as Data)
            }
        }
    }
    
    
}


