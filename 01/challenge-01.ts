import { readFileSync } from 'node:fs'

function decoder (input: string): string {
  const words = input.split(' ')
  const cache: Record<string, number> = {}
  const order: string[] = []
  for (const word of words) {
    if (word.length === 0) continue
    const lowerCaseWord = word.toLowerCase()
    if (cache[lowerCaseWord] === undefined) {
      cache[lowerCaseWord] = 0
      order.push(lowerCaseWord)
    }
    cache[lowerCaseWord]++
  }
  return order.reduce((acc, word) => {
    return `${acc}${word}${cache[word]}`
  }, '')
}

function main (): void {
  console.log('Challenge #1')
  const file = readFileSync('./01/in').toString().replace(/(\r\n|\n|\r)/gm, ' ')
  const result = decoder(file)
  console.log(result)
}

main()
