# SwissDAO
Wowen DeFi:
- Wrapping and Unwrapping
- Token Factories for fixed supply, variable supply and capped / votable tokens.
- An Uniswap clone.

## Status
- Wrapping done: https://marvelous-puffpuff-f7e5b1.netlify.app/
- Factories deployed but dont work due to bug in wowen.
- Uniswap not deployed since it also has a factory.
- ABIs see ssrc directory.

## Contracts

| Symbol | Name                 | Address                                    | Comment                |
|--------|----------------------|--------------------------------------------|------------------------|
| WWOW   | Wrapped Wowen        | 0x1Fc7D8CF4d869C68884A9727943294019289eBA2 | Send tokens to contract to get WWOW |
| -      | TokenFactoryFixed    | 0xd9145CCE52D386f254917e481eB44e9943F39138 | Deploys a fixed supply token. |
| -      | TokenFactoryVariable | 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8 | Deploys a variable supply token, owner can mint, anyone can burn. |
| -      | TokenFactoryCapped   | 0xf8e81D47203A594245E36C48e151709F0C19fBe8 | Deploys a token with  |
| -      | UniSwapV2 Factory    | - | Link to uniswapv2 doc. |
| -      | UniSwapV2 Router     | - | UniSwap DEX |

## Deploying tokens
Call the token factory contracts create Method.

## Wrapped Wowen

To start a DeFi System we first deployed a Wowen Wrapper that works similar to Wrapped Ethereum: When it receives WOW it sends wrapped WOW (WWOW) back.

The WWOW can be converted into WOW again using the withdraw method.