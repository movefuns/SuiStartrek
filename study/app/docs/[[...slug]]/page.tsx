import { getPage, getPageUrl, tree } from "@/app/source";
import { allDocs } from "contentlayer/generated";
import type { Metadata } from "next";
import { MDXContent } from "next-docs-ui/mdx";
import { DocsPage } from "next-docs-ui/page";
import {
  findNeighbour,
  getGitLastEditTime,
  getTableOfContents,
} from "next-docs-zeta/server";
import { notFound } from "next/navigation";
import { Content } from "./content";
import { ExternalLinkIcon } from "lucide-react";

export default async function Page({
  params,
}: {
  params: { slug?: string[] };
}) {
  const page = getPage(params.slug);

  if (page == null) {
    notFound();
  }

  const toc = await getTableOfContents(page.body.raw);
  const neighbour = findNeighbour(tree, getPageUrl(params.slug));

  const time = await getGitLastEditTime(
    "birchwork/SuiStartrek-birch",
    "apps/docs/content/" + page._raw.sourceFilePath
  );

  return (
    <DocsPage
      toc={toc}
      footer={neighbour}
      lastUpdate={time}
      tableOfContent={{
        footer: (
          <a
            href={`https://github.com/birchwork/SuiStartrek-birch/tree/main/study/content/docs/${page._raw.sourceFilePath}`}
            rel="noreferrer noopener"
            target="_blank"
            className="inline-flex items-center text-xs text-muted-foreground hover:text-accent-foreground"
          >
            在 Github 上編輯此頁面 <ExternalLinkIcon className="ml-2 h-3 w-3" />
          </a>
        ),
      }}
    >
      <MDXContent>
        <h1 className="">
          {page.title === "Quick start" ? page.description : page.title}
        </h1>
        <Content code={page.body.code} />
      </MDXContent>
    </DocsPage>
  );
}

export async function generateStaticParams(): Promise<{ slug: string[] }[]> {
  return allDocs.map((page) => ({
    slug: page.slug.split("/"),
  }));
}

export function generateMetadata({ params }: { params: { slug?: string[] } }) {
  const page = getPage(params.slug);

  if (page == null) notFound();

  return {
    title: page.title,
    description: page.description,
  } satisfies Metadata;
}
