import Link from "next/link";
import { redirect } from "next/navigation";

export default function HomePage() {
  redirect("/docs");
  return (
    <main className="h-screen flex flex-col text-center justify-center">
      <h1 className="text-2xl font-bold mb-4">welcome to sui record</h1>
      <p className="text-muted-foreground">
        You can open
        <Link href="/docs" className="text-foreground font-semibold underline">
          /docs
        </Link>
        and see the documentation.
      </p>
    </main>
  );
}
