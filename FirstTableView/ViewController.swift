//
//  ViewController.swift
//  FirstTableView
//
//  Created by Elzada Kushbakova on 5/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var books: [BookModel] = [BookModel(author: "Александр Грибоедов", bookName: "Горе от ума", bookImage: UIImage(named: "book1")),
                           BookModel(author: "Джейн Остен", bookName: "Гордость и предубеждение", bookImage: UIImage(named: "book2")),
                           BookModel(author: "Федор Достоевский", bookName: "Идиот", bookImage: UIImage(named: "book3")),
                           BookModel(author: "Эмили Бронте", bookName: "Грозовой перевал", bookImage: UIImage(named: "book4")),
                           BookModel(author:  "Дж. Д. Сэлинджер", bookName: "Над пропастью во ржи", bookImage: UIImage(named: "book5")),
                           BookModel(author: "Сент-Экзюпери А.Д.", bookName: "Маленький принц ", bookImage: UIImage(named: "book6")),
                           BookModel(author:  "Оскар Уайльд", bookName: "Портрет Дориана Грея", bookImage: UIImage(named: "book7")),
                           BookModel(author: "Рэй Брэдбери", bookName: "451' по Фаренгейту", bookImage: UIImage(named: "book8"))]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: "BookCell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let data = books[indexPath.item]
        cell.bookNameLabel.text = data.bookName
        cell.authorLabel.text = data.author
        cell.bookImage.image = data.bookImage
        return cell
    }
}

