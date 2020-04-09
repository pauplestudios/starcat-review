jQuery(document).ready(function($) {
    console.log("comparison table");

    function productsTable(element) {
        this.element = element;
        this.table = this.element.children(".cd-products-table");
        this.features = this.table.find(".features");
        this.featuresWidth = this.features.width();
        this.featureItems = this.features.find("#scr-stats-list");
        this.tableHeight = this.table.height();
        this.productsWrapper = this.table.children(".cd-products-wrapper");
        this.tableColumns = this.productsWrapper.children(
            ".cd-products-columns"
        );
        this.tableColumns.css('margin-left',this.featuresWidth+'px');
        this.products = this.tableColumns.children(".product");
        this.productsNumber = this.products.length;
        this.productWidth = this.products.eq(0).width();
        this.productsTopInfo = this.table.find(".top-info");        
        this.singleProductTopInfo = this.products.find(".top-info");
        this.productCloseBtn = this.singleProductTopInfo.find(".close-product");
        // this.searchContainer = this.productsTopInfo.find(".ui.search");
        // this.searchContainer = this.productSearchContainer();
        this.featuresTopInfo = this.table
            .children(".features")
            .children(".top-info");
        this.features = this.table.find(".features");
        this.featuresColumn = this.features.find(".cd-features-list");
        this.topInfoHeight = this.featuresTopInfo.innerHeight() + 30;
        this.leftScrolling = false;
        this.filterBtn = this.element.find(".filter");
        this.resetBtn = this.element.find(".reset");
        (this.filtering = false), (this.selectedproductsNumber = 0);
        this.filterActive = false;
        this.navigation = this.table.children(".cd-table-navigation");
        this.productsTopHeights = this.table.find('.top-info').map(function(){ return $(this).outerHeight(true); }).get();
        this.productsMaxHeight = Math.max.apply(null,this.productsTopHeights);
        this.productsTopInfo.css('height',this.productsMaxHeight+'px');
        // bind table events
        this.bindEvents();
    }

    productsTable.prototype.bindEvents = function() {
        var self = this;
        //detect scroll left inside producst table
        self.productsWrapper.on("scroll", function() {
            if (!self.leftScrolling) {
                self.leftScrolling = true;
                !window.requestAnimationFrame
                    ? setTimeout(function() {
                          self.updateLeftScrolling();
                      }, 250)
                    : window.requestAnimationFrame(function() {
                          self.updateLeftScrolling();
                      });
            }
        });
        //select single product to filter
        self.products.off().on("click", ".top-info", function(e) {
            // e.stopPropagation();
            var product = $(this).parents(".product");

            if (product.hasClass("scr-search-filter-wrapper")) {
                return true;
            } else {
                if (!self.filtering && product.hasClass("selected")) {
                    product.removeClass("selected");
                    self.selectedproductsNumber =
                        self.selectedproductsNumber - 1;
                    self.upadteFilterBtn();
                } else if (!self.filtering && !product.hasClass("selected")) {
                    product.addClass("selected");
                    self.selectedproductsNumber =
                        self.selectedproductsNumber + 1;
                    self.upadteFilterBtn();
                }
            }
        });
        //filter products
        self.filterBtn.on("click", function(event) {
            event.preventDefault();
            if (self.filterActive) {
                self.filtering = true;
                self.showSelection();
                self.filterActive = false;
                self.filterBtn.removeClass("active");
            }
        });
        //reset product selection
        self.resetBtn.on("click", function(event) {
            event.preventDefault();

            if (self.filtering) {
                self.filtering = false;
                self.resetSelection();
            } else {
                self.products.removeClass("selected");
            }
            self.selectedproductsNumber = 0;
            self.upadteFilterBtn();
        });

        //scroll inside products table
        this.navigation.on("click", "a", function(event) {
            event.preventDefault();
            self.updateSlider($(event.target).hasClass("next"));
        });

        //New Product Close Event
        self.products.on("click", ".top-info .close-product", function(event) {
            event.stopPropagation();
            var that = self;
            var product = $(this).closest(".product");
            product.remove();
            var products = self.tableColumns.children(".product");
            self.products = [];
            self.products = products;
            noOfProducts = self.products.length;
            self.productsNumber = noOfProducts;
            self.productWidth = self.products.eq(0).width();
            self.productsTopInfo = self.table.find(".top-info");
            that.bindEvents();
            self.updateProductTable();
        });

        //Add Search Product
        var search_data = {
            action: "scr_search_posts",
            nonce: scr_ajax.ajax_nonce,
        };

        $.post(scr_ajax.ajax_url, search_data, function(results) {
            results = JSON.parse(results);
            $(".ui.search.scr-product-search").search({
                source: results,
                onSelect: function(result) {
                    var that = self;
                    console.log("get product element");
                    // debugger;
                    console.log(result);
                    var productContent = self.productElement(result);

                    $(".scr-search-filter-wrapper").before(productContent);
                    // self.refreshProductTable();
                    var products = self.tableColumns.children(".product");
                    self.products = [];
                    self.products = products;
                    noOfProducts = self.products.length;
                    self.productsNumber = noOfProducts;
                    self.productWidth = self.products.eq(0).width();
                    self.productsTopInfo = self.table.find(".top-info");
                    that.bindEvents();
                    self.updateProductTable();
                },
                onResultsClose: function() {
                    //Select After callback function
                    //Clear search query
                    console.log("closed");
                },
                onResultsAdd: function(html) {},
            });
        });
    };

    //create Product Items
    productsTable.prototype.productElement = function(args) {
        var self = this;

        var content = "";
        content += "<div class='product scr-ct-products'>";
        content += "<div class='top-info'>";
        content += "<div class='close-product'>";
        content +=
           "<i class='window close outline icon' style='font-size:25px;'></i>";
        content += "</div>";
        content += "<div class='check'></div>";
        if (args.image_url === "undefined" || args.image_url == null) {
            content += "";
        } else {
            content +=
                '<img class="featured-image scr-ct-product-img" src="' + args.image_url + '">';
        }
        content += '<h3 class="scr-ct-title">' + args.title + '</h3></div>';
        content += '<ul class="cd-features-list scr-ct-product-stats">';
        content += self.createSCRProductStatList(args);
        content += "</ul>";
        // content += "</li>";

        content += "</div>";

        return content;
    };

    productsTable.prototype.refreshProductTable = function() {
        console.log("reloading scr ct ");
        var self = this;

        var scr_stat_table_column = self.getSCRTableColumns();
        var productInfos = self.table.find(".top-info");
        lastIndex = productInfos.length - 1;

        productInfos.each(function(index) {
            if (index != 0 && index != lastIndex) {
                //Parent ul.cd-features-list
                var $parentElement = $(this).next();
                var $parentProduct = $(this).closest(".product");
                var singleProductStats = [];
                $parentProduct.find("ul.cd-features-list li").each(function() {
                    if (
                        $(this).data("stat") !== undefined &&
                        $(this).data("stat") !== "undefined"
                    ) {
                        dataStat = $(this)
                            .attr("data-stat")
                            .trim();
                        singleProductStats.push(dataStat);
                    }
                });

                for (var i = 0; i < scr_stat_table_column.length; i++) {
                    table_stat_name = scr_stat_table_column[i];
                    if ($.inArray(table_stat_name, singleProductStats) != -1) {
                    } else {
                        content = "";
                        content =
                            '<li data-stat="' + table_stat_name + '">X</li>';
                        $parentElement.append(content);
                    }
                }
            }
        });
    };

    productsTable.prototype.createSCRProductStatList = function(args) {
        var self = this;
        console.log("this stat list ");
        get_user_stats = args.user_stats;
        overall_stat = args.get_overall_stat;
        rating_view = overall_stat.dom;
        stat_list = get_user_stats.review_stats;
        var content = "";
        for (let key in stat_list) {
            if (stat_list.hasOwnProperty(key)) {
                if (key === "scr_ct_ratings") {
                    content += "<li class='scr-ct-ratings'>";
                    content += rating_view;
                    content += "</li>";
                } else {
                    content += "<li>";
                    content +=
                        stat_list[key].rating == 0
                            ? "X"
                            : stat_list[key].rating;
                    content += "</li>";
                }
            }
        }
        return content;
    };

    //get SCR CT feature columns
    productsTable.prototype.getSCRTableColumns = function() {
        var self = this;
        var scr_ct_feature_columns = [];
        if (self.featureItems.find("li").length > 0) {
            self.featureItems.find("li").each(function() {
                scr_ct_feature_columns.push(
                    $(this)
                        .text()
                        .trim()
                );
            });
        }
        return scr_ct_feature_columns;
    };

    productsTable.prototype.upadteFilterBtn = function() {
        //show/hide filter btn
        if (this.selectedproductsNumber >= 2) {
            this.filterActive = true;
            this.filterBtn.addClass("active");
        } else {
            this.filterActive = false;
            this.filterBtn.removeClass("active");
        }
    };

    productsTable.prototype.updateLeftScrolling = function() {
        var totalTableWidth = parseInt(
                this.tableColumns.eq(0).outerWidth(true)
            ),
            tableViewport = parseInt(this.element.width()),
            scrollLeft = this.productsWrapper.scrollLeft();

        scrollLeft > 0
            ? this.table.addClass("scrolling")
            : this.table.removeClass("scrolling");

        if (this.table.hasClass("top-fixed") && checkMQ() == "desktop") {
            setTranformX(this.productsTopInfo, "-" + scrollLeft);
            setTranformX(this.featuresTopInfo, "0");
        }

        this.leftScrolling = false;

        this.updateNavigationVisibility(scrollLeft);
    };

    productsTable.prototype.updateNavigationVisibility = function(scrollLeft) {
        scrollLeft > 0
            ? this.navigation.find(".prev").removeClass("inactive")
            : this.navigation.find(".prev").addClass("inactive");
        scrollLeft <
            this.tableColumns.outerWidth(true) - this.productsWrapper.width() &&
        this.tableColumns.outerWidth(true) > this.productsWrapper.width()
            ? this.navigation.find(".next").removeClass("inactive")
            : this.navigation.find(".next").addClass("inactive");
    };

    productsTable.prototype.updateTopScrolling = function(scrollTop) {
        var offsetTop = this.table.offset().top,
            tableScrollLeft = this.productsWrapper.scrollLeft();

        if (
            offsetTop <= scrollTop &&
            offsetTop + this.tableHeight - this.topInfoHeight >= scrollTop
        ) {
            //fix products top-info && arrows navigation
            if (
                !this.table.hasClass("top-fixed") &&
                $(document).height() > offsetTop + $(window).height() + 200
            ) {
                this.table.addClass("top-fixed").removeClass("top-scrolling");
                if (checkMQ() == "desktop") {
                    this.productsTopInfo.css("top", "0");
                    this.navigation.find("a").css("top", "0px");
                }
            }
        } else if (offsetTop <= scrollTop) {
            //product top-info && arrows navigation -  scroll with table
            this.table.removeClass("top-fixed").addClass("top-scrolling");
            if (checkMQ() == "desktop") {
                this.productsTopInfo.css(
                    "top",
                    this.tableHeight - this.topInfoHeight + "px"
                );
                this.navigation
                    .find("a")
                    .css("top", this.tableHeight - this.topInfoHeight + "px");
            }
        } else {
            //product top-info && arrows navigation -  reset style
            this.table.removeClass("top-fixed top-scrolling");
            this.productsTopInfo.attr("style", "");
            this.navigation.find("a").attr("style", "");
        }

        this.updateLeftScrolling();
    };

    productsTable.prototype.updateProperties = function() {
        this.tableHeight = this.table.height();
        this.productWidth = this.products.eq(0).width();
        this.topInfoHeight = this.featuresTopInfo.innerHeight() + 30;
        this.tableColumns.css(
            "width",
            this.productWidth * this.productsNumber + "px"
        );
    };

    productsTable.prototype.showSelection = function() {
        this.element.addClass("filtering");
        this.filterProducts();
    };

    productsTable.prototype.resetSelection = function() {
        this.tableColumns.css(
            "width",
            this.productWidth * this.productsNumber + "px"
        );
        this.element.removeClass("no-product-transition");
        this.resetProductsVisibility();
    };

    productsTable.prototype.updateProductTable = function() {
        var self = this,
            containerOffsetLeft = self.tableColumns.offset().left,
            scrollLeft = self.productsWrapper.scrollLeft(),
            selectedProducts = $(".cd-products-columns").find(".product"),
            numberProducts = selectedProducts.length;
        selectedProducts.each(function(index) {
            var product = $(this),
                leftTranslate =
                    containerOffsetLeft +
                    index * self.productWidth +
                    scrollLeft -
                    product.offset().left;
            setTranformX(product, 0);

            if (index == numberProducts - 1) {
                product.one(
                    "webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend",
                    function() {
                        setTimeout(function() {
                            self.element.addClass("no-product-transition");
                        }, 50);
                        setTimeout(function() {
                            // self.element.addClass("filtered");
                            self.productsWrapper.scrollLeft();
                            self.tableColumns.css(
                                "width",
                                self.productWidth * numberProducts + "px"
                            );
                            selectedProducts.attr("style", "");
                            product.off(
                                "webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend"
                            );
                            self.updateNavigationVisibility(0);
                        }, 100);
                    }
                );
            }

            checkResize();
        });

        if ($(".no-csstransitions").length > 0) {
            //browser not supporting css transitions
            // self.element.addClass("filtered");
            self.productsWrapper.scrollLeft(0);
            self.tableColumns.css(
                "width",
                self.productWidth * numberProducts + "px"
            );
            // selectedProducts.attr("style", "");
            self.updateNavigationVisibility(0);
        }
        // checkResize();
        //End
    };
    productsTable.prototype.filterProducts = function() {
        var self = this,
            containerOffsetLeft = self.tableColumns.offset().left,
            scrollLeft = self.productsWrapper.scrollLeft(),
            selectedProducts = this.products.filter(".selected"),
            numberProducts = selectedProducts.length;

        selectedProducts.each(function(index) {
            var product = $(this),
                leftTranslate =
                    containerOffsetLeft +
                    index * self.productWidth +
                    scrollLeft -
                    product.offset().left;
            setTranformX(product, leftTranslate);

            if (index == numberProducts - 1) {
                product.one(
                    "webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend",
                    function() {
                        setTimeout(function() {
                            self.element.addClass("no-product-transition");
                        }, 50);
                        setTimeout(function() {
                            self.element.addClass("filtered");
                            self.productsWrapper.scrollLeft(0);
                            self.tableColumns.css(
                                "width",
                                self.productWidth * numberProducts + "px"
                            );
                            selectedProducts.attr("style", "");
                            product.off(
                                "webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend"
                            );
                            self.updateNavigationVisibility(0);
                        }, 100);
                    }
                );
            }
        });

        if ($(".no-csstransitions").length > 0) {
            //browser not supporting css transitions
            self.element.addClass("filtered");
            self.productsWrapper.scrollLeft(0);
            self.tableColumns.css(
                "width",
                self.productWidth * numberProducts + "px"
            );
            selectedProducts.attr("style", "");
            self.updateNavigationVisibility(0);
        }
    };

    productsTable.prototype.resetProductsVisibility = function() {
        var self = this,
            containerOffsetLeft = self.tableColumns.offset().left,
            selectedProducts = this.products.filter(".selected"),
            numberProducts = selectedProducts.length,
            scrollLeft = self.productsWrapper.scrollLeft(),
            n = 0;

        self.element.addClass("no-product-transition").removeClass("filtered");

        self.products.each(function(index) {
            var product = $(this);
            if (product.hasClass("selected")) {
                n = n + 1;
                var leftTranslate = (-index + n - 1) * self.productWidth;
                setTranformX(product, leftTranslate);
            }
        });

        setTimeout(function() {
            self.element.removeClass("no-product-transition filtering");
            setTranformX(selectedProducts, "0");
            selectedProducts.removeClass("selected").attr("style", "");
        }, 50);
    };

    productsTable.prototype.updateSlider = function(bool) {
        var scrollLeft = this.productsWrapper.scrollLeft();
        scrollLeft = bool
            ? scrollLeft + this.productWidth
            : scrollLeft - this.productWidth;

        if (scrollLeft < 0) scrollLeft = 0;
        if (
            scrollLeft >
            this.tableColumns.outerWidth(true) - this.productsWrapper.width()
        )
            scrollLeft =
                this.tableColumns.outerWidth(true) -
                this.productsWrapper.width();

        this.productsWrapper.animate({ scrollLeft: scrollLeft }, 200);
    };

    var comparisonTables = [];
    $(".cd-products-comparison-table").each(function() {
        //create a productsTable object for each .cd-products-comparison-table
        comparisonTables.push(new productsTable($(this)));
    });

    if (comparisonTables.length > 0) {
        checkResize();
    }

    var windowScrolling = false;
    //detect window scroll - fix product top-info on scrolling
    // $(window).on("scroll", function() {
    //     if (!windowScrolling) {
    //         windowScrolling = true;
    //         !window.requestAnimationFrame
    //             ? setTimeout(checkScrolling, 250)
    //             : window.requestAnimationFrame(checkScrolling);
    //     }
    // });

    var windowResize = false;
    //detect window resize - reset .cd-products-comparison-table properties
    $(window).on("resize", function() {
        if (!windowResize) {
            windowResize = true;
            !window.requestAnimationFrame
                ? setTimeout(checkResize, 250)
                : window.requestAnimationFrame(checkResize);
        }
    });

    function checkScrolling() {
        var scrollTop = $(window).scrollTop();
        comparisonTables.forEach(function(element) {
            element.updateTopScrolling(scrollTop);
        });

        windowScrolling = false;
    }

    function checkResize() {
        comparisonTables.forEach(function(element) {
            element.updateProperties();
        });

        windowResize = false;
    }

    function checkMQ() {
        //check if mobile or desktop device
        return window
            .getComputedStyle(comparisonTables[0].element.get(0), "::after")
            .getPropertyValue("content")
            .replace(/'/g, "")
            .replace(/"/g, "");
    }

    function setTranformX(element, value) {
        element.css({
            "-moz-transform": "translateX(" + value + "px)",
            "-webkit-transform": "translateX(" + value + "px)",
            "-ms-transform": "translateX(" + value + "px)",
            "-o-transform": "translateX(" + value + "px)",
            transform: "translateX(" + value + "px)",
        });
    }
});
