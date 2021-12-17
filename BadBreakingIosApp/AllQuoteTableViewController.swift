//
//  CharacterTableViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//


import UIKit

class AllQuoteTableViewController: UITableViewController {

//    @IBAction func reload(_ sender: Any) {
//
//        tableView.reloadData()
//    }
    
    var quoteList = QuoteList()
    var quote: Quote!
   
    var myArray = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
         self.navigationItem.rightBarButtonItem = self.editButtonItem

        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           tableView.reloadData()
       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return quoteList.list.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)

          if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
              if cell.accessoryType == .checkmark {
                  cell.accessoryType = .none

              } else {
                  cell.accessoryType = .checkmark

              }
          }
      }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allquotedetail", for: indexPath)

        cell.textLabel?.text = String(indexPath.row + 1)
               let index = indexPath.row
               cell.detailTextLabel?.text = quoteList.list[index].author
               
               return cell

       
    }
    


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            quoteList.removeQuote(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        quoteList.moveQuote(from: fromIndexPath.row, to: to.row)
    }
    

  

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
       // let dst = segue.destination as! CharacterDetailViewController
                        //dst.name = characterList.list[tableView.indexPathForSelectedRow!.row].name
        
   // }
 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        let dst = segue.destination as! AllQuoteDetailViewController
        dst.quoteList = quoteList
        dst.qid = quoteList.list[tableView.indexPathForSelectedRow!.row].quote_id
        dst.q = quoteList.list[tableView.indexPathForSelectedRow!.row].quote
        dst.auth = quoteList.list[tableView.indexPathForSelectedRow!.row].author
        dst.ser = quoteList.list[tableView.indexPathForSelectedRow!.row].series
     }

}




