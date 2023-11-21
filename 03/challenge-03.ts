import { readFileSync } from 'node:fs'

function isValidKey (key: string, min: number, max: number, char: string): boolean {
  const count = key.split('').filter(ch => ch === char).length
  return count >= min && count <= max
}

function main (): void {
  console.log('Challenge #3')
  const file = readFileSync('./03/in').toString()
  const lines = file.split('\n')
  lines.pop()
  const validKeys = lines.filter((line, index) => {
    const [policy, key] = line.split(':')
    const [minMax, char] = policy.split(' ')
    const [min, max] = minMax.split('-').map(Number)
    const isValid = isValidKey(key, min, max, char)
    return !isValid
  })
  console.log(`Unvalid key #42: ${validKeys[41]}`)
}

main()
