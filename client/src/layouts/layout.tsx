
import { type ReactNode } from 'react';
import { CustomConnectButton } from '~/components/connect-button';
import img from '../../public/defiWoWLogoP.png'
import Image from 'next/image'


export default function Layout({ children }: { children: ReactNode }) {
	return (
		<>
			<nav className="block w-full px-8 sticky top-0 z-10 py-5 lg:px-16 lg:py-7 max-w-full bg-gradient-to-b text-rtm-white font-semibold rounded-none">
				<div className="relative w-auto h-fit flex items-center">
					<a className=" lg:block cursor-pointer active" href="" aria-current="page">
						<Image
							src={img}
							width={40}
							height={40}
							alt="Picture of the author"
						/>
					</a>

					<div className="left-0">
						<button className="relative align-middle select-none font-sans font-medium text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none w-12 max-w-[48px] h-12 max-h-[48px] rounded-lg text-sm text-blue-500 active:bg-blue-500/30 mr-2 lg:hidden hover:bg-rtm-green-400" type="button">
							<span className="absolute top-1/2 left-1/2 transform -translate-y-1/2 -translate-x-1/2">
								<svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" className="svg-inline--fa fa-bars fa-2xl text-rtm-green-300" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
									<path fill="currentColor" d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
									</path>
								</svg>
							</span>
						</button>
					</div>
					<div className="flex items-center float-right ml-auto">



						<CustomConnectButton />
					</div>
				</div>
			</nav>

			{children}


<footer className="fixed bottom-0 left-0 z-20 w-full p-4 shadow md:flex md:items-center md:justify-between md:p-6 bg-transparent">

    {/* <span className="text-sm text-gray-500 sm:text-center dark:text-gray-400"> 2023 <a href="https://www.wowen.io/" className="hover:underline">WoWen Defi</a>.
	</span> */}

          {/*
              <a href="#" className="text-gray-500 hover:text-gray-900 dark:hover:text-white">
			  <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" /></svg>
			  <span className="sr-only">Twitter page</span>
			</a> */}
            

			<a href="#" className="text-gray-500 hover:text-gray-900 dark:hover:text-white">
				<svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path fillRule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clipRule="evenodd" /></svg>
				<span className="sr-only">GitHub account</span>

			</a>
</footer>

		</>
	);
}