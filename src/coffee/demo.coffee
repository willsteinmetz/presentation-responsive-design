###
# @file demo.coffee
# @author Will Steinmetz <will.steinmetz@scimedsolutions.com>
# basic functionality for the demo site
###

$ ->
  $('.l-site-header').on 'click', '.fa-navicon:visible', (e) ->
    $('.l-site-header, main, .l-site-footer').toggleClass('is-slid')
  $(window).on 'resize', (e) ->
    $nav = $('.l-top-nav ul')
    $window = $(e.currentTarget)
    if $window.width() <= 567
      $nav.removeClass('nav-horizontal')
      .addClass('nav-vertical')
    else
      $nav.addClass('nav-horizontal')
      .removeClass('nav-vertical')
      $('.is-slid').removeClass('is-slid')
