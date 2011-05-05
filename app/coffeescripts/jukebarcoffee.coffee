jQuery($ =>
  $(".vote").tap( ->
    @that = $(this)
    setTimeout ( => @that.removeClass "ui-btn-active" ), 500
  )
)
# 
# $(function() {
#   $(".vote").tap(function(e) {
#     console.log($(this));
#     var that = $(this);
#     setTimeout(function() {
#       that.removeClass("ui-btn-active");
#     }, 1000);
#   });
# });
