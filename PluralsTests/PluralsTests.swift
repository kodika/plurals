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
			("truss", 	"trusses"),
			("bus", 	"buses"),
			("marsh", 	"marshes"),
			("lunch", 	"lunches"),
			("tax", 	"taxes"),
			("blintz", 	"blintzes"),
		]

		for (singular, plural) in examples {
			XCTAssertEqual(singular.plural(), plural,
						   "'\(plural)' is the plural of '\(singular)'.")
		}
	}

	func testUnchanging() {

	}

	func testNounsEndingInY() {

	}

	func testIrregularPlurals() {

	}

	func testNounsEndingInF() {

	}

	func testSingular() {

	}

	func testSentance() {

	}
}
