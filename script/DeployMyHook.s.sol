// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "forge-std/Script.sol";
import "../src/MyHook.sol";
import "../lib/v4-core/src/interfaces/IPoolManager.sol";

contract DeployMyHook is Script {
    // 正确的校验和地址（大小写已修正，编译器100%识别）
    address constant POOL_MANAGER_ADDR = 0x498581fF718922c3f8e6A244956aF099B2652b2b;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 显式转换为合约类型，匹配构造函数要求
        IPoolManager poolManager = IPoolManager(POOL_MANAGER_ADDR);
        MyHook hook = new MyHook(poolManager);

        console.log("Hook deployed at:", address(hook));

        vm.stopBroadcast();
    }
}