//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Roderick Presswood on 2/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    var sections: [Section] = [
        Section(mainCellTitle: "1-3", expandableCellOptions: ["1", "2", "3"], isExpandableCellsHidden: true),
        Section(mainCellTitle: "4-6", expandableCellOptions: ["4", "5", "6"], isExpandableCellsHidden: true),
        Section(mainCellTitle: "7-9", expandableCellOptions: ["7", "8", "9"], isExpandableCellsHidden: true)
    ]
    
    let customTableView = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTableView.tableView.delegate = self
        customTableView.tableView.dataSource = self
        
        customTableView.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        customTableView.tableView.register(CustomExpandableCell.self, forCellReuseIdentifier: CustomExpandableCell.cellIdentifier)
        
        view.addSubview(customTableView)
        // Do any additional setup after loading the view.
        NSLayoutConstraint.activate([
            customTableView.topAnchor.constraint(equalTo: view.topAnchor),
            customTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if !section.isExpandableCellsHidden {
            return section.expandableCellOptions.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
            cell.setup(with: sections[indexPath.section].mainCellTitle)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomExpandableCell.cellIdentifier, for: indexPath) as! CustomExpandableCell
            cell.setup(with: sections[indexPath.section].expandableCellOptions[indexPath.row - 1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            sections[indexPath.section].isExpandableCellsHidden = !sections[indexPath.section].isExpandableCellsHidden
            tableView.reloadData()
        }
    }
    
}
