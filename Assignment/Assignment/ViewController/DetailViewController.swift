//
//  DetailViewController.swift
//  Assignment
//
//  Created by mradulatray on 30/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - PROPERTY
    // ================
    let detailViewModel = DetailViewModel()
    
    // MARK: - OUTLETS
    // ===============
    @IBOutlet weak var IDLABEL: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - VIEW LIFE CYCLE FUNCTIONS
    // =================================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populateData()
    }
    
    func populateData() {
        
        IDLABEL.text = self.detailViewModel.getid()
        userIdLabel.text = self.detailViewModel.userID()
        titleLabel.text = self.detailViewModel.title()
        bodyLabel.text = self.detailViewModel.body()
        
        
    }
}
