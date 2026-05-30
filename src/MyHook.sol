// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {BaseActionsRouter} from "../lib/v4-periphery/src/base/BaseActionsRouter.sol";
import {Hooks} from "../lib/v4-core/src/libraries/Hooks.sol";
import {IPoolManager} from "../lib/v4-core/src/interfaces/IPoolManager.sol";

contract MyHook is BaseActionsRouter {
    constructor(IPoolManager _poolManager) BaseActionsRouter(_poolManager) {}

    // 必须实现的_handleAction空函数
    function _handleAction(uint256 action, bytes calldata params) internal override {}

    // 必须写全14个Hook权限参数
    function getHookPermissions() public pure returns (Hooks.Permissions memory) {
        return Hooks.Permissions({
            beforeInitialize: true,
            afterInitialize: false,
            beforeAddLiquidity: false,
            afterAddLiquidity: false,
            beforeRemoveLiquidity: false,
            afterRemoveLiquidity: false,
            beforeSwap: false,
            afterSwap: false,
            beforeDonate: false,
            afterDonate: false,
            beforeSwapReturnDelta: false,
            afterSwapReturnDelta: false,
            afterAddLiquidityReturnDelta: false,
            afterRemoveLiquidityReturnDelta: false
        });
    }

    // 修正msgSender：和基类保持一致，加上override，用public
    function msgSender() public view override returns (address) {
        return address(this);
    }
}