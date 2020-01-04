//
//  ConcentrationThemeChooserViewController.swift
//  concentration-game
//
//  Created by Eve Le on 1/3/20.
//  Copyright © 2020 Eve Le. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    let themes = [
        "Animal": ["🐶","🐼","🐷","🐰","🐸","🐳","🦩","🐉","🦞","🐞"],
        "Food": ["🍤","🍙","🍟","🥨","🍩","🍪","🍭","🍫","🍿","🍕"]
    ]
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
    

}
