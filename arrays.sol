// SPDX-License-Identifier

pragma solidity ^0.8.26;

contract Array {
	// several ways to initialize an array
	uint[] public arr;
	uint[] public arr2 = [1,2,3];

	//fixed size array, all elements initialize to 0
	uint[10] public myFixedArr;

	function get(uint i) public view returns (uint) {
		return arr[i];
	}

/**
 * Solidity can return the entire array, but one should
 * avoid arrays that can grow indefinitely.
 */
	function getArr() public view returns (uint[] memory) {
		return arr;
	}
	
	function push(uint i) public {
		// Append to array
		arr.push(i);
	}

/* Removes the last element from an array */
	function pop() public {
		arr.pop();
	}

	function getLength() public view returns (uint) {
		arr.length;
	}

/* Delete does not change the array length. 
 * It resets the value at index to it's default value, 0.
 */
	function remove(uint index) public {
		delete arr[index];
	}

	function examples() external {
		uint[] memory a = new uint[](5);
	}
}

// Remove an array element by shifting elements from right to left

contract ArrayRemoveByShifting {
	uint[] public arr;

	function remove(uint _index) public {
		require(_index < arr.length, "index out of bound");

		for (uint i = _index; i < arr.length - 1; i++) {
			arr[i] = arr[i + 1];
		}
		arr.pop();
	}

	function test() external {
		arr = [1,2,3,4,5];
		remove(2);
/**
 * Assert is used to test internal invariants —— conditions that should never be violated
 * In the following code, it is used to verify that the remove function has correctly
 * modified the array `arr`
 */

		assert(arr[0] == 1);
		assert(arr[1] == 2);
		assert(arr[2] == 4);
		assert(arr[3] == 5);
		assert(arr.length == 4);

		arr = [1];
		remove(0);

		assert(arr.length == 0);
	}
}

// Example showing removing an array element by copying the last element into the place to remove

contract ArrayReplaceFromEnd {
	uint[] public arr;

	function remove(uint index) public {
		arr[index] = arr[arr.length - 1];
		arr.pop();
	}

	function test() public {
		arr = [1,2,3,4];
		remove(1);

		assert(arr.length == 3);
		assert(arr[0] == 1);
		assert(arr[1] == 4);
		assert(arr[2] == 3);

		remove(2);

		assert(arr[0] == 1);
		assert(arr[1] == 4);
		assert(arr.length == 2);
	}
}

// Array of Structs
contract ArrayOfStructs {
	struct Person {
		string name;
		uint age;
	}

	// Array to store mulitple Person structs
	Person[] public people;

	// Add a new person to the array
	function addPerson(string memory _name, uint _age) public {
		people.push(Person(_name, _age));
	}

	// Get a person's data by index
	function getperson(uint index) public view returns (string memory, uint) {
		require(index < people.length, "Index out of bound");
		Person storage person = people[index];
		return (person.name, person.age);
	}
}

contract ArrayMapping {
	mapping(address => uint[]) public userValue;

	// Add a value to the array associated with an address
	function addValue(uint value) public {
		userValues[msg.sender].push(value);
	}

	// Get the array of values for a specific address
	function getValues() public view returns (uint[] memory) {
		return userValues[msg.sender];
	}

	// Get a specific value from the array for a specific address
	function getByIndex(uint index) public view returns (uint) {
		require(index < userValues[msg.sender].length, "Index is out of bound");
		return userValues[msg.sender][index];
	}
}

// Multidimensional Arrays
contract MD_Array {
	uint[][] public twoDArray;

	// Add a new 1D array to the 2D array
	function add1DArray(uint[] memory _arr) public {
		twoDArray.push(_arr);
	}

/* Get an element from the 2D array
 * The require function is used to enforce conditions that must be met for the function to
 * proceed. If the condition is not met, the tx is reverted (changes made during the execution
 * of the function are rolled back and an error message is thrown.
 */
	function getElement(uint rowIndex, uint colIndex) public view returns (uint) {
		require(rowIndex < twoDArray.length, "Row index out of bounds");
		require(colIndex < twoDArray[rowIndex].length, "Column index out of bounds");
		return twoDArray[rowIndex][colIndex];
	}
}

// Storing Arrays in Memory

contract MemoryArray {
/* A function that sorts an array in memory (bubble sort) */
	
	function sortArray(uint[] memory arr) public pure returns (uint[] memory) {
		uint n = arr.length;
		
		for (uint i = 0; i < n; i++) {
			for (uint j = 0; j < n - 1; j++) {
				if (arr[j] > arr[j + 1]) {
					(arr[j], arr[j + 1]) = (arr[j + 1], arr[j]);
				}
			}
		}
		return arr;
	}
}
