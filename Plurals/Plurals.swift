//
//  Plurals.swift
//  Plurals
//
//  Created by Ike Mattice on 1/3/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation


extension String {
	func plural() -> String {
		//check if the end should be an "es" based on the last few letters
		if ["s", "x", "z"].contains(self.last) ||
		   ["sh", "ss", "ch"].contains(self.suffix(2)) {
			return self + "es"
		}

		//When everything else has been tried, just add an "s"
		return self + "s"
	}

//	let unchanging: [String] = [
//
//	]

}
