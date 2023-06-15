"use client"

import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { useAccount, useBalance,  usePrepareSendTransaction, useContractWrite, usePrepareContractWrite, useContractRead, useSendTransaction } from "wagmi";
import { abiData, wrappedContractAddress } from "~/constants/wrappedWowenContract";
import { parseEther } from "viem";


export const Wrap = () => {

    const [input, setInput] = useState<any>(1)


    const { address } = useAccount()
    const { data: balancedData, isError: balancedError, isLoading: balancedLoading } = useBalance({
        address: address,
    })
    const { data: balWW, isError: balErr, isLoading: balLoad } = useContractRead({
        address: wrappedContractAddress,
        abi: abiData,
        functionName: 'balanceOf',
        args: [address]

    })

    const { config: contractprepWriterConf, error: contractprepWriteError } = usePrepareContractWrite({
        address: wrappedContractAddress,
        abi: abiData,
        functionName: 'deposit',

    })
    const { data: depositData, isError: depositError, isSuccess: depositSuccess, isLoading: depositLoading, write } = useContractWrite(contractprepWriterConf)

    const { data: prepSendData, error, config } = usePrepareSendTransaction({
        to: wrappedContractAddress,
        value: parseEther(`${input}`)
    })
    const { sendTransaction } = useSendTransaction(config)

    const { register, handleSubmit, formState: { isValid, errors } } = useForm({ mode: 'onBlur' });
    const onSubmit = () => {
        write?.();
    }


    const [hydrated, setHydrated] = React.useState(false);
    React.useEffect(() => {
        setHydrated(true);
    }, []);
    if (!hydrated) {
        // Returns null on first render, so the client and server match
        return null;
    }
 

    return (
        <>
            <div className="text-white font-mono pt-4 text-xl flex gap-12 justify-center">
                <div> {balancedData?.formatted.slice(0,6)} {balancedData?.symbol} </div>  Wrap your Tokens  <div >{balWW?.toString().slice(0,6)} WWOW</div>
            </div>
            <div className="flex justify-center mt-4 ">
                <div className="w-[50vw] rounded-xl h-48 text-center border-white border-4">
                    <form onSubmit={handleSubmit(onSubmit)}>
                        <div className="w-full">
                            <input {...register("depositAmount", {
                                required: false,
                                min: "0.000002",
                                onChange(e) {
                                    setInput(e.target.value)
                                },
                            })} type="number" placeholder="WoWn Amount" className="peer w-[45%] mt-12  text-center h-full bg-transparent text-white font-sans font-normal outline outline-0 focus:outline-0 disabled:bg-blue-gray-50 disabled:border-0 transition-all placeholder-shown:border placeholder-shown:border-blue placeholder-shown:border-t-blue border focus:border-3 border-t-transparent focus:border-t-transparent px-3 py-1.5 rounded-[7px] border-blue !border-rtm-black-100 !border-t-rtm-black-100 text-base !text-rtm-green-400 focus:!border-rtm-green-400 focus:!border-t-rtm-green-400 [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none" />
                        </div>
                        {/* {error && (
                            <div>An error occurred preparing the transaction: {error.message}</div>
                        )} */}
                        <button className="mt-8 hover:border-white border-blue border-3" disabled={!sendTransaction} onClick={() => sendTransaction?.()}>
                            Send Transaction
                        </button>

                    </form>
                </div>
            </div>

        </>
    )
}


                        {/* <button
                            onClick={() => write?.()}
                            className="align-middle select-none border-white font-sans transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none px-6 shadow-blue hover:shadow-lg focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none normal-case text-base text-center font-bold rounded-lg cursor-pointer hover:shadow-rtm-green shadow-none py-4 text-white bg-wowen w-full" type="button">
                            <div className="flex items-center">
                                <div className="flex justify-center w-full">
                                    <p>Wrap your WoWn</p>
                                </div>
                            </div>
                        </button> */}