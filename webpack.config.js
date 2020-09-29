const path = require("path");
const webpack = require("webpack");
// const BrowserSyncPlugin = require("browser-sync-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const CleanWebpackPlugin = require("clean-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");
const TerserJsPlugin = require("terser-webpack-plugin");

const FileManagerPlugin = require("filemanager-webpack-plugin");

// const config = require("./config.json");

const webpackConfig = {
    entry: {
        admin: "./includes/assets/admin/admin.js",
        public: "./includes/assets/public/public.js",
    },
    output: {
        filename: "[name].bundle.js",
        path: path.resolve(__dirname, "includes/assets/bundle"),
        publicPath: "./",
    },
    externals: {
        list: "list",
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /node_modules/,
                loaders: ["babel-loader"],
            },
            {
                test: /\.css$/i,
                use: [MiniCssExtractPlugin.loader, "css-loader"],
            },
            {
                test: /\.scss$/i,
                exclude: /node_modules/,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader",
                    "resolve-url-loader",
                    "sass-loader",
                ],
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                use: ["file-loader"],
            },
        ],
    },
    devtool: "source-map",
    plugins: [
        new webpack.DefinePlugin({
            "process.env.NODE_ENV": "'development'",
        }),

        /* TODO: Disabled temporaryly to fix test */
        // new BrowserSyncPlugin({
        //     proxy: {
        //         target: config.proxyURL
        //     },
        //     files: ["**/*.php"],
        //     cors: true,
        //     reloadDelay: 0
        // }),
        new MiniCssExtractPlugin({
            // disable: false,
            filename: "[name].bundle.css",
            // allChunks: true
        }),
    ],
};

if (process.env.NODE_ENV === "production" || process.env.NODE_ENV === "test") {
    const buildFolder = path.resolve(__dirname, "artifacts/dist");
    webpackConfig.plugins.push(
        new TerserJsPlugin({
            cache: true,
            parallel: true,
            terserOptions: {
                compress: {
                    drop_console: true,
                },
                output: {
                    comments: false,
                },
                ecma: 6,
                mangle: true,
            },
            extractComments: false,
            sourceMap: true,
        })
    );

    webpackConfig.plugins.push(new CleanWebpackPlugin([buildFolder]));

    webpackConfig.plugins.push(
        new CopyWebpackPlugin(
            [
                {
                    from: path.resolve(__dirname, "app") + "/**",
                    to: buildFolder,
                },
                {
                    from: path.resolve(__dirname, "services") + "/**",
                    to: buildFolder,
                },
                {
                    from: path.resolve(__dirname, "features") + "/**",
                    to: buildFolder,
                },
                {
                    from: path.resolve(__dirname, "includes") + "/",
                    to: buildFolder + "/includes",
                    ignore: [
                        "*.zip",
                        "**/*.scss",
                        "**/*.md",
                        "**/*.yml",
                        "**/*.env",
                        "**/tests/**/*",
                        "**/sample/**/*",
                        "**/samples/**/*",
                        "assets/js/**/*",
                        "assets/styles/**/*",

                        "assets/vendors/semantic/src/**/*",
                        "assets/vendors/semantic/tasks/**/*",
                        "assets/vendors/semantic/bundle/components/**/*",
                        "assets/vendors/semantic/bundle/themes/basic/**/*",
                        "assets/vendors/semantic/bundle/themes/github/**/*",
                        "assets/vendors/semantic/bundle/themes/material/**/*",
                        "assets/vendors/semantic/bundle/semantic.css",
                        "assets/vendors/semantic/bundle/semantic.js",
                        "assets/vendors/semantic/gulpfile.js",

                        "assets/vendors/comparison-table/**/*",

                        // Ignore add-ons folders
                        "lib/ct-addon/**/*",
                        "lib/cpt-addon/**/*",
                        "lib/photo-reviews-addon/**/*",
                        "lib/starcat-review-woo-notify/**/*",
                    ],
                },

                {
                    from: path.resolve(__dirname, "languages") + "/**",
                    to: buildFolder
                },

                {
                    from: path.resolve(__dirname, "*.php"),
                    to: buildFolder,
                },
                {
                    from: path.resolve(__dirname, "*.txt"),
                    to: buildFolder,
                },
            ],
            {
                // By default, we only copy modified files during
                // a watch or webpack-dev-server build. Setting this
                // to `true` copies all files.
                copyUnmodified: true,
            }
        )
    );

    webpackConfig.plugins.push(
        new FileManagerPlugin({
            onEnd: {
                // copy addons via composer private packages 
                copy: [
                    {
                        source: "./vendor/pauple/starcat-review-cpt",
                        destination: "./artifacts/addons/starcat-review-cpt/",
                    },
                    {
                        source: "./vendor/pauple/starcat-review-ct",
                        destination: "./artifacts/addons/starcat-review-ct/",
                    },
                    {
                        source: "./vendor/pauple/starcat-review-woo-notify",
                        destination: "./artifacts/addons/starcat-review-woo-notify/",
                    },
                    {
                        source: "./vendor/pauple/starcat-review-photo-reviews",
                        destination: "./artifacts/addons/starcat-review-photo-reviews/",
                    }
                ],
                delete: [
                    // Delete files
                    './artifacts/addons/*/package.json',
                    './artifacts/addons/*/package-lock.json',
                    './artifacts/addons/*/composer.json',
                    // Delete file types
                    './artifacts/addons/*/*.zip',
                    './artifacts/addons/*/*.md',
                    './artifacts/addons/*/*.log',
                    './artifacts/addons/*/*.lock',
                    // Delete folder
                    './artifacts/addons/**/dist',
                    './artifacts/addons/**/vendor',
                    './artifacts/addons/**/node_modules',
                ],
                archive: [
                    {
                        source: "./artifacts/dist",
                        destination: "./starcat-review.zip",
                    },
                    {
                        source: "./artifacts/addons/starcat-review-cpt/",
                        destination: "./starcat-review-cpt.zip",
                    },
                    {
                        source: "./artifacts/addons/starcat-review-ct/",
                        destination: "./starcat-review-ct.zip",
                    },
                    {
                        source: "./artifacts/addons/starcat-review-woo-notify/",
                        destination: "./starcat-review-woo-notify.zip",
                    },
                    {
                        source: "./artifacts/addons/starcat-review-photo-reviews/",
                        destination: "./starcat-review-photo-reviews.zip",
                    }
                ],
            },
        })
    );

    // webpackConfig.output.path = buildFolder + "/assets";
}

module.exports = webpackConfig;
