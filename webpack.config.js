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
        main: "./includes/assets/js/main.js",
        admin: "./includes/assets/js/admin.js",
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
                        // "lib/freemius/**/*",
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
                    ],
                },

                // {
                //     from: path.resolve(__dirname, "languages") + "/**",
                //     to: buildFolder
                // },

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
                archive: [
                    {
                        source: "./artifacts/dist",
                        destination: "./starcat-review.zip",
                    },
                    {
                        source: "./includes/lib/cpt-addon",
                        destination: "./starcat-review-cpt.zip",
                    },
                    {
                        source: "./includes/lib/ct-addon",
                        destination: "./starcat-review-ct.zip",
                    },
                    {
                        source: "./includes/lib/photo-reviews-addon",
                        destination: "./starcat-review-photo-reviews.zip",
                    }
                ],
            },
        })
    );

    // webpackConfig.output.path = buildFolder + "/assets";
}

module.exports = webpackConfig;
