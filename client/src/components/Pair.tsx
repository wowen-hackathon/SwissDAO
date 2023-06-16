import { Disclosure } from "@headlessui/react"
import React, { useState } from "react";
import { useAccount, useNetwork } from "wagmi";
import { ethers } from "ethers";

export const Pair = () => {

        //@ts-ignore
    function classNames(...classes) {
        return classes.filter(Boolean).join(" ");
      }


      const { address } = useAccount();

  const [tokenA, setTokenA] = useState("");
  const [tokenB, setTokenB] = useState("");

  const [tokenAQuantity, setTokenAQuantity] = useState(1);
  const [tokenBQuantity, setTokenBQuantity] = useState(1);

  const [withdrawalQuantity, setWithdrawalQuantity] = useState("");

  
    return (

        <div></div>
    )
}