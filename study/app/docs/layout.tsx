import Link from "next/link";
import Image from "next/image";
import dynamic from "next/dynamic";

import { tree } from "../source";
import { DocsLayout } from "next-docs-ui/layout";

import img from "public/img.jpg";
import sui from "public/sui.svg";

import type { ReactNode } from "react";

export default function RootDocsLayout({ children }: { children: ReactNode }) {
  const Title = dynamic(() => import("../_components/title"), { ssr: false });
  return (
    <DocsLayout
      tree={tree}
      nav={{ enabled: false }}
      sidebar={{
        defaultOpenLevel: 0,
        collapsible: false,
        banner: (
          <div className="flex flex-row gap-2 items-center p-2 -mt-2 rounded-lg text-card-foreground transition-colors mb-2">
            <Link href="https://github.com/movefuns/SuiStartrek">
              <Image
                alt="img"
                src={img}
                blurDataURL={img.blurDataURL}
                className="w-10 h-10 p-1 rounded-lg text-primary dark:hidden shadow"
              />
              <Image
                alt="sui"
                src={sui}
                blurDataURL={sui.blurDataURL}
                className="w-10 h-10 p-1 rounded-lg text-primary hidden dark:block"
              />
            </Link>
            <div className="flex flex-col">
              <p className="font-bold text-base italic">
                birch's learning record
              </p>
              <p className="text-xs text-foreground">Wechat:&nbsp;birchwork</p>
            </div>
          </div>
        ),
      }}
    >
      {children}
    </DocsLayout>
  );
}
