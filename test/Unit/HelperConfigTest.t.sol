// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract HelperConfigTest is Test {
    HelperConfig public helperConfig;
    uint256 entranceFee;
    uint256 interval;
    address vrfCoordinator;
    bytes32 gasLane;
    uint64 subscriptionId;
    uint32 callbackGasLimit;
    address link;
    uint256 deployerKey;

    function setUp() public {
        helperConfig = new HelperConfig();
        entranceFee = 0.01 ether;
        interval = 30;
        vrfCoordinator = 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625;
        gasLane = 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;
        subscriptionId = 0;
        callbackGasLimit = 500000;
        link = 0x779877A7B0D9E8603169DdbD7836e478b4624789;
        deployerKey = 41727430103281156254061225856807497319899378602865718339981804300130843080170;
    }

    function test_getSepoliaEthConfig() public {
        // Arrange

        // Act
        HelperConfig.NetworkConfig memory config = helperConfig
            .getSepoliaEthConfig();

        // Assert
        assertEq(config.entranceFee, entranceFee, "Entrance fee should match");
        assertEq(config.interval, interval, "Interval should match");
        assertEq(
            config.vrfCoordinator,
            vrfCoordinator,
            "VRF Coordinator should match"
        );
        assertEq(config.gasLane, gasLane, "Gas Lane should match");
        assertEq(
            config.subscriptionId,
            subscriptionId,
            "Subscription ID should match"
        );
        assertEq(
            config.callbackGasLimit,
            callbackGasLimit,
            "Callback Gas Limit should match"
        );
        assertEq(config.link, link, "Link should match");
        assertEq(config.deployerKey, deployerKey, "Deployer Key should match");
    }

    function test_getOrCreateAnvilEthConfig() public {
        // Arrange
        entranceFee = 0.01 ether;
        interval = 30;
        vrfCoordinator = 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625;
        gasLane = 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;
        subscriptionId = 0;
        callbackGasLimit = 500000;
        link = 0x779877A7B0D9E8603169DdbD7836e478b4624789;
        deployerKey = 77814517325470205911140941194401928579557062014761831930645393041380819009408; // Correct deployerKey
        // Act
        HelperConfig.NetworkConfig memory config = helperConfig
            .getOrCreateAnvilEthConfig();

        // Assert
        assertEq(config.entranceFee, entranceFee, "Entrance fee should match");
        assertEq(config.interval, interval, "Interval should match");
        assertEq(config.gasLane, gasLane, "Gas Lane should match");
        assertEq(
            config.subscriptionId,
            subscriptionId,
            "Subscription ID should match"
        );
        assertEq(
            config.callbackGasLimit,
            callbackGasLimit,
            "Callback Gas Limit should match"
        );
        assertEq(config.deployerKey, deployerKey, "Deployer Key should match");
    }
}
