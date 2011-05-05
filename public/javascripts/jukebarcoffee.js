/* DO NOT MODIFY. This file was compiled Thu, 05 May 2011 01:51:43 GMT from
 * /Users/coryforsyth/Sites/jukebar_server/app/coffeescripts/jukebarcoffee.coffee
 */

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  jQuery($(__bind(function() {
    return $(".vote").tap(function() {
      this.that = $(this);
      return setTimeout((__bind(function() {
        return this.that.removeClass("ui-btn-active");
      }, this)), 500);
    });
  }, this)));
}).call(this);
