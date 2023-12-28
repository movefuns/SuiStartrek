import { Inter } from "next/font/google";
import { Provider } from "./_components/provider";

import "./global.css";
import "next-docs-ui/style.css";

import type { ReactNode } from "react";

const inter = Inter({
  subsets: ["latin"],
});

export default function Layout({ children }: { children: ReactNode }) {
  return (
    <html lang="en" className={inter.className}>
      <body>
        <Provider>{children}</Provider>
      </body>
    </html>
  );
}
