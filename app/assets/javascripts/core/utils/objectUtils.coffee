[
	"at", "compact", "contains", "countBy", "difference"
	"find", "findIndex", "findLast", "findLastIndex", "first"
	"flatten", "forEachRight", "groupBy", "indexBy", "initial"
	"intersection", "invoke", "last", "lastIndexOf", "max"
	"min", "pluck", "pull", "range", "reduceRight"
	"reject", "remove", "rest", "sample", "shuffle"
	"size", "sortBy", "sortedIndex", "union", "uniq"
	"where", "without", "xor", "zip", "zipObject"
	"cloneDeep"
].forEach (functionName) ->
	Array::[functionName] = ->
		args = Array::slice.call arguments
		_[functionName].apply @, [@].concat args

String::capitalize = ->
	@charAt(0).toUpperCase() + this.slice(1)