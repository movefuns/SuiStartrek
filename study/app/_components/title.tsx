"use client";

import React from "react";
import { motion } from "framer-motion";
import { randomAlphabet } from "@/lib/utils";

const introduction = {
  iam: "SuiStartrek-birch",
};

export default function Title() {
  const [iam, setIam] = React.useState(introduction.iam);
  React.useEffect(() => {
    let iterations = 0;

    const intervalKey = setInterval(() => {
      if (iterations < Math.max(introduction.iam.length)) iterations += 1 / 4.5;
      else {
        clearInterval(intervalKey);
      }
      setIam((prev) =>
        prev
          .split("")
          .map((char, index) =>
            index < iterations ? introduction.iam[index] : randomAlphabet(char)
          )
          .join("")
      );
    }, 30);

    return () => clearInterval(intervalKey);
  }, []);
  return (
    <div className="flex items-center gap-2">
      <motion.div
        initial={{ x: -10 }}
        animate={{ x: 0 }}
        transition={{ type: "spring", stiffness: 90 }}
        className="flex cursor-pointer items-center"
      >
        <svg
          className="slg:w-12 w-9 text-black dark:text-gray-300"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
          xmlns="http://www.w3.org/2000/svg"
        >
          <motion.path
            initial={{ pathLength: 0 }}
            animate={{
              pathLength: 1,
              transition: { delay: 1.6, duration: 1.2 },
            }}
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M8 9l3 3-3 3m5 0h3M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
          ></motion.path>
        </svg>
        <h3 className="ml-2 text-xl font-semibold tracking-wide capitalize text-black dark:text-gray-300 lg:text-xl">
          {iam}
        </h3>
      </motion.div>
    </div>
  );
}
