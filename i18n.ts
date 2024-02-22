import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'

import en_US from './public/static/locales/en-US'
import es_US from './public/static/locales/es-US'

export type I18nNamespace = keyof typeof en_US

export const defaultNS = 'home' as const
export const resources = {
  'en-US': en_US,
  'es-US': es_US,
} as const

export const namespaces: Readonly<Array<I18nNamespace>> = [
  'auth',
  'home',
] as const

i18n
  .use(initReactI18next)
  .init({
    fallbackLng: 'en-US',
    ns: namespaces,
    defaultNS: 'home',
    debug: true,
    supportedLngs: ['en-US', 'es-US'],
    load: 'currentOnly',
    interpolation: {
      escapeValue: false, // not needed for react as it escapes by default
    },
    resources,
  })
