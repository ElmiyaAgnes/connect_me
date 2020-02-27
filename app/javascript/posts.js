import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

$( document ).ready(function() {
  console.log('hi')
  $('#user_id').select2({
    placeholder: 'Select users',
    multiple: true
  })
});