$(document).on('turbolinks:load', () => {
    M.AutoInit();
    $(document).ready(() => $('.tooltipped').tooltip());
});