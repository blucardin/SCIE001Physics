/* Hides the "Delete My Account" button from User Profile setting */
$(function() {
  if (window.location.pathname == "/profile/settings") {
    $("a[href$='withdrawal-form']").hide();
  }
});

/*Hide Privacy Policy Element & Change Acceptable Use HTML Text*/
$(document).ready(function() {
  $('.terms_link').html('Acceptable Use and Privacy Policy');
  $('#footer-links > a[href="https://ubc.instructure.com/privacy_policy"]').hide();
  $('#footer-links > a[href="https://canvas.ubc.ca/privacy_policy"]').hide();
  $('.ic-Self-enrollment-footer__Secondary').hide();
});

/*INC4336169 Hide shared enrolments from user profiles as enrolment can be
 * confidential information. Root admins are exempt from this. */
$(function() {
  if (window.location.pathname.match(/^\/courses\/\d+\/users\/\d+/) &&
      ENV.current_user_roles.indexOf('root_admin') < 0)
  {
    $('.profileEnrollment__Items').parent().parent().remove();
  }
});
