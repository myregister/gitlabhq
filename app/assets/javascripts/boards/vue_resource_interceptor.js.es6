/* eslint-disable func-names, prefer-arrow-callback, no-unused-vars */
/* global Vue */

Vue.http.interceptors.push((request, next) => {
  Vue.activeResources = Vue.activeResources ? Vue.activeResources + 1 : 1;

  next(function (response) {
    Vue.activeResources -= 1;
  });
});
