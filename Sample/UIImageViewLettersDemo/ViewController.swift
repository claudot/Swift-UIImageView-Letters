//  Created by Paul-Anatole CLAUDOT on 12/02/2017.
//  Copyright © 2017 PAC. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Model
    let users: [String] = ["Jean Paul", "Pierre-Anatole Jean", "Benjamin Per", "Antoine Ter", "Jean Paul", "Pierre-Anatole Jean", "Benjamin Per", "Antoine Ter", "Jean Paul", "Pierre-Anatole Jean", "Benjamin Per", "Antoine Ter"]

    // MARK: Delegate & Datasource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = nil
        cell = tableView.dequeueReusableCell(withIdentifier: "letterCellIdentifier")
        (cell as! LetterTableViewCell).configure(name: users[indexPath.row])
        return cell!
    }
}
