root = global ? window
 
#this is to deal with turbo links, and page loading/back button issues
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
      
thisApp = root.thisApp

thisApp.controller "WelcomeCtrl", ->



