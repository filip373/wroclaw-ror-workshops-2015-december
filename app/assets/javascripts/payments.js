$(function() {
  if ($('.reports.payments').length === 0) return;
  var table = $('#payments-table').DataTable({
    ajax: '/reports/payments.json'
  });
});
