
import { useAccount, useBalance, usePrepareSendTransaction, useContractWrite, usePrepareContractWrite, useContractRead, useSendTransaction } from "wagmi";
import { abiData, wrappedContractAddress } from "~/constants/wrappedWowenContract";


export const PairComponent = () => {


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

    return (
        <>
            <div className="text-white font-mono pt-4 text-xl flex gap-12 justify-center">
                <div> {balancedData?.formatted.slice(0, 6)} {balancedData?.symbol} </div>  Available Token Pairs <div >{balWW?.toString().slice(0, 6)} WWOW</div>
            </div>
            <div className="flex justify-center mt-4 ">
                <div className="w-[50vw] rounded-xl h-48 text-center border-white border-4">

                </div>
            </div>
        </>
    )
}