import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'
import PhraseInContextEditorPostProcessor from 'i18next-phrase-in-context-editor-post-processor';

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
  .use(new PhraseInContextEditorPostProcessor({
    phraseEnabled: true,
    projectId: '17f324bbfe765c545c64cc2ecaef68a4',
    datacenter: 'us',
    useOldICE: false,
    accountId: '363e9b7cebbe96b4369fba71f3dff700',
    prefix: '{{__phrase_',
    suffix: '__}}',
  }))
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
    postProcess: ['phraseInContextEditor']
  })
