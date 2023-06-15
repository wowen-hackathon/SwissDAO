"use client"
import { useState } from 'react'
import { Tab } from '@headlessui/react'
import {  Wrap } from './Wrap'


function classNames(...classes: any) {
    return classes.filter(Boolean).join(' ')
}

export const Tabs = () => {

    return (
        <div className="w-full pt-4 sm:px-12">
            <Tab.Group >
                <Tab.List className="space-x-1  rounded-xl bg-blue-900/20 p-1">
                    <div className='w-full flex justify-center sm:p-12' >
                        <div className='flex w-full md:w-[400px] justify-center gap-1 sm:gap-8 '>

                            <Tab className={({ selected }) =>
                                classNames(
                                    'w-full flex text-gray-100 justify-center transition duration-200 ease-in-out transform  py-2 border-b-4 border-gray-500 hover:border-b-4 bg-gradient-to-t from-gray-400  via-gray-600 to-gray-200 rounded-2xl ',

                                    selected
                                        ? 'bg-black shadow shadow-black border-blue outline-black'
                                        : 'text-blue hover:bg-white/[0.12] hover:text-black'
                                )
                            }>
                                Wrap
                            </Tab>
                            <Tab className={({ selected }) =>
                                classNames(
                                    'w-full flex text-gray-100 justify-center transition duration-200 ease-in-out transform  py-2 border-b-4 border-gray-500 hover:border-b-4 bg-gradient-to-t from-gray-400 via-gray-600 to-gray-200  rounded-2xl ',
                                    selected
                                        ? 'bg-black shadow border-blue outline-black'
                                        : 'text-blue hover:bg-black hover:text-black'
                                )
                            }>
                                Pairs
                            </Tab>
                            <Tab className={({ selected }) =>
                                classNames(
                                    'w-full flex text-gray-100 justify-center transition duration-200 ease-in-out transform  py-2 border-b-4 border-gray-500 hover:border-b-4 bg-gradient-to-t from-gray-400 via-gray-600 to-gray-200 rounded-2xl ',

                                    selected
                                        ? 'bg-black shadow-black  border-blue outline-black'
                                        : 'text-blue hover:bg-white/[0.12] hover:text-black'
                                )
                            }>
                                Token Factory
                            </Tab>
                        </div>
                    </div>
                </Tab.List>
                <Tab.Panels className="w-full flex justify-center">
                    <Tab.Panel className="h-[90vw] sm:h-[60vw] md:h-[28vw] bg-black w-[70%] rounded-3xl text-white p-2" >
                        <Wrap />
                    </Tab.Panel>
                    <Tab.Panel className="h-[90vw] sm:h-[60vw] md:h-[44vw] bg-black w-[70%] rounded-3xl text-white p-2"></Tab.Panel>
                    <Tab.Panel className="h-[90vw] sm:h-[60vw] md:h-[18vw] bg-black w-[70%] rounded-3xl text-white p-2"></Tab.Panel>


                </Tab.Panels>
            </Tab.Group>
        </div>

    )
}
