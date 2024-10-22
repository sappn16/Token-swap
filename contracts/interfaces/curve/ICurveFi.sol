// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.22;

interface ICurveFi {
    function get_virtual_price() external view returns (uint256);

    function add_liquidity(
        // 2Pool
        uint256[2] calldata amounts,
        uint256 min_mint_amount
    ) external payable;

    function add_liquidity(
        // 3Pool
        uint256[3] calldata amounts,
        uint256 min_mint_amount
    ) external payable;

    function add_liquidity(
        // 4Pool
        uint256[4] calldata amounts,
        uint256 min_mint_amount
    ) external payable;

    function remove_liquidity_imbalance(
        uint256[2] calldata amounts,
        uint256 max_burn_amount
    ) external;

    function remove_liquidity(
        uint256 _amount,
        uint256[2] calldata amounts
    ) external;

    function remove_liquidity_one_coin(
        uint256 _token_amount,
        int128 i,
        uint256 min_amount
    ) external;

    function exchange(
        uint256 from,
        uint256 to,
        uint256 _from_amount,
        uint256 _min_to_amount,
        bool use_eth
    ) external payable;

    function exchange(
        int128 from,
        int128 to,
        uint256 _from_amount,
        uint256 _min_to_amount
    ) external payable;

    function balances(uint256) external view returns (uint256);

    function coins(uint256 i) external view returns (address);

    function price_oracle() external view returns (uint256);

    function get_dy(
        int128 from,
        int128 to,
        uint256 _from_amount
    ) external view returns (uint256);

    function get_dy(
        uint256 from,
        uint256 to,
        uint256 _from_amount
    ) external view returns (uint256);

    // EURt
    function calc_token_amount(
        uint256[2] calldata _amounts,
        bool _is_deposit
    ) external view returns (uint256);

    // 3Crv Metapools
    function calc_token_amount(
        address _pool,
        uint256[4] calldata _amounts,
        bool _is_deposit
    ) external view returns (uint256);

    // sUSD, Y pool, etc
    function calc_token_amount(
        uint256[4] calldata _amounts,
        bool _is_deposit
    ) external view returns (uint256);

    // 3pool, Iron Bank, etc
    function calc_token_amount(
        uint256[3] calldata _amounts,
        bool _is_deposit
    ) external view returns (uint256);

    function calc_withdraw_one_coin(
        uint256 amount,
        int128 i
    ) external view returns (uint256);
}
