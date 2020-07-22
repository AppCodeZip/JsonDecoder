//
//  ViewController.swift
//  JsonApi
//
//  Created by Sushil Rathaur on 24/06/20.
//  Copyright © 2020 AppCodeZip. All rights reserved.
//

import UIKit
struct EmployeResponse : Decodable
{
    let empid, depid: Int
    let name, role, org: String
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getAppcodezipData()
    }

    func getAppcodezipData()
    {
        let url = "http://demo8044402.mockable.io/appcodezip"

        URLSession.shared.dataTask(with: URL(string: url)!) { (responseData, httpUrlResponse, error) in

            if(error == nil && responseData != nil && responseData?.count != 0)
            {
               //parse the responseData here
                let decoder = JSONDecoder()
                do {
                
                    //for json with collection
                    let result = try decoder.decode([EmployeResponse].self, from: responseData!)
                    print(result)

                    for employee in result
                    {
                        print(employee.name)
                    }
                }
                catch let error
                {
                    print("error occured while decoding = \(error.localizedDescription)")

                }
                
                
            }

        }.resume()
    }
}

