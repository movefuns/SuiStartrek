const alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

export function randomAlphabet(str: string): string {
  const randomAlphabet =
    alphabets[Math.floor(Math.random() * alphabets.length)];

  return str === " " ? " " : randomAlphabet ?? "";
}
