// craco.config.js
module.exports = {
    webpack: {
        configure: (webpackConfig) => {
            webpackConfig.resolve.alias = {
                ...webpackConfig.resolve.alias,
                'react-router-dom': require.resolve('react-router-dom'),
            };
            return webpackConfig;
        },
    },
};
