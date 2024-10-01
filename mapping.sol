** Mapping **
/**
 * Maps are created with the syntax `mapping(keyType => valueType)`
 * The keyType can be any built in value type, bytes, string, or any contract.
 * ValueType can be any type including another mapping, an array,or a struct.
 * Their purpose is for organizing data in smart contracts efficiently.
 * Mapping always returns a value, default if not explicitly set
 */


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
	mapping(address => uint) public myMap;

	function get(address _addr) public view returns (uint) {
		return myMap[_addr];
	}
	function set(address _addr, uint _i) public {
		myMap[_addr] = _i;
	}

	function remove(address _addr) public {
		delete myMap[_addr];
	}
}

/* Nested mapping is mapping from address to another mapping
 * You can get values from a nested mapping even when it is not initialized
 */
contract NestedMapping {
	mapping(address => mapping(uint256 => bool)) public nested;

	function get(address _addr1, uint _i) public view returns (uint) {
		return nested[_addr][_i];
	}

	function set(address _addr1, uint _i, bool _boo) public {
		nested[_addr1][_i] = _boo;
	}

	function remove(address _addr1, uint _i) public {
		delete nested[_addr1][uint _i];
	}
}

// A mapping with a STruct as Key and Array as Value

contract ComplexMapping {
	struct User {
		uint id;
		string name;
	}

	mapping(User => uint[]) public userTransactions;

	function addTransaction(uint _id, string memory _name, uint _amount) public {
		User memory user = User(_id, _name);
		userTransactions[user].push(_amount);
	}

	function getTransactions(uint _id, string memory _name) public view returns (uint[] memory) {
		User memory user = User(_id, _name);
		return userTransactions[user];
	}
}

// Mapping with Array-Like key and another mapping as Value

contract NestedMapping {
	mapping(bytes32 => mapping(address => uint)) public keyToMapping;

	function setMapping(bytes32 _key, address _user, uint _value) public {
		keyToMapping[_key][_user] = _value;
	}

	function getMapping(bytes32 _key, address _user) public view returns (uint) {
		return keyToMapping[_key][_user];
	}
}

