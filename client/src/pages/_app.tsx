import { type AppType } from "next/dist/shared/lib/utils";
import "~/styles/globals.css";
import {
  getDefaultWallets,
  RainbowKitProvider,
} from '@rainbow-me/rainbowkit';
import '@rainbow-me/rainbowkit/styles.css';
import { configureChains, createConfig, WagmiConfig } from 'wagmi';
import { jsonRpcProvider } from 'wagmi/providers/jsonRpc';
import { wowen } from "~/helpers/chain";
import Layout from "~/layouts/layout";
import Head from "next/head";


const { chains, publicClient } = configureChains(
  [wowen],
  [
    jsonRpcProvider({
      rpc: (chain) => ({
        http: `https://api.wowen.io/nodes/rpc`,
        webSocket: `wss://${chain.id}.example.com`,
      }),
    }),
  ],
)

const { connectors } = getDefaultWallets({
  appName: 'Wowen Defi Dapp',
  projectId: '8f1b2beda90805b7a1320c99753267df',
  chains
});

const wagmiConfig = createConfig({
  autoConnect: true,
  connectors,
  publicClient
});

const MyApp: AppType = ({ Component, pageProps }) => {
  return (
    <>
    <Head>
    <title>Wowen ❖ Defi App</title>
    </Head>
    <WagmiConfig config={wagmiConfig}>
      <RainbowKitProvider chains={chains}>
        <Layout>
          <Component {...pageProps} />
        </Layout>
      </RainbowKitProvider>
    </WagmiConfig>
    </>
  )
};

export default MyApp;
