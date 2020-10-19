function initTransactionActions(){
  $('a.year-link').on('click', function(e){
    $('a.year-link').removeClass('active');
    $(e.currentTarget).addClass('active');
  })

  $('.new-withdraw').on('click', function (e) {
    $.get($(this).data('path'))
    .done(function( data ) {
      $('#transactionModal .modal-content').html(data);
      initSubmitTransaction();
    });
  });

  $('.edit-transaction').on('click', function (e) {
    $.get($(this).data('path'))
    .done(function( data ) {
      $('#transactionModal .modal-content').html(data);
      initSubmitTransaction();
    });

    $('#transactionModal').modal('show');    
  })

  $('.new-payment').on('click', function (e) {
    $.get($(this).data('path'))
    .done(function( data ) {
      $('#transactionModal .modal-content').html(data);
      initSubmitTransaction();
    });
  });
}

function initSubmitTransaction(){

  $('button.transaction-save').on('click', function(e) {
    e.preventDefault();
   
    $.ajax({url: $(this).data('path'), 
            method: $(this).data('http-verb'),
            data: getTransaction()
    })
    .done(function(data) {
      $('#transactionModal').modal('hide');
      $('#transactionModal').on('hidden.bs.modal', function (e) {
        $('#nav-transactions').html(data);
      })        
    })
    .fail(function(data) {
      $('#transactionModal .modal-content').html(data.responseText);
      initSubmitTransaction();
    });
  });
}

function getTransaction() {
  var result = { };
  $.each($('form').serializeArray(), function() {
    result[this.name] = this.value.replace(/[.]/g, '').replace(/[,]/g, '.');
  });
  
  return result;
}
 
// $('.currency-brl').mask('#.##0,00', {reverse: true});
// $('.currency').mask('#.##0,00000', {reverse: true});


