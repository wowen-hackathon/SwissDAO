import { Html, Head, Main, NextScript } from 'next/document'

export default function Document() {
  return (
    <Html lang="en">
      <Head>
        <meta name="description" content="dApp for Wowen - Wrapper, a.e." />
        <link rel="icon" href="/logo.svg" />
      </Head>
      <body style={{background:"radial-gradient(closest-side, #64801e, #1a1c23)"}}>
        <Main />
        <NextScript />
      </body>
    </Html>
  )
}