// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Rebardi is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, AccessManagedUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialAuthority) initializer public {
        __ERC20_init("rebardi", "BRD");
        __ERC20Burnable_init();
        __AccessManaged_init(initialAuthority);
        __UUPSUpgradeable_init();

        _mint(msg.sender, 11908786565 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public restricted {
        _mint(to, amount);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        restricted
        override
    {}
}
