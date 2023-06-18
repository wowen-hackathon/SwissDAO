import { Disclosure } from "@headlessui/react"
import React, { useState } from "react";
import { ethers } from "ethers";
import { PairComponent } from "./PairComponent";
import { useAccount, useBalance, usePrepareSendTransaction, useContractWrite, usePrepareContractWrite, useContractRead, useSendTransaction } from "wagmi";
import { abiData, wrappedContractAddress } from "~/constants/wrappedWowenContract";

export const Pair = () => {

    //@ts-ignore
    function classNames(...classes) {
        return classes.filter(Boolean).join(" ");
    }

    const { address } = useAccount()
    const [createAPair, setCreateAPair]= useState(false)

    const [tokenA, setTokenA] = useState("");
    const [tokenB, setTokenB] = useState("");

    const [tokenAQuantity, setTokenAQuantity] = useState(1);
    const [tokenBQuantity, setTokenBQuantity] = useState(1);

    const [withdrawalQuantity, setWithdrawalQuantity] = useState("");


    return (

        <div className="relative">
            <div className="text-end absolute pr-4 pt-2 right-0">
                <button onClick={()=> {setCreateAPair(!createAPair)}} className="text-white w- text-2xl backdrop-blur-xl border w-22 h-12 border-white p-2 pt-1 px-4 rounded-md hover:border-blue active:text-blue ">
                    + 
                </button>
            </div>
            <PairComponent />
        </div>
    )
}