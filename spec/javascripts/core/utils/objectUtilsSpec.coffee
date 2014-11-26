#= require testDependencies

describe "String", ->
	it "can capitalize its first letter", ->
		expect("hellOo".capitalize()).toBe "HellOo"