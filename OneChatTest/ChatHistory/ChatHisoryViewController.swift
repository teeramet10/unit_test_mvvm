//
//  ViewController.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

class ChatHistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : ChatHistoryViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
    }

    
    func initComponent(){
        viewModel = ChatHistoryViewModel(repository: ChatRoomRepository())
        viewModel?.didSuccessGetChatHistory = {response in
            self.tableView.reloadData()
        }
        viewModel?.didErrorGetChatHistory = {error in
            print(error.localizedDescription)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatHistoryTableViewCell.nib, forCellReuseIdentifier: ChatHistoryTableViewCell.identifier)
        
        viewModel?.getChatHistory()
    }

}

extension ChatHistoryViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.listChat?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatHistoryTableViewCell.identifier )  as? ChatHistoryTableViewCell else{return UITableViewCell()}
        cell.setData(data: viewModel?.listChat?[indexPath.row])
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

