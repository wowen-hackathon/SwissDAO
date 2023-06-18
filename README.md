# SwissDAO

## Contracts

| Symbol | Name               | Address                                    | Comment                |
|--------|--------------------|--------------------------------------------|------------------------|
| WWOW   | Wrapped Wowen      | 0x1Fc7D8CF4d869C68884A9727943294019289eBA2 | Send tokens to contract to get WWOW |
| -      | TokenFactory       |   | Call Create with symbol, name and supply to deploy a token. |
| -      | UniSwapV2 Factory  |   | Link to uniswapv2 doc. |
| -      | UniSwapV2 Router   |   | UniSwap DEX |

## Deploying tokens
TBD

## Wrapped Wowen

To start a DeFi System we first deployed a Wowen Wrapper that works similar to Wrapped Ethereum: When it receives WOW it sends wrapped WOW (WWOW) back.

The WWOW can be converted into WOW again using the withdraw method.