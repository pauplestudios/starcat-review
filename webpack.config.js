const path = require("path");
const webpack = require("webpack");
// const BrowserSyncPlugin = require("browser-sync-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const CleanWebpackPlugin = require("clean-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");

const FileManagerPlugin = require("filemanager-webpack-plugin");

// const config = require("./config.json");

const webpackConfig = {
  entry: {
    main: "./includes/assets/js/main.js",
    admin: "./includes/assets/js/admin.js"
  },
  output: {
    filename: "[name].bundle.js",
    path: path.resolve(__dirname, "app/assets"),
    publicPath: "./"
  },

  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loaders: ["babel-loader"]
      },
      {
        test: /\.css$/i,
        use: [MiniCssExtractPlugin.loader, "css-loader"]
      },
      {
        test: /\.scss$/i,
        exclude: /node_modules/,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          "resolve-url-loader",
          "sass-loader"
        ]
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: ["file-loader"]
      }
    ]
  },
  devtool: "source-map",
  plugins: [
    new webpack.DefinePlugin({
      "process.env.NODE_ENV": "'development'"
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
      filename: "[name].bundle.css"
      // allChunks: true
    })
  ]
};

if (process.env.NODE_ENV === "production" || process.env.NODE_ENV === "test") {
  const buildFolder = path.resolve(__dirname, "helpie-reviews-build");
  webpackConfig.plugins.push(
    new UglifyJsPlugin({
      cache: true,
      parallel: true,
      uglifyOptions: {
        compress: {
          drop_console: true
        },
        ecma: 6,
        mangle: true
      },
      sourceMap: true
    })
  );

  webpackConfig.plugins.push(new CleanWebpackPlugin([buildFolder]));

  webpackConfig.plugins.push(
    new CopyWebpackPlugin(
      [
        {
          from: path.resolve(__dirname, "assets") + "/*.css",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "assets") + "/*.js",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "assets") + "/**/*.png",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "assets") + "/**/*.jpg",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "features") + "/**",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "languages") + "/**",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "includes") + "/**",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "lib") + "/**",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "utils") + "/**",
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "*.php"),
          to: buildFolder
        },
        {
          from: path.resolve(__dirname, "*.txt"),
          to: buildFolder
        }
      ],
      {
        // By default, we only copy modified files during
        // a watch or webpack-dev-server build. Setting this
        // to `true` copies all files.
        copyUnmodified: true
      }
    )
  );

  webpackConfig.plugins.push(
    new FileManagerPlugin({
      onEnd: {
        archive: [
          {
            source: "./helpie-reviews-build",
            destination: "./helpie-reviews.zip"
          }
        ]
      }
    })
  );

  // webpackConfig.output.path = buildFolder + "/assets";
}

module.exports = webpackConfig;
