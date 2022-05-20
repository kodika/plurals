//
//  PluralsTests.swift
//  PluralsTests
//
//  Created by Ike Mattice on 1/3/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import XCTest
@testable import Plurals

class PluralsTests: XCTestCase {

	func testAddingS() {
		let examples: [(String, String)] = [
			("cat", 	"cats"),
			("house", 	"houses"),
			("tree", 	"trees"),
			("Pam", 	"Pams"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testAddingES() {
		let examples: [(String, String)] = [
			("marsh", 	"marshes"),
			("truss", 	"trusses"),
			("bus", 	"buses"),
			("lunch", 	"lunches"),
			("tax", 	"taxes"),
			("blintz", 	"blintzes"),
			("photo", 	"photos"),
			("potato", 	"potatoes"),
			("tomato", 	"tomatoes"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testEndingInO() {
		let examples: [(String, String)] = [
			("banjo", 	 "banjoes"),
			("zoo", 	 "zoos"),
			("taco", 	 "tacos"),
			("mosquito", "mosquitoes"),

		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testEndingInF() {
		let examples: [(String, String)] = [
			("knife", 	"knives"),
			("wife", 	"wives"),
			("wolf", 	"wolves"),
			("roof", 	"roofs"),
			("belief", 	"beliefs"),
			("chef", 	"chefs"),
			("thief",	"thieves"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testEndingInY() {
		let examples: [(String, String)] = [
			("city", 	"cities"),
			("puppy", 	"puppies"),
			("ray", 	"rays"),
			("boy", 	"boys"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testEndingInUs() {
		let examples: [(String, String)] = [
			("cactus", 	"cacti"),
			("focus", 	"foci"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testEndingInOn() {
		let examples: [(String, String)] = [
			("phenomenon", 	"phenomena"),
			("criterion", 	"criteria"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testEndingInIum() {
		let examples: [(String, String)] = [
			("millenium", 	"millenia"),
			("criterion", 	"criteria"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}


	func testUnchanging() {
		let examples: [(String, String)] = [
			("sheep", 	"sheep"),
			("series", 	"series"),
			("deer", 	"deer"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testRegexReplacement() {
		let examples: [(String, String)] = [
			("man", 		"men"),
			("woman", 		"women"),
			("fireman", 	"firemen"),
			("child", 		"children"),
			("schoolchild", "schoolchildren"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testExceptions() {
		let examples: [(String, String)] = [
			("roof", 		"roofs"),
			("vertebra", 	"vertebrae"),
			("ox", 			"oxen"),
			("axis", 		"axes"),
			("tableau", 	"tableaux"),
			("goose", 		"geese"),
			("moose", 		"moose"),
			("foot", 		"feet"),
			("hotfoot", 	"hotfeet"),
			("tooth", 		"teeth"),
			("die", 		"dice"),
			("this", 		"these"),
			("genus", 		"genera"),
			("fungus", 		"fungi"),
			("index", 		"indices"),
			("appendix", 	"appendices"),
			("photo", 		"photos"),
			("torpedo", 	"torpedoes"),
			("corpus", 		"corpora"),
			("that", 		"those"),
			("apparatus", 	"apparatuses"),
			("analysis", 	"analyses"),
            ("person",      "people"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}
	func testSingular() {

	}

	func testSentance() {

	}
}
