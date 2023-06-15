
import { readContract } from '@wagmi/core'
import { abiData, wrappedContractAddress } from '~/constants/wrappedWowenContract'
import { useContractRead } from 'wagmi'



export const getData = async (add:any):Promise<any> => {
    
    const data = await readContract({
        address: wrappedContractAddress,
        abi: abiData,
        functionName: "balanceOf",
        args: [add],
      })

      return data
}


 
// export function AppData() {
//   const { data, isError, isLoading } = useContractRead({
//     address: wrappedContractAddress,
//     abi: abiData,
//     functionName: 'balanceOf',
//     onSuccess: (data) => {
//       console.log(data, "data usw");
//     },
//   })
//   return data
// }











