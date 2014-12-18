#= require testDependencies

describe "Array", ->
	it "can map by object properties", ->
		array = [
			{ type: "Dog", age: 7 }
			{ type: "Cat", age: 10 }
		]

		expect(array.mapBy("type")).toDeepEqual ["Dog", "Cat"]

describe "String", ->
	it "can capitalize its first letter", ->
		expect("hellOo".capitalize()).toBe "HellOo"