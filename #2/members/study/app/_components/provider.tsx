"use client";

import { usePathname } from "next/navigation";
import { GithubIcon } from "lucide-react";
import { Nav } from "next-docs-ui/nav";
import Title from "./title";
import { RootProvider } from "next-docs-ui/provider";

import type { ReactNode } from "react";

export function Provider({ children }: { children: ReactNode }) {
  const pathname = usePathname();

  return (
    <RootProvider>
      <Nav
        enableSidebar={pathname === "/docs" || pathname.startsWith("/docs/")}
        title={<Title />}
        links={[
          {
            href: "https://github.com/birchwork/SuiStartrek-birch",
            label: "Github",
            icon: <GithubIcon className="h-5 w-5" />,
            external: true,
          },
        ]}
      />
      {children}
    </RootProvider>
  );
}
