Jim Jam Crafts
==============

Jim Jam Crafts is a site for downloading pdf pattern files to accompany physical
diy/crafting kits sold at the [Jim Jam Crafts Etsy
store](http://jimjamcrafts.etsy.com).

It is a Rails app with two Angular apps on the front end, one public and one admin.

### Features include:

* A custom [base Model class in Angular](./app/assets/javascripts/angular/model.js) to wrap $http
* Modularized Angular factories, directives and controllers for shared use across the two front-end apps
* [Use of the Etsy API to find image urls](./app/models/pattern.rb) for listings
* Filepicker for uploading and downloading the pdf pattern files
* __In progress:__ Content polymorphism in the Rails Pattern class to allow for both Etsy API-generated and manually generated content
