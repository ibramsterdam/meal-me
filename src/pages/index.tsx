import type { NextPage } from "next";
import Head from "next/head";
import { trpc } from "../utils/trpc";
import { Transition } from "@headlessui/react";
import { Fragment, useState } from "react";

const delay = (ms: number) => new Promise((res) => setTimeout(res, ms));

const Home: NextPage = () => {
  const result = trpc.useQuery(["meal.getAll"]);

  if (result.isLoading) return null;

  return (
    <>
      <Head>
        <title>Find a meal</title>
        <meta name='description' content='Generated by create-t3-app' />
        <link rel='icon' href='/favicon.svg' type='image/svg+xml' />
      </Head>

      <main className='container mx-auto flex flex-col items-center justify-center min-h-screen p-4'>
        <h1 className='text-5xl md:text-[5rem] leading-normal font-extrabold text-gray-700'>
          Give Me <span className='text-red-300'>Protein</span> Meals!
        </h1>
        <p className='text-2xl text-gray-700'>Made with care by Bram :-) </p>
        <GetMeal meals={result.data} />
      </main>
    </>
  );
};

const GetMeal = ({ meals }: any) => {
  const [isShowing, setIsShowing] = useState(true);
  const [index, setIndex] = useState(Math.floor(Math.random() * meals.length));

  if (meals.length < 1) return null;

  return (
    <div className='flex flex-col items-center py-8 '>
      <div className='h-[450px] w-80'>
        <div>
          <Transition
            as={Fragment}
            show={isShowing}
            enter='transform transition duration-[400ms]'
            enterFrom='opacity-0 rotate-[-120deg] scale-50'
            enterTo='opacity-100 rotate-0 scale-100'
            leave='transform duration-200 transition ease-in-out'
            leaveFrom='opacity-100 rotate-0 scale-100 '
            leaveTo='opacity-0 scale-95 '
          >
            <div className='h-full w-full rounded-md bg-red-300 shadow-lg p-3'>
              <p className='text-center text-2xl font-bold text-gray-700'>
                {meals[index].name}
              </p>
              <p className='text-center text-gray-700'>
                {meals[index].description}
              </p>
              <p className='text-left text-gray-700 pt-2'>
                <span className='font-bold'>Nutritional values</span>
                <br />
                Calories: {meals[index].calories}g
                <br />
                Protein: {meals[index].protein}g
                <br />
                Carb: {meals[index].carbohydrate}g
                <br />
                Fat: {meals[index].fat}g
              </p>

              <p className='text-left text-gray-700 pt-2'>
                <span className='font-bold'>Ingredients</span>
              </p>
              {meals[index].ingredients.map((element: any) => {
                return (
                  <button
                    key={element.id}
                    className='inline-flex justify-center rounded-md border border-transparent shadow-sm m-1 p-1 bg-red-400 text-base font-medium text-white hover:bg-red-500 ml-1 w-auto text-xs'
                  >
                    {element.name} {element.weight}g
                  </button>
                );
              })}
            </div>
          </Transition>
        </div>
      </div>
      <button
        onClick={async () => {
          setIsShowing(false);

          await delay(500);
          setIndex(Math.floor(Math.random() * meals.length));
          setIsShowing(true);
        }}
        className='backface-visibility-hidden mt-8 flex transform items-center rounded-full bg-black bg-opacity-40 px-3 py-2 text-sm font-medium text-white transition hover:scale-105 hover:bg-opacity-30 focus:outline-none active:bg-opacity-40'
      >
        <svg viewBox='0 0 20 20' fill='none' className='h-5 w-5 opacity-70'>
          <path
            d='M14.9497 14.9498C12.2161 17.6835 7.78392 17.6835 5.05025 14.9498C2.31658 12.2162 2.31658 7.784 5.05025 5.05033C7.78392 2.31666 12.2161 2.31666 14.9497 5.05033C15.5333 5.63385 15.9922 6.29475 16.3266 7M16.9497 2L17 7H16.3266M12 7L16.3266 7'
            stroke='currentColor'
            strokeWidth='1.5'
          />
        </svg>
        <span className='ml-3 '>Ik heb honger !</span>
      </button>
    </div>
  );
};

export default Home;
