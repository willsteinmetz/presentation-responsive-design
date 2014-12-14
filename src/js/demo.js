
/*
 * @file demo.coffee
 * @author Will Steinmetz <will.steinmetz@scimedsolutions.com>
 * basic functionality for the demo site
 */
$(function() {
  $('.l-site-header').on('click', '.fa-navicon:visible', function(e) {
    return $('.l-site-header, main, .l-site-footer').toggleClass('is-slid');
  });
  return $(window).on('resize', function(e) {
    var $nav, $window;
    $nav = $('.l-top-nav ul');
    $window = $(e.currentTarget);
    if ($window.width() <= 567) {
      return $nav.removeClass('nav-horizontal').addClass('nav-vertical');
    } else {
      $nav.addClass('nav-horizontal').removeClass('nav-vertical');
      return $('.is-slid').removeClass('is-slid');
    }
  });
});
