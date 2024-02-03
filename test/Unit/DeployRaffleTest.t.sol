// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Raffle} from "src/Raffle.sol";
import {DeployRaffle} from "script/DeployRaffle.s.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";
import {Test} from "forge-std/Test.sol";

contract DeployRaffleTest is Test {
    Raffle raffle;
    DeployRaffle deployRaffle;
    HelperConfig helperConfig;

    function setUp() public {
        deployRaffle = new DeployRaffle();
    }

    function testRun() public {
        // Arrange
        // Act
        (Raffle resultRaffle, HelperConfig resultHelperConfig) = deployRaffle
            .run();

        // Assert
        assertTrue(address(resultRaffle) != address(0));
        assertTrue(address(resultHelperConfig) != address(0));
    }

    // Assert
    // Check the balance of the subscription contract or the state variables
    // to verify that the subscription was funded
}

// Assert
// Check the consumer list of the raffle contract
// to verify that the consumer was added
