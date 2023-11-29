import { readFileSync } from 'node:fs'

function isReal (filename: string): boolean {
  const [id, checksum] = filename.split('-')
  const uniques = Array.from(id).filter((ch, index, arr) => arr.indexOf(ch) === arr.lastIndexOf(ch)).join('')
  return uniques === checksum
}

function main (): void {
  console.log('Challenge #4')
  const file = readFileSync('./04/in').toString()
  const lines = file.split('\n')
  lines.pop()
  const reals = lines.filter(isReal)
  console.log(`Real file #33 checksum: ${reals[32].split('-')[1]}`)
}

main()
