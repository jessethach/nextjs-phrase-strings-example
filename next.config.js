/** @type {import('next').NextConfig} */

const i18n = {
    defaultLocale: 'en-US',
    // Source of truth for the list of languages supported by the application. Other tools (i18next, Storybook, tests) reference this.
    // These must be BCP47 language tags: https://en.wikipedia.org/wiki/IETF_language_tag#List_of_common_primary_language_subtags
    locales: ['en-US', 'es-US'],
}

const nextConfig = {
    i18n,
    transpilePackages: [
        // https://github.com/i18next/i18next/issues/1948
        'i18next',
        'react-i18next',
    ],
};

module.exports = nextConfig;
