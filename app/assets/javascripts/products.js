document.addEventListener('turbolinks:load', function() {
  var products = new Vue({
    el: '#products',
    data: {
      products: []
    },
    mounted: function() {
      var that;
      that = this;
      $.ajax({
        url: '/products.json',
        success: function(res) {
          that.products = res;
        }
      });
    }
  });
});
