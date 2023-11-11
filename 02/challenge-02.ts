import { readFileSync } from 'node:fs'

function miniCompiler (instructions: string): string {
  let result: string = ''
  let current: number = 0;
  [...instructions].forEach((instruction: string) => {
    switch (instruction) {
      case '#':
        current++
        break
      case '@':
        current--
        break
      case '*':
        current *= current
        break
      case '&':
        result += String(current)
        break
    }
  })
  return result
}

function main (): void {
  console.log('Challenge #2')
  const file = readFileSync('./02/in').toString().replace(/(\r\n|\n|\r)/gm, ' ')
  const result = miniCompiler(file)
  console.log(result)
}

main()
