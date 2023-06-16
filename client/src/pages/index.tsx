
import { type NextPage } from "next";
import React from "react";
import { Tabs } from "~/components/Tabs";





const Home: NextPage = () => {
  const [hydrated, setHydrated] = React.useState(false);
  React.useEffect(() => {
      setHydrated(true);
  }, []);
  if (!hydrated) {
      // Returns null on first render, so the client and server match
      return null;
  }
  return (
    <div className="w-full flex justify-center px-2 sm:px-0">
      <Tabs />
    </div>
  )

};

export default Home;
