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
			("photo", 	"photos"),
			("piano", 	"pianos"),
			("halo", 	"halos"),
			("child", 	"children"),
			("goose", 	"geese"),
			("man", 	"men"),
			("woman", 	"women"),
			("tooth", 	"teeth"),
			("foot", 	"feet"),
			("mouse", 	"mice"),
			("person", 	"people"),
		]
		let unchanging: [String] = [
			"sheep",
			"series",
			"species",
			"deer",
		]

		if unchanging.contains(self) {
			return self
		}

		//evaluate if there is a match in the exeptions
		//if so, return the plural
		for (exception, plural) in exceptions {
			guard self == exception else { continue }
				return plural
		}

		//check if a trailing 'f' should be changed to 'ves'
		if !["roof", "belief", "chef", "chief"].contains(self) &&
			(self.last == "f" ||
		    self.suffix(2) == "fe") {

			return self.dropLast( self.last == "f" ? 1 : 2 ) + "ves"
		}

		//check if the word ends with 'y' and should be changed to 'ies'
		if self.last == "y" {
			if !["a", "e", "i", "o", "o"].contains(Substring(self.suffix(2)).first) {
				return self.dropLast(1) + "ies"
			}
		}

		//check if the word ends with 'us' and should be changed to 'i'
		if self.suffix(2) == "us" {
			return self.dropLast(2) + "i"
		}

		//check if the word ends with 'on' and should be changed to 'a'
		if self.suffix(2) == "on" {
			return self.dropLast(2) + "a"
		}

		//check if the end should be an "es" based on the last few letters
		if ["o", "s", "x", "z"].contains(self.last) ||
		   ["sh", "ss", "ch", "is"].contains(self.suffix(2)) {
			if self.suffix(2) == "is" {
				return self.dropLast(2) + "es" }

			return self + "es"
		}

		//When everything else has been tried, just add an "s"
		return self + "s"
	}
}


