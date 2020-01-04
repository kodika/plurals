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
		//words that don't follow the rules
		let exceptions: [(String, String)] = [
		]

		//evaluate if there is a match in the exeptions
		//if so, return the plural
		for (exception, plural) in exceptions {
			guard self == exception else { continue }
				return plural
		}

		//check if the end should be an "es" based on the last few letters
		if ["s", "x", "z"].contains(self.last) ||
		   ["sh", "ss", "ch"].contains(self.suffix(2)) {
			return self + "es"
		}

		//check if a trailing 'f' should be changed to 'ves'
		if !["roof", "belief", "chef", "chief"].contains(self) &&
			(self.last == "f" ||
		    self.suffix(2) == "fe") {

			return self.dropLast( self.last == "f" ? 1 : 2 ) + "ves"
		}

		//When everything else has been tried, just add an "s"
		return self + "s"
	}
}


