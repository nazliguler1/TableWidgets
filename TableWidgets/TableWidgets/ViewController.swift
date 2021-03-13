//
//  ViewController.swift
//  TableWidgets
//
//  Created by Nazlı Güler on 12.03.2021.
//  Copyright © 2021 Nazlı Güler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonAdd: UIButton!
    
    var content = ["Mia's cat food","Cat litter","Cat malt","Cat treats"]
       
       override func viewDidLoad() {
           super.viewDidLoad()
       
       }
    
    
    @IBAction func onClickDeleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        content.remove(at: indexpath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .right)
        tableView.endUpdates()
        }
        
 
    
   @IBAction func onClickAddButton(_ sender: UIButton){ 
          content.append(textField.text!)
          textField.text = ""
          tableView.beginUpdates()
    
          tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
          tableView.endUpdates()
          tableView.reloadData()

      }
   }


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.Label?.text = content[indexPath.row]
        return cell
        
    }
    
}
