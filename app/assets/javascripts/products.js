document.addEventListener('turbolinks:load', function() {
  var products = new Vue({
    el: '#products',
    data: {
      products: [],
      page: 1,
      minimum: "",
      maximum: "",
      sortBy: "",
      selectedCategory: "",
      available: "",
    },
    methods: {
      filterChanged: function() {
        this.page = 1;
        this.fetchProducts();
      },
      fetchProducts: function() {
        var that;
        that = this;
        $.ajax({
          url: '/products.json?category=' + this.selectedCategory + "&page=" + this.page+ "&minimum=" + this.minimum + "&maximum=" + this.maximum + "&sortBy=" + this.sortBy + "&available=" + this.available,
          success: function(res) {
            that.products = res;
          }
        });
      },

      nextPage: function() {
        this.page = this.page + 1;
        this.fetchProducts();
      },

      previousPage: function() {
        this.page = this.page - 1;
        this.fetchProducts();
      },

    },
    mounted: function() {
      this.fetchProducts();
    }
  });
});
