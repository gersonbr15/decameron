import { isEmpty, isEmptyArray, isNullOrUndefined } from './index'

// 👉 Validador de Requerido
export const requiredValidator = (value: unknown) => {
  if (isNullOrUndefined(value) || isEmptyArray(value) || value === false)
    return 'Este campo es requerido'

  return !!String(value).trim().length || 'Este campo es requerido'
}

// 👉 Validador de Email
export const emailValidator = (value: unknown) => {
  if (isEmpty(value))
    return true

  const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

  if (Array.isArray(value))
    return value.every(val => re.test(String(val))) || 'El campo de correo electrónico debe ser un correo electrónico válido'

  return re.test(String(value)) || 'El campo de correo electrónico debe ser un correo electrónico válido'
}

// 👉 Validador de Contraseña
export const passwordValidator = (password: string) => {
  const regExp = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%&*()]).{8,}/

  const validPassword = regExp.test(password)

  return (
    // eslint-disable-next-line operator-linebreak
    validPassword ||
    'La contraseña debe contener al menos una letra mayúscula, una minúscula, un carácter especial y un dígito, con un mínimo de 8 caracteres'
  )
}

// 👉 Validador de Confirmación de Contraseña
export const confirmedValidator = (value: string, target: string) =>

  value === target || 'La confirmación de la contraseña no coincide'

// 👉 Validador de Rango
export const betweenValidator = (value: unknown, min: number, max: number) => {
  const valueAsNumber = Number(value)

  return (Number(min) <= valueAsNumber && Number(max) >= valueAsNumber) || `Introduce un número entre ${min} y ${max}`
}

// 👉 Validador de Enteros
export const integerValidator = (value: unknown) => {
  if (isEmpty(value))
    return true

  if (Array.isArray(value))
    return value.every(val => /^-?[0-9]+$/.test(String(val))) || 'Este campo debe ser un número entero'

  return /^-?[0-9]+$/.test(String(value)) || 'Este campo debe ser un número entero'
}

// 👉 Validador de Expresión Regular
export const regexValidator = (value: unknown, regex: RegExp | string): string | boolean => {
  if (isEmpty(value))
    return true

  let regeX = regex
  if (typeof regeX === 'string')
    regeX = new RegExp(regeX)

  if (Array.isArray(value))
    return value.every(val => regexValidator(val, regeX))

  return regeX.test(String(value)) || 'El formato del campo es inválido'
}

// 👉 Validador de Solo Letras
export const alphaValidator = (value: unknown) => {
  if (isEmpty(value))
    return true

  return /^[A-Z]*$/i.test(String(value)) || 'El campo solo puede contener caracteres alfabéticos'
}

// 👉 Validador de URL
export const urlValidator = (value: unknown) => {
  if (isEmpty(value))
    return true

  const re = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/

  return re.test(String(value)) || 'La URL es inválida'
}

// 👉 Validador de Longitud
export const lengthValidator = (value: unknown, length: number) => {
  if (isEmpty(value))
    return true

  return String(value).length === length || `El campo debe tener al menos ${length} caracteres`
}

// 👉 Validador de Solo Letras, Números, Guiones y Guiones Bajos
export const alphaDashValidator = (value: unknown) => {
  if (isEmpty(value))
    return true

  const valueAsString = String(value)

  return /^[0-9A-Z_-]*$/i.test(valueAsString) || 'El campo solo puede contener letras, números, guiones y guiones bajos'
}
